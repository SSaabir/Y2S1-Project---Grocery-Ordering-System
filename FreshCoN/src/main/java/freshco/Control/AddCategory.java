package freshco.Control;

import freshco.Model.CategoryDBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddCategoryServlet")
public class AddCategory extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddCategory() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryName = request.getParameter("categoryName");

        boolean isSuccess = CategoryDBUtil.insertCategory(categoryName);

        if (isSuccess) {
            response.sendRedirect("ViewCategoryServlet");  // Redirect to the view servlet
        } else {
            request.setAttribute("errorMessage", "Failed to add category.");
            request.getRequestDispatcher("addCategory.jsp").forward(request, response);
        }
    }
}

