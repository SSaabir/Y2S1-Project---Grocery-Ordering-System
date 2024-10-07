package freshco.Control;

import freshco.Model.AdminDBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@MultipartConfig
public class AddAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String fName = request.getParameter("fName");
        String lName = request.getParameter("lName");
        String email = request.getParameter("email");
        String address = request.getParameter("Lane");
        String city = request.getParameter("city");
        String dob = request.getParameter("dob");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        RequestDispatcher dispatcher = request.getRequestDispatcher("UploadImage");
        dispatcher.include(request, response); // Include ImageUploadServlet's response in this servlet

        String imgUrl = (String) request.getAttribute("imageUrl"); 
     	
        
        // Call the method to add admin
        boolean isAdded = AdminDBUtil.addAdmin(fName, lName, email, address, city, dob, imgUrl, phone, password);

        // Redirect or forward based on the result
        if (isAdded) {
            response.sendRedirect("Admin"); // Redirect to admin list page on success
        } else {
            request.setAttribute("errorMessage", "Failed to add admin. Please try again.");
        }
    }
}
