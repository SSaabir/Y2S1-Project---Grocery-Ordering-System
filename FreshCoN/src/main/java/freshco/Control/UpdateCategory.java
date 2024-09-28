package freshco.Control;

import freshco.Model.CategoryDBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateCategoryServlet")
public class UpdateCategory extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateCategory() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int CID = Integer.parseInt(request.getParameter("CID"));
        String categoryName = request.getParameter("categoryName");

        boolean isSuccess = CategoryDBUtil.updateCategory(CID, categoryName);

        if (isSuccess) {
            response.sendRedirect("ViewCategoryServlet");  // Redirect to the view servlet
        } else {
            request.setAttribute("errorMessage", "Failed to update category.");
            request.getRequestDispatcher("updateCategory.jsp").forward(request, response);
        }
    }
}
