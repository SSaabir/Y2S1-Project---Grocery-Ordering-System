package freshco.Control;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freshco.Beans.DeliveryPerson;
import freshco.Model.DeliveryPersonDBUtil;

/**
 * Servlet implementation class ViewDeliveryPerson
 */
@WebServlet("/ViewDeliveryPerson")
public class ViewDeliveryPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ViewDeliveryPerson() {
        super();

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<DeliveryPerson> deliveryPersons = DeliveryPersonDBUtil.getAllDeliveryPersons();
            request.setAttribute("deliveryPersons", deliveryPersons);
            RequestDispatcher dispatcher = request.getRequestDispatcher("displayDeliveryPersons.jsp");
            dispatcher.forward(request, response); // Forward to JSP to display data
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
