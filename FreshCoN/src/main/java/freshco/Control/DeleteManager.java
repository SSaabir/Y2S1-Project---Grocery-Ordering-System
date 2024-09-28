package freshco.Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freshco.Model.ManagerDBUtil;

@WebServlet("/DeleteManager")
public class DeleteManager extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteManager() {
        super();
 
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int EmID = Integer.parseInt(request.getParameter("EmID"));

        boolean isSuccess = ManagerDBUtil.deleteManager(EmID);

        if (isSuccess) {
            response.sendRedirect("success.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}