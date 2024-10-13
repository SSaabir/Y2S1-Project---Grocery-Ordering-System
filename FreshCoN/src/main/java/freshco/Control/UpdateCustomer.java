package freshco.Control;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import freshco.Model.CustomerDBUtil;


@MultipartConfig
public class UpdateCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		        int CusID = (int) session.getAttribute("ID");
		    	String fName = request.getParameter("fName");
	         	String lName = request.getParameter("lName");
	         	String email = request.getParameter("email");
	         	String phone = request.getParameter("phone");
	         	String lane = request.getParameter("lane");
	         	String city = request.getParameter("city");
	         	String password = request.getParameter("password");

	         	RequestDispatcher dispatcher = request.getRequestDispatcher("UploadImage");
	            dispatcher.include(request, response); // Include ImageUploadServlet's response in this servlet

	            String imgUrl = (String) request.getAttribute("imageUrl"); 
		        // Call the updateCustomermethod from your database class

		        boolean isUpdated;
		        if (imgUrl != null) {
		            isUpdated = CustomerDBUtil.updateCustomer(CusID,fName,lName,email,phone,imgUrl,lane,city, password);
		        } else {
		            isUpdated = CustomerDBUtil.updateCustomerWithoutImage(CusID,fName,lName,email,phone,lane,city, password);
		        }
		        
		        if (isUpdated) {
		        	request.setAttribute("email", email);
		            request.setAttribute("password", password);
		            
		        	RequestDispatcher userValidationDispatcher = request.getRequestDispatcher("login");
		            userValidationDispatcher.forward(request, response);
		        } else {
		        	request.setAttribute("errorMessage", "Failed to update customer. Please try again.");
					RequestDispatcher dispatcher1 = request.getRequestDispatcher("EditProfile.jsp");
					dispatcher1.forward(request, response);
		        }
		    }

}
