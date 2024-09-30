package freshco.Control;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import freshco.Model.PaymentDBUtil;


@WebServlet("/ViewPayment")
public class ViewPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ViewPayment() {
        super();
   
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	
     	
		
		        int PID = Integer.parseInt(request.getParameter("PID"));
		        String payMethod = request.getParameter("payMethod");
	         	boolean payStatus = request.getParameter("payStatus") != null;
	         	
	         	
	         

		        // Call the updatePaymentmethod from your database class
		        boolean isUpdated = PaymentDBUtil.updatePayment(PID, payMethod,payStatus);

		        if (isUpdated) {
		            // Redirect or inform the user of success
		            response.sendRedirect("");
		        } else {
		            // Handle the failure case, such as redirecting to an error page
		            response.sendRedirect("");
		        }
		    }

}
