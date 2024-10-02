package freshco.Control;
import freshco.Beans.Payment;
import freshco.Model.PaymentDBUtil;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class ViewPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

    public ViewPayment() {
        super();
      
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
    	List<Payment> payment = PaymentDBUtil.getAllPayment();
        request.setAttribute("payment", payment); 
        RequestDispatcher dispatcher = request.getRequestDispatcher("PayDash.jsp");
        dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); 
            throw new ServletException("Retrieving customers failed.", e);
        }

    }

}
