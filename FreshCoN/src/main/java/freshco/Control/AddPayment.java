package freshco.Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import freshco.Model.PaymentDBUtil;

@WebServlet("/AddPayment")
public class AddPayment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddPayment() {
        super();
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String payMethod = request.getParameter("payMethod");
        
      
        String payStatusParam = request.getParameter("payStatus");
        Boolean payStatus = Boolean.parseBoolean(payStatusParam); 

       
        boolean isInserted = PaymentDBUtil.insertPayment(payMethod, payStatus);

        if (isInserted) {
            
            response.sendRedirect("paymentSuccess.jsp");
        } else {
            
            response.sendRedirect("paymentError.jsp");
        }
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("paymentForm.jsp");
    }
}
