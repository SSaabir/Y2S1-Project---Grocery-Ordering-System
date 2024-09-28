package freshco.Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import freshco.Model.EmployeeDBUtil;


@WebServlet("/AddEmplyeee")
public class AddEmplyeee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEmplyeee() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		        String email = request.getParameter("email");
		        String nic = request.getParameter("nic");
		        String dob = request.getParameter("dob");
		        String phone = request.getParameter("phone");
		        String username = request.getParameter("username");
		        String password = request.getParameter("password");

		        
		        boolean isInserted = EmployeeDBUtil.insertEmployee(email, nic, dob, phone, username, password);

		        if (isInserted) {
		            // Redirect or inform the user of success
		            response.sendRedirect("login.jsp");
		        } //else {
		            // Handle the failure case, such as redirecting to an error page
		            response.sendRedirect("");
		       // }
		    }
	

}
