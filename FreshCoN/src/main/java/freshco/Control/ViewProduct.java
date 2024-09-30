package freshco.Control;

import freshco.Beans.Product;
import freshco.Model.ProductDBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ViewProductServlet")
public class ViewProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public ViewProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Product> productList = ProductDBUtil.getAllProducts();
            request.setAttribute("productList", productList);
            request.getRequestDispatcher("viewProducts.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

