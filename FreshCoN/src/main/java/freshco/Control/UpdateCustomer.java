package freshco.Control;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import freshco.Model.CustomerDBUtil;


@WebServlet("/UpdateCustomer")
public class UpdateCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateCustomer() {
        super();
   
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		        int id = Integer.parseInt(request.getParameter("id"));
		    	String fname = request.getParameter("fname");
	         	String lname = request.getParameter("lname");
	         	String email = request.getParameter("email");
	         	String lane = request.getParameter("lane");
	         	String city = request.getParameter("city");
	         	String dob = request.getParameter("dob");
	         	String imgUrl = request.getParameter("imgUrl");
	         	String username = request.getParameter("username");
	         	String password = request.getParameter("password");

		        // Call the updateCustomermethod from your database class
		        boolean isUpdated = CustomerDBUtil.updateCustomer(id, fname,lname,email,lane,city,dob,imgUrl,username,password);

		        if (isUpdated) {
		            // Redirect or inform the user of success
		            response.sendRedirect("");
		        } else {
		            // Handle the failure case, such as redirecting to an error page
		            response.sendRedirect("");
		        }
		    }

}