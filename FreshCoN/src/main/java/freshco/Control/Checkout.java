package freshco.Control;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import freshco.Beans.CartProducts;

public class Checkout extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get session
        HttpSession session = request.getSession();

        // Retrieve cart items from session
        List<CartProducts> cartItems = (List<CartProducts>) session.getAttribute("cartItems");

        // Check if cart items exist
        if (cartItems == null || cartItems.isEmpty()) {
            // Redirect to an error page or empty cart page if no items are present
            response.sendRedirect("emptyCart.jsp");
            return;
        }

        // Set cart items as request attribute to access in JSP
        request.setAttribute("cartItems", cartItems);

        // Forward to checkout.jsp
        request.getRequestDispatcher("PlaceOrder.jsp").forward(request, response);
    }
}
