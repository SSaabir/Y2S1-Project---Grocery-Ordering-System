package freshco.Control;
import freshco.Beans.Customer;
import freshco.Model.CustomerDBUtil;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ViewCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

    public ViewCustomer() {
        super();
      
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
    	List<Customer> customers = CustomerDBUtil.getAllCustomer();
        request.setAttribute("customers", customers); // Set the employee list as an attribute in the request
        RequestDispatcher dispatcher = request.getRequestDispatcher("CustDash.jsp");
        dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); 
            throw new ServletException("Retrieving customers failed.", e);
        }

    }

}
