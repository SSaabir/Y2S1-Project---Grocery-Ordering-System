import java.util.ArrayList;
import java.util.List;

public class CartItem {
    private List<CartItem> cartItems;

    public CartItem() {
        this.cartItems = new ArrayList<>();
    }

    // Method to add a product to the cart
    public void addProduct(int productID, String productName, double price, int quantity, double netPrice, int discount) {
        // Check if the product already exists in the cart
        for (CartItem item : cartItems) {
            if (item.getProduct().getProductID() == productID) {
                item.setQuantity(item.getQuantity() + quantity); // Update quantity
                return; // Exit after updating the quantity
            }
        }
        // If not found, add a new item to the cart
        Product product = new Product(productID, productName, price, quantity, netPrice, discount);
        cartItems.add(new CartItem(product, quantity));
    }

    // Method to remove a product from the cart
    public void removeProduct(int productID) {
        cartItems.removeIf(item -> item.getProduct().getProductID() == productID);
    }

    // Method to view the cart contents
    public void viewCart() {
        if (cartItems.isEmpty()) {
            System.out.println("Your cart is empty.");
            return;
        }
        System.out.println("Your Cart:");
        for (CartItem item : cartItems) {
            System.out.println(item);
        }
    }

    // Method to get the total price of the cart
    public double getTotalPrice() {
        double total = 0.0;
        for (CartItem item : cartItems) {
            total += item.getProduct().getNetPrice() * item.getQuantity(); // Calculate based on netPrice
        }
        return total;
    }
}
