package freshco.Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freshco.Model.CustomerDBUtil;


@WebServlet("/DeleteCustomer")
public class DeleteCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteCustomer() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Get the customer ID from the request
	        int id = Integer.parseInt(request.getParameter("id"));

	        // Call the deleteCustomer method from your database class
	        boolean isDeleted = CustomerDBUtil.deleteCustomer(id);

	        if (isDeleted) {
	            // Redirect to a success page
	            response.sendRedirect("");
	        } else {
	            // Redirect to an error page
	            response.sendRedirect("");
	        }
	    }
	}
