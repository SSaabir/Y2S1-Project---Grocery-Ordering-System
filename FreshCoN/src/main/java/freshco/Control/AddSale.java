package freshco.Control;

import freshco.Model.SaleDBUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddSale extends HttpServlet {
	   private static final long serialVersionUID = 1L;

	    public AddSale() {
	        super();
	    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from the request
        String orderDate = request.getParameter("orderDate");
        float totalAmount = Float.parseFloat(request.getParameter("totalAmount"));
        boolean orderStatus = Boolean.parseBoolean(request.getParameter("orderStatus"));
        int CusID = Integer.parseInt(request.getParameter("CusID"));
        int PID = Integer.parseInt(request.getParameter("PID"));
        int EmID = Integer.parseInt(request.getParameter("EmID"));

        // Insert the sale record
        boolean isSuccess = SaleDBUtil.insertSale(orderDate, totalAmount, orderStatus, CusID, PID, EmID);

        // Redirect to a success or failure page based on the outcome
        if (isSuccess) {
            response.sendRedirect("success.jsp"); // Redirect to success page
        } else {
            response.sendRedirect("error.jsp"); // Redirect to error page
        }
    }
}
