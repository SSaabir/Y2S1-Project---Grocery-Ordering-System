package freshco.Control;

import freshco.Model.CategoryDBUtil;
import freshco.Beans.Category;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


public class AddCategory extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String category_Name = request.getParameter("category_Name");
        String imgUrl = request.getParameter("imgUrl");
        
        
        
      

        boolean isSuccess = CategoryDBUtil.insertCategory(category_Name, imgUrl);

        if (isSuccess) {
            response.sendRedirect("Category");
        } else {
            response.sendRedirect("error.jsp");
        }
    }

}
