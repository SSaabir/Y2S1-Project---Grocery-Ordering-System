package freshco.Control;

import freshco.Model.SaleDBUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteSale")
public class DeleteSale extends HttpServlet {
	 private static final long serialVersionUID = 1L;

	    public DeleteSale() {
	        super();
	    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the OID from the request
        int OID = Integer.parseInt(request.getParameter("OID"));

        // Delete the sale record
        boolean isSuccess = SaleDBUtil.deleteSale(OID);

        // Redirect to a success or failure page based on the outcome
        if (isSuccess) {
            response.sendRedirect("success.jsp"); // Redirect to success page
        } else {
            response.sendRedirect("error.jsp"); // Redirect to error page
        }
    }
}
