package freshco.Control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import freshco.Beans.Product;
import freshco.Model.ProductDBUtil;

public class AddProductSale extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the cartItems parameter
        String cartItemsParam = request.getParameter("cartItems");

        // Parse the cart items into a Map
        Map<String, Product> cartItems = parseCartItems(cartItemsParam);

        // Get the customer ID from session
        HttpSession session = request.getSession();
        Integer cusID = (Integer) session.getAttribute("ID"); // Make sure to set this during login

        if (cusID == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Customer ID is missing.");
            return;
        }

        // Use the addProductSale method to add all items
        boolean isSuccess = ProductDBUtil.addProductSale(cartItems, cusID);

        if (isSuccess) {
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to add some products.");
        }
    }

    // Method to parse the cartItems parameter
    private Map<String, Product> parseCartItems(String json) {
        Map<String, Product> cartItems = new HashMap<>();

        if (json == null || json.isEmpty()) {
            return cartItems; // Return an empty map if the input is invalid
        }

        // Basic parsing logic assuming the format is:
        // { "ProductName1": { "price": 10.0, "quantity": 2 }, "ProductName2": { "price": 15.0, "quantity": 1 } }
        json = json.substring(1, json.length() - 1); // Remove outer braces
        String[] items = json.split(",(?=\\s*\"[^\"]+\")"); // Split into individual items based on comma, but not inside braces

        for (String item : items) {
            String[] parts = item.split(":");
            String productName = parts[0].trim().replace("\"", ""); // Clean product name

            // Extract price and quantity from the nested object
            String values = parts[1].trim();
            values = values.substring(1, values.length() - 1); // Remove braces from the nested object
            String[] valueParts = values.split(",");

            float price = 0;
            int quantity = 0;

            for (String valuePart : valueParts) {
                String[] kv = valuePart.split(":");
                String key = kv[0].trim().replace("\"", "");
                String val = kv[1].trim();

                if ("price".equals(key)) {
                    price = Float.parseFloat(val);
                } else if ("quantity".equals(key)) {
                    quantity = Integer.parseInt(val);
                }
            }

            cartItems.put(productName, new Product(productName, price, quantity)); // Add product to map
        }

        return cartItems;
    }
}
