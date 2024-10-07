package freshco.Control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import freshco.Beans.CartProducts;

public class AddCartProducts extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve request parameters
        int productId = Integer.parseInt(request.getParameter("pid")); // Get product ID from request
        String productName = request.getParameter("productName"); // Get product name
        String netPriceStr = request.getParameter("netPrice"); // Get product price as String
        String quantityStr = request.getParameter("quantity"); // Get quantity from request as String
        String discountStr = request.getParameter("discount"); // Get product discount as String
        String imgUrl = request.getParameter("imgUrl"); // Get image URL

        // Default values
        double netPrice = 0.0;
        int quantity = 1;
        double discount = 0.0;

        // Handle potential null values for netPrice, quantity, and discount
        try {
            if (netPriceStr != null && !netPriceStr.isEmpty()) {
                netPrice = Double.parseDouble(netPriceStr);
            }
            if (quantityStr != null && !quantityStr.isEmpty()) {
                quantity = Integer.parseInt(quantityStr);
            }
            if (discountStr != null && !discountStr.isEmpty()) {
                discount = Double.parseDouble(discountStr);
            }
        } catch (NumberFormatException e) {
            // Handle number format issues gracefully
            response.sendRedirect("errorPage.jsp");
            return; // Stop execution if an error occurs
        }

        // Get session and cart items
        HttpSession session = request.getSession();
        List<CartProducts> cartItems = (List<CartProducts>) session.getAttribute("cartItems");

        // Initialize cartItems if it's null
        if (cartItems == null) {
            cartItems = new ArrayList<>();
            session.setAttribute("cartItems", cartItems);
        }

        // Check if the product already exists in the cart
        boolean productExists = false;
        for (CartProducts item : cartItems) {
            if (item.getPid() == productId) {
                // Update quantity if the product exists
                item.setQuantity(item.getQuantity() + quantity);
                productExists = true;
                break; // Exit loop once the product is found
            }
        }

        // If product doesn't exist in the cart, add it
        if (!productExists) {
            CartProducts newProduct = new CartProducts(productName, quantity, netPrice, discount, imgUrl, productId);
            cartItems.add(newProduct);
        }

        // Redirect to the product page or cart page
        response.sendRedirect("Shop"); // Redirect to shop page after adding to cart
    }
}
