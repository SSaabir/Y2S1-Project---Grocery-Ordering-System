package freshco.Control;

import freshco.Model.ProductDBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteProductServlet")
public class DeleteProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public DeleteProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int PrID = Integer.parseInt(request.getParameter("PrID"));

        boolean isSuccess = ProductDBUtil.deleteProduct(PrID);

        if (isSuccess) {
            response.sendRedirect("ViewProductServlet");
        } else {
            request.setAttribute("errorMessage", "Failed to delete product");
            request.getRequestDispatcher("viewProducts.jsp").forward(request, response);
        }
    }
}

