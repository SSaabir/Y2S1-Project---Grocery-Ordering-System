package freshco.Control;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class ImageUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Specify the directory where images will be saved
        String uploadPath = getServletContext().getRealPath("") + File.separator + "image";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir(); // Create the directory if it doesn't exist
        }

        String imagePath = null;

        // Get the image part from the request
        Part imagePart = request.getPart("imgUrl");
        if (imagePart != null && imagePart.getSize() > 0) {
            String fileName = imagePart.getSubmittedFileName();
            imagePath = uploadPath + File.separator + fileName;

            // Save the image to the specified path
            imagePart.write(imagePath);
        }

        // Return the relative path to the uploaded image
        String relativePath = "./image/" + imagePart.getSubmittedFileName();
        response.getWriter().write(relativePath);
    }
}
