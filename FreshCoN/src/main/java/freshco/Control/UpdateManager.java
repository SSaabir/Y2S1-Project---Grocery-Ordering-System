package freshco.Control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import freshco.Model.ManagerDBUtil;

@MultipartConfig
public class UpdateManager extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
	    	int EmID = (int) session.getAttribute("ID");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");


     	RequestDispatcher dispatcher = request.getRequestDispatcher("UploadImage");
        dispatcher.include(request, response); // Include ImageUploadServlet's response in this servlet

        String imgUrl = (String) request.getAttribute("imageUrl"); 
        
        boolean isSuccess = ManagerDBUtil.updateManager(EmID, email, imgUrl, phone, password);

        if (isSuccess) {
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
