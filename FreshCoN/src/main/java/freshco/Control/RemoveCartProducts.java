package freshco.Control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import freshco.Beans.CartProducts;

public class RemoveCartProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String productId = request.getParameter("pid");
	        HttpSession session = request.getSession();
	        List<CartProducts> cartItems = (List<CartProducts>) session.getAttribute("cartItems");

	        if (cartItems != null) {
	            cartItems.removeIf(item -> item.getPid().equals(productId)); // Remove item by product ID
	        }

	        // Redirect back to the cart page
	        response.sendRedirect("ViewCart"); // Use ViewCartServlet to refresh the cart view
	    }
	}
