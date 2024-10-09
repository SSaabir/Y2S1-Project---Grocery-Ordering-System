package freshco.Control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import freshco.Model.CustomerDBUtil;


@MultipartConfig
public class AddCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		     
	         	String fName = request.getParameter("fName");
	         	String lName = request.getParameter("lName");
	         	String email = request.getParameter("email");
	         	String phone = request.getParameter("phone");
	         	String lane = request.getParameter("lane");
	         	String city = request.getParameter("city");
	         	String dob = request.getParameter("dob");
	         	String password = request.getParameter("password");
	         	
	         	RequestDispatcher dispatcher = request.getRequestDispatcher("UploadImage");
	            dispatcher.include(request, response); // Include ImageUploadServlet's response in this servlet

	            String imgUrl = (String) request.getAttribute("imageUrl"); 
	         	

		        
		        boolean isInserted = CustomerDBUtil.insertCustomer(fName,lName,email,phone,lane,city,dob,imgUrl,password);

		        if (isInserted) {
		            // Redirect or inform the user of success
		            response.sendRedirect("login.jsp");
		        } else {
		            // Handle the failure case, such as redirecting to an error page
		            response.sendRedirect("");
		        }
		    }
	

}
