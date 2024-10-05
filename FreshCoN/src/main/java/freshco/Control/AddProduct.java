package freshco.Control;

import freshco.Model.ProductDBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;


public class AddProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("productName");
        String descript = request.getParameter("descript");
        double price = Double.parseDouble(request.getParameter("price"));
        String unit = request.getParameter("unit");
        int quantity = Integer.parseInt(request.getParameter("quantity"));        
        double discount = Double.parseDouble(request.getParameter("discount"));
        int CID = Integer.parseInt(request.getParameter("CID"));
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("UploadImage");
        dispatcher.include(request, response); // Include ImageUploadServlet's response in this servlet

        String imgUrl = (String) request.getAttribute("imageUrl"); 
     	
        HttpSession session = request.getSession();
        Integer ID = (Integer) session.getAttribute("ID");

        boolean isSuccess = ProductDBUtil.insertProduct(productName, descript, price, unit, quantity, imgUrl, discount, CID);

        if (isSuccess) {
            response.sendRedirect("Product");
        } else {
            request.setAttribute("errorMessage", "Failed to add product");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
