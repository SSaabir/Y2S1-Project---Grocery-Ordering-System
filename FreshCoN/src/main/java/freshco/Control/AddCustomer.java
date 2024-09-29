package freshco.Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import freshco.Model.CustomerDBUtil;


@WebServlet("/AddCustomer")
public class AddCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		     
	         	String fname = request.getParameter("fname");
	         	String lname = request.getParameter("lname");
	         	String email = request.getParameter("email");
	         	String lane = request.getParameter("lane");
	         	String city = request.getParameter("city");
	         	String dob = request.getParameter("dob");
	         	String imgUrl = request.getParameter("imgUrl");
	         	String username = request.getParameter("username");
	         	String password = request.getParameter("password");

		        
		        boolean isInserted = CustomerDBUtil.insertCustomer(fname,lname,email,lane,city,dob,imgUrl,username,password);

		        if (isInserted) {
		            // Redirect or inform the user of success
		            response.sendRedirect("login.jsp");
		        } //else {
		            // Handle the failure case, such as redirecting to an error page
		            response.sendRedirect("");
		       // }
		    }
	

}
