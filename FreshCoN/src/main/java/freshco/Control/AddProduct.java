package freshco.Control;

import freshco.Model.ProductDBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import java.io.File;
import java.io.IOException;


public class AddProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
   

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("productName");
        String descript = request.getParameter("descript");
        double price = Double.parseDouble(request.getParameter("price"));
        String unit = request.getParameter("unit");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Part part = request.getPart("imgUrl"); // 'ImgUrl' should match the file input name in the form
        
        double discount = Double.parseDouble(request.getParameter("discount"));
        int CID = Integer.parseInt(request.getParameter("CID"));
        
        
         // Get the file name

        String fileName = part.getSubmittedFileName();
       // String folderPath = "C:/Users/ext/Desktop/Project201/FreshCoN/src/main/webapp/image"; // Path to the image folder

        
        // Path to save the image file (make sure it points to your desired folder)
        String folderPath = getServletContext().getRealPath("/image"); // The /image folder in your project

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
        String imageUrl = "/image/" + fileName; // Relative URL to access the image from your website

        // Get session details
        HttpSession session = request.getSession();
        Integer ID = (Integer) session.getAttribute("ID");

        // Check if ID is null
        
          

          

        boolean isSuccess = ProductDBUtil.insertProduct(productName, descript, price, unit, quantity, fileName, discount, CID);

        if (isSuccess) {
            response.sendRedirect("Product");
        } else {
            request.setAttribute("errorMessage", "Failed to add product");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
