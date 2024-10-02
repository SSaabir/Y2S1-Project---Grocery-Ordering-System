package freshco.Control;
import freshco.Beans.Sale;
import freshco.Model.SaleDBUtil;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ViewSale extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Sale> sales = SaleDBUtil.getAllSales(); // Retrieve all sales
            request.setAttribute("sales", sales); // Set the sales list as an attribute in the request
            RequestDispatcher dispatcher = request.getRequestDispatcher("SaleDash.jsp"); // Forward to SaleDash.jsp
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); 
            throw new ServletException("Retrieving sales failed.", e);
        }
    }


}
