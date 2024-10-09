package freshco.Control;

import freshco.Model.AdminDBUtil;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve admin ID from the request
        int AID = Integer.parseInt(request.getParameter("AID")); // Assuming AID is passed as a hidden input

        // Call the method to delete admin
        boolean isDeleted = AdminDBUtil.deleteAdmin(AID);

        // Redirect or forward based on the result
        if (isDeleted) {
            response.sendRedirect("logout"); // Redirect to admin list page on success
        } else {
            request.setAttribute("errorMessage", "Failed to delete admin. Please try again.");
            request.getRequestDispatcher("error.jsp").forward(request, response); // Forward back to admin list with error
        }
    }
}
