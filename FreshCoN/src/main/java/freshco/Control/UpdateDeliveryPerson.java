package freshco.Control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import freshco.Model.DeliveryPersonDBUtil;

@MultipartConfig
public class UpdateDeliveryPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	int EmID = (int) session.getAttribute("ID");
      	RequestDispatcher dispatcher = request.getRequestDispatcher("UploadImage");
        dispatcher.include(request, response); // Include ImageUploadServlet's response in this servlet

        String imgUrl = (String) request.getAttribute("imageUrl"); 

    	String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String vehicleNum = request.getParameter("vehicleNum");
        String city = request.getParameter("city");
        
   
        boolean isSuccess = DeliveryPersonDBUtil.updateDP(EmID, vehicleNum, city, email, imgUrl, phone, password);

        if (isSuccess) {
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
