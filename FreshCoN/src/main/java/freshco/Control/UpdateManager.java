package freshco.Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freshco.Model.ManagerDBUtil;

@WebServlet("/UpdateManager")
public class UpdateManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public UpdateManager() {
        super();
      
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int EmID = Integer.parseInt(request.getParameter("EmID"));
        String email = request.getParameter("email");
        String nic = request.getParameter("nic");
        String dob = request.getParameter("dob");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        boolean isSuccess = ManagerDBUtil.updateManager(EmID, email, nic, dob, phone, password);

        if (isSuccess) {
            response.sendRedirect("success.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
