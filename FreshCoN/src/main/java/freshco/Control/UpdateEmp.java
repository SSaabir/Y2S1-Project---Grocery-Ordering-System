package freshco.Control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import freshco.Model.EmployeeDBUtil;
@MultipartConfig
public class UpdateEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;

@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int EmID = (int) session.getAttribute("ID");

	        String email = request.getParameter("email");
	        String phone = request.getParameter("phone");
	        String password = request.getParameter("password");

	        // Include the UploadImage servlet's response
	        RequestDispatcher dispatcher = request.getRequestDispatcher("UploadImage");
	        dispatcher.include(request, response);

	        // Retrieve the image URL from the request attributes
	        String imgUrl = (String) request.getAttribute("imageUrl");

	        // Call the updateEmployee method from your database class
	        boolean isUpdated = EmployeeDBUtil.updateEmployee(EmID, email, imgUrl, phone, password);

	        // Handle success or failure
	        if (isUpdated) {
	            // Redirect to the dashboard on success
	            response.sendRedirect("dashboard.jsp");
	        } else {
	        	request.setAttribute("errorMessage", "Failed to update Employee. Please try again.");
				RequestDispatcher dispatcher1 = request.getRequestDispatcher("EditProfile.jsp");
				dispatcher1.forward(request, response);
	        }
	    }
	}

