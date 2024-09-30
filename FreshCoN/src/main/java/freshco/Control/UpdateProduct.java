package freshco.Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freshco.Model.ProductDBUtil;

@WebServlet("/UpdateProductServlet")
public class UpdateProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public UpdateProduct() {
        super();
      
    }

    protected void dopost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int PrID = Integer.parseInt(request.getParameter("PrID"));
        String productName = request.getParameter("productName");
        String descript = request.getParameter("descript");
        double price = Double.parseDouble(request.getParameter("price"));
        int unit = Integer.parseInt(request.getParameter("unit"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String imgUrl = request.getParameter("imgUrl");
        double discount = Double.parseDouble(request.getParameter("discount"));
        int CID = Integer.parseInt(request.getParameter("CID"));

        boolean isSuccess =ProductDBUtil.updateProduct(PrID, productName, descript, price, unit, quantity, imgUrl, discount, CID);

        if (isSuccess) {
            response.sendRedirect("ViewProductServlet");
        } else {
            request.setAttribute("errorMessage", "Failed to update product");
            request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
        }
    }
}

