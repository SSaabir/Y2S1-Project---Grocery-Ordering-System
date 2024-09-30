package freshco.Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freshco.Model.DeliveryPersonDBUtil;

@WebServlet("/AddDeliveryPerson")
public class AddDeliveryPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddDeliveryPerson() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String nic = request.getParameter("nic");
        String dob = request.getParameter("dob");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String vehicleNum = request.getParameter("vehicleNum");
        String drivingLicenseNum = request.getParameter("drivingLicenseNum");
        String city = request.getParameter("city");

        boolean isSuccess = DeliveryPersonDBUtil.insertDeliveryPerson(email, nic, dob, phone, username, password, vehicleNum, drivingLicenseNum, city);

        if (isSuccess) {
            response.sendRedirect("success.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
