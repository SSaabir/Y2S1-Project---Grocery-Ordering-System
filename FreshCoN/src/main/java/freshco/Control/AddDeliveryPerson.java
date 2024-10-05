package freshco.Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import freshco.Model.DeliveryPersonDBUtil;

public class AddDeliveryPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String nic = request.getParameter("nic");
        String dob = request.getParameter("dob");
        String imgUrl = request.getParameter("imgUrl");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String vehicleNum = request.getParameter("vehicleNum");
        String drivingLicenseNum = request.getParameter("drivingLicenseNum");
        String city = request.getParameter("city");
        HttpSession session = request.getSession();
        int ID = (int) session.getAttribute("ID");

        boolean isSuccess = DeliveryPersonDBUtil.insertDeliveryPerson(email, nic, dob, imgUrl, phone, password, vehicleNum, drivingLicenseNum, city, ID);

        if (isSuccess) {
            response.sendRedirect("Employee");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
