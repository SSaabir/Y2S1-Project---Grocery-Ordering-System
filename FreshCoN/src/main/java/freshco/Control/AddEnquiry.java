package freshco.Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import freshco.Model.EnquiryDBUtil;


@WebServlet("/AddEnquiry")
public class AddEnquiry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEnquiry() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		     
		
     	            String subject = request.getParameter("subject");
                   	String comments = request.getParameter("comments");
     	            String response = request.getParameter("response");
		
		
	      
		        
		        boolean isInserted = EnquiryDBUtil.insertEnquiry(subject,comments,response);

		        if (isInserted) {
		            // Redirect or inform the user of success
		            response.sendRedirect("login.jsp");
		        } //else {
		            // Handle the failure case, such as redirecting to an error page
		            response.sendRedirect("");
		       // }
		    }
	

}
