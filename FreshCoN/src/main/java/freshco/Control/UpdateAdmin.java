package freshco.Control;
import freshco.Model.AdminDBUtil;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@MultipartConfig
public class UpdateAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
    	HttpSession session = request.getSession();
        int AID = (int) session.getAttribute("ID");
        String fName = request.getParameter("fName");
        String lName = request.getParameter("lName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        RequestDispatcher dispatcher = request.getRequestDispatcher("UploadImage");
        dispatcher.include(request, response); // Include ImageUploadServlet's response in this servlet

        String imgUrl = (String) request.getAttribute("imageUrl"); 
        // Call the method to update admin
        boolean isUpdated;
        if (imgUrl != null) {
            isUpdated = AdminDBUtil.updateAdmin(AID, fName, lName, email, imgUrl, phone,  password);
        } else {
            isUpdated = AdminDBUtil.updateAdminWithoutImage(AID, fName, lName, email, phone,  password);
        }
        // Redirect or forward based on the result
        if (isUpdated) {
        	request.setAttribute("email", email);
            request.setAttribute("password", password);
            
        	RequestDispatcher userValidationDispatcher = request.getRequestDispatcher("login");
            userValidationDispatcher.forward(request, response); // Redirect to admin list page on success
        } else {
            request.setAttribute("errorMessage", "Failed to update admin. Please try again.");
			RequestDispatcher dispatcher1 = request.getRequestDispatcher("EditProfile.jsp");
			dispatcher1.forward(request, response);
        }
    }
}
