package freshco.Control;

import freshco.Model.CategoryDBUtil;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/AddCategory")
@MultipartConfig
public class AddCategory extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the category name from the form
        String category_Name = request.getParameter("category_Name");

        // Retrieve the file part from the form using 'ImgUrl'
        Part part = request.getPart("imgUrl"); // 'ImgUrl' should match the file input name in the form
        String fileName = part.getSubmittedFileName(); // Get the file name

        
        String folderPath = "C:/Users/ext/Desktop/Project201/FreshCoN/src/main/webapp/image"; // Path to the image folder

        /*
        
        // Path to save the image file (make sure it points to your desired folder)
        String folderPath = getServletContext().getRealPath("/image"); // The /image folder in your project
*/
        // Create directory if it doesn't exist
        File uploadDir = new File(folderPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // Create directories if they don't exist
        }

        // Save the image file in the specified folder
        String filePath = folderPath + File.separator + fileName;
        part.write(filePath); // Save the file to the /image folder

        // Check if the file was uploaded successfully
        File uploadedFile = new File(filePath);
        if (uploadedFile.exists()) {
            System.out.println("File uploaded successfully: " + uploadedFile.getAbsolutePath());
        } else {
            System.out.println("File upload failed.");
        }

        // Generate the image URL (this is the relative path to the image in the project)
        String imageUrl = "./image/" + fileName; // Relative URL to access the image from your website

        // Get session details
        HttpSession session = request.getSession();
        Integer ID = (Integer) session.getAttribute("ID");

        // Check if ID is null
       

        // Insert the category into the database with the image URL
        boolean isSuccess = CategoryDBUtil.insertCategory(category_Name, imageUrl, ID);

        // Redirect based on success/failure
        if (isSuccess) {
            response.sendRedirect("Category"); // Redirect to the category listing page
        } else {
            response.sendRedirect("error.jsp"); // Redirect to error page
        }
    }
}
