package freshco.Control;

import freshco.Model.CategoryDBUtil;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class AddCategory extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the category name from the form
        String category_Name = request.getParameter("category_Name");
     // Get session details
        HttpSession session = request.getSession();
        Integer ID = (Integer) session.getAttribute("ID");

        
        RequestDispatcher dispatcher = request.getRequestDispatcher("UploadImage");
        dispatcher.include(request, response); // Include ImageUploadServlet's response in this servlet

        String imgUrl = (String) request.getAttribute("imageUrl"); 
        // Insert the category into the database with the image URL
        boolean isSuccess = CategoryDBUtil.insertCategory(category_Name, imgUrl, ID);

        
        // Redirect based on success/failure
        if (isSuccess) {
            response.sendRedirect("Category"); // Redirect to the category listing page
        } else {
            response.sendRedirect("error.jsp"); // Redirect to error page
        }
    }
}
