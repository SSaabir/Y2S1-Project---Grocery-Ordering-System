package freshco.Control;

import freshco.Model.ProductDBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddProductServlet")
public class AddProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("productName");
        String descript = request.getParameter("descript");
        double price = Double.parseDouble(request.getParameter("price"));
        int unit = Integer.parseInt(request.getParameter("unit"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String imgUrl = request.getParameter("imgUrl");
        double discount = Double.parseDouble(request.getParameter("discount"));
        int CID = Integer.parseInt(request.getParameter("CID"));

        boolean isSuccess = ProductDBUtil.insertProduct(productName, descript, price, unit, quantity, imgUrl, discount, CID);

        if (isSuccess) {
            response.sendRedirect("ViewProductServlet");
        } else {
            request.setAttribute("errorMessage", "Failed to add product");
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
        }
    }
}
