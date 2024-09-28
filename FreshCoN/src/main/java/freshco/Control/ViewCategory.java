package freshco.Control;

import freshco.Beans.Category;
import freshco.Model.CategoryDBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ViewCategoryServlet")
public class ViewCategory extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ViewCategory() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Category> categoryList = CategoryDBUtil.getAllCategories();
            request.setAttribute("categoryList", categoryList);
            request.getRequestDispatcher("viewCategories.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
