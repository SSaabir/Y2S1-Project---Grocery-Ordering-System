package freshco.Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freshco.Model.EmployeeDBUtil;
import freshco.Model.ManagerDBUtil;

public class AddEmpMan extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
        String nic = request.getParameter("nic");
        String dob = request.getParameter("dob");
        String imgUrl = request.getParameter("imgUrl");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
		String eType = request.getParameter("eType");
		
		boolean isSuccess = false;
		
		if(eType == null || eType.isEmpty()){
			isSuccess = EmployeeDBUtil.insertEmployee(email, nic, dob, phone, imgUrl, password);

		}else if("manager".equals(eType)) {
			
			isSuccess = ManagerDBUtil.insertManager(email, nic, dob, phone, imgUrl, password);

		}
		
		 if (isSuccess) {
	            response.sendRedirect("Employee");
	        } else {
	            response.sendRedirect("");
	        }
	}

}
