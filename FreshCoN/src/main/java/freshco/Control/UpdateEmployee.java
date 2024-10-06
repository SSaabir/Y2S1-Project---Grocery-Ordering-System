package freshco.Control;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import freshco.Model.EmployeeDBUtil;


@WebServlet("/UpdateEmployee")
public class UpdateEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateEmployee() {
        super();
   
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		        int EmID = Integer.parseInt(request.getParameter("EmID"));
		        String email = request.getParameter("email");
		        String nic = request.getParameter("nic");
		        String dob = request.getParameter("dob");
		        String phone = request.getParameter("phone");
		        String password = request.getParameter("password");

		        // Call the updateEmployee method from your database class
		        boolean isUpdated = EmployeeDBUtil.updateEmployee(EmID, email, nic, dob, phone,  password);

		        if (isUpdated) {
		            // Redirect or inform the user of success
		            response.sendRedirect("");
		        } else {
		            // Handle the failure case, such as redirecting to an error page
		            response.sendRedirect("");
		        }
		    }

}
