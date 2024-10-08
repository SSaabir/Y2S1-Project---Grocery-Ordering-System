package freshco.Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freshco.Model.CustomerDBUtil;



public class DeleteCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteCustomer() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Get the customer ID from the request
	        int CusID = Integer.parseInt(request.getParameter("CusID"));

	        // Call the deleteCustomer method from your database class
	        boolean isDeleted = CustomerDBUtil.deleteCustomer(CusID);

	        if (isDeleted) {
	            // Redirect to a success page
	            response.sendRedirect("logout");
	        } else {
	            // Redirect to an error page
	            response.sendRedirect("error.jsp");
	        }
	    }
	}
