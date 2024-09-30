package freshco.Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freshco.Model.PaymentDBUtil;


@WebServlet("/DeleteEnquiry")
public class DeletePayment extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeletePayment() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Get the Payment ID from the request
	        int PID = Integer.parseInt(request.getParameter("PID"));

	        // Call the deletePayment method from your database class
	        boolean isDeleted = PaymentDBUtil.deletePayment(PID);

	        if (isDeleted) {
	            // Redirect to a success page
	            response.sendRedirect("");
	        } else {
	            // Redirect to an error page
	            response.sendRedirect("");
	        }
	    }
	}
