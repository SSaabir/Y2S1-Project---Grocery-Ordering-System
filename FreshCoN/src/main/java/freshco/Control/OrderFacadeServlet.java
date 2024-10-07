package freshco.Control;

import freshco.Model.webDB;
import freshco.Beans.CartProducts;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class OrderFacadeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
		List<CartProducts> cartProducts = (List<CartProducts>) session.getAttribute("cartItems");
        String paymentMethod = request.getParameter("payment");

        String deliveryAddress; // Initialize deliveryAddress variable
        
        // Determine the delivery address based on user selection
        String addressType = request.getParameter("address");
        if ("existing".equals(addressType)) {
            // Get the existing address from session
            String lane = (String) session.getAttribute("lane");
            String city = (String) session.getAttribute("city");
            deliveryAddress = lane + ", " + city; // Concatenate lane and city for the address
        } else { // New address
            String newAddress = request.getParameter("deliveryAddress");
            deliveryAddress = newAddress; // Use the new address from the form
        }

        // Retrieve total amount from the request
        double totalAmount = Double.parseDouble(request.getParameter("totalAmount")); // Retrieve the total amount

        try {
            // Start transaction
            webDB.executeIUD("START TRANSACTION");

            int paymentId = createPayment(paymentMethod);
            int saleId = createSale(deliveryAddress, paymentId, (int) session.getAttribute("ID"), totalAmount);
            createProductSale(saleId, cartProducts);

            // Commit transaction
            webDB.executeIUD("COMMIT");
            // Clear cart or update session as needed
            cartProducts.clear();
            session.setAttribute("cartProducts", cartProducts);
            response.sendRedirect("FreshCo"); // Redirect to a success page

        } catch (Exception e) {
            e.printStackTrace();
            try {
                webDB.executeIUD("ROLLBACK"); // Rollback transaction on error
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
            response.sendRedirect("error.jsp"); // Redirect to an error page
        }
    }

    private int createPayment(String paymentMethod) throws Exception {
        int status = paymentMethod.equals("card") ? 1 : 0; // Set status based on payment method
        String sql = "INSERT INTO Payment (payMethod, payStatus) VALUES ('" + paymentMethod + "', " + status + ")";
        
        Integer affectedRows = webDB.executeIUD(sql);
        if (affectedRows == 0) {
            throw new SQLException("Creating payment failed, no rows affected.");
        }

        // Get the last inserted ID (payment ID)
        ResultSet rs = webDB.executeSearch("SELECT LAST_INSERT_ID() AS paymentId");
        if (rs.next()) {
            return rs.getInt("paymentId");
        } else {
            throw new SQLException("Creating payment failed, no ID obtained.");
        }
    }

    private int createSale(String address, int paymentId, int customerId, double totalAmount) throws Exception {
        String sql = "INSERT INTO Sale (orderDate, totalAmount, address, orderStatus, CusID, PID) VALUES (NOW(), "
                + totalAmount + ", '" + address + "', FALSE, " + customerId + ", " + paymentId + ")";
        Integer affectedRows = webDB.executeIUD(sql);
        if (affectedRows == 0) {
            throw new SQLException("Creating sale failed, no rows affected.");
        }

        // Get the last inserted ID (sale ID)
        ResultSet rs = webDB.executeSearch("SELECT LAST_INSERT_ID() AS saleId");
        if (rs.next()) {
            return rs.getInt("saleId");
        } else {
            throw new SQLException("Creating sale failed, no ID obtained.");
        }
    }

    private void createProductSale(int saleId, List<CartProducts> cartItems) throws Exception {
        for (CartProducts product : cartItems) {
            if (product == null) {
                throw new Exception("One of the cart products is null");
            } else {
                // Construct the SQL query using the provided saleId, product ID, and quantity
                String sql = "INSERT INTO Product_Sale (OID, PrID, quantity) VALUES (" 
                            + saleId + ", " 
                            + product.getPid() + ", " 
                            + product.getQuantity() + ")";
                // Log the SQL statement for debugging purposes
                System.out.println("Executing SQL: " + sql);
                
                // Execute the SQL query
                webDB.executeIUD(sql);
                // Update the product quantity
                updateProductQuantity(product.getPid(), product.getQuantity());
            }
        }
    }


    private void updateProductQuantity(int string, int quantity) throws Exception {
        String sql = "UPDATE Product SET quantity = quantity - " + quantity + " WHERE PrID = " + string;
        webDB.executeIUD(sql);
    }
}
