package freshco.Control;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import freshco.Beans.Manager;
import freshco.Model.ManagerDBUtil;

@WebServlet("/ViewManager")
public class ViewManager extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ViewManager() {
        super();
     
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Manager> managers = ManagerDBUtil.getAllManager();
            request.setAttribute("managers", managers);
            RequestDispatcher dispatcher = request.getRequestDispatcher("displayManagers.jsp");
            dispatcher.forward(request, response); 
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Retrieving managers failed.", e);
        }
    }

}
