package freshco.Control;

import freshco.Model.AdminDBUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateAdmin")
public class UpdateAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public UpdateAdmin() {
        super();
	}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        int AID = Integer.parseInt(request.getParameter("AID")); // Assuming AID is passed as a hidden input
        String fName = request.getParameter("fName");
        String lName = request.getParameter("lName");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String dob = request.getParameter("dob");
        String imgUrl = request.getParameter("imgUrl");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Call the method to update admin
        boolean isUpdated = AdminDBUtil.updateAdmin(AID, fName, lName, email, address, city, dob, imgUrl, phone, username, password);

        // Redirect or forward based on the result
        if (isUpdated) {
            response.sendRedirect("adminList.jsp"); // Redirect to admin list page on success
        } else {
            request.setAttribute("errorMessage", "Failed to update admin. Please try again.");
            request.getRequestDispatcher("editAdmin.jsp").forward(request, response); // Forward back to form with error
        }
    }
}
