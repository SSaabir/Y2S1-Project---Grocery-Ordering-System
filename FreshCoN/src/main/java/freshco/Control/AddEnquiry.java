package freshco.Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import freshco.Model.EnquiryDBUtil;



public class AddEnquiry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AddEnquiry() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		     
		 			String email = request.getParameter("email");
     	            String subject = request.getParameter("subject");
                   	String comments = request.getParameter("comments");
     	           
		
		
	      
		        
		        boolean isInserted = EnquiryDBUtil.insertEnquiry(email,subject,comments);

		        if (isInserted) {
		            // Redirect or inform the user of success
		            response.sendRedirect("index.jsp");
		        } else {
		            // Handle the failure case, such as redirecting to an error page
		            response.sendRedirect("");
		        }
		    }
	

}
