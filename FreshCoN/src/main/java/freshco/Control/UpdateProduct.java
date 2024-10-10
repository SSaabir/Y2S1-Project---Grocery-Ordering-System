package freshco.Control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freshco.Model.ProductDBUtil;

@MultipartConfig
public class UpdateProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int PrID = Integer.parseInt(request.getParameter("PrID"));
        String productName = request.getParameter("productName");
        String descript = request.getParameter("descript");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("UploadImage");
        dispatcher.include(request, response); // Include ImageUploadServlet's response in this servlet

        String imgUrl = (String) request.getAttribute("imageUrl"); 
        
        
        boolean isSuccess =ProductDBUtil.updateProduct(PrID, productName, descript, price, quantity, imgUrl, discount);

        if (isSuccess) {
            response.sendRedirect("Product");
        } else {
            request.setAttribute("errorMessage", "Failed to update product");
			RequestDispatcher dispatcher1 = request.getRequestDispatcher("EditProduct.jsp");
			dispatcher1.forward(request, response);
        }
    }
}

