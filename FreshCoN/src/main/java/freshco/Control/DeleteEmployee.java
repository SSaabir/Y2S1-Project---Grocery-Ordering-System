package freshco.Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freshco.Model.EmployeeDBUtil;


@WebServlet("/DeleteEmployee")
public class DeleteEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteEmployee() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Get the employee ID from the request
	        int EmID = Integer.parseInt(request.getParameter("EmID"));

	        // Call the deleteEmployee method from your database class
	        boolean isDeleted = EmployeeDBUtil.deleteEmployee(EmID);

	        if (isDeleted) {
	            // Redirect to a success page
	            response.sendRedirect("logout");
	        } else {
	            // Redirect to an error page
	            response.sendRedirect("");
	        }
	    }
	}
