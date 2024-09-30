package freshco.Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freshco.Model.EnquiryDBUtil;


@WebServlet("/DeleteEnquiry")
public class DeleteEnquiry extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteEnquiry() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Get the Enquiry ID from the request
	        int EnID = Integer.parseInt(request.getParameter("EnID"));

	        // Call the deleteEnquiry method from your database class
	        boolean isDeleted = EnquiryDBUtil.deleteEnquiry(EnID);

	        if (isDeleted) {
	            // Redirect to a success page
	            response.sendRedirect("");
	        } else {
	            // Redirect to an error page
	            response.sendRedirect("");
	        }
	    }
	}