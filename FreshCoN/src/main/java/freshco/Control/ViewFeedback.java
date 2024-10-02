package freshco.Control;

import freshco.Model.FeedbackDBUtil;
import freshco.Beans.Feedback;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ViewFeedback")
public class ViewFeedback extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Feedback> feedbacks = FeedbackDBUtil.getAllFeedbacks(); // Retrieve all feedback records
            request.setAttribute("feedbacks", feedbacks); // Set the feedback list as an attribute in the request
            RequestDispatcher dispatcher = request.getRequestDispatcher("FeedbackDash.jsp"); // Forward to FeedbackDash.jsp
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); 
            throw new ServletException("Retrieving feedbacks failed.", e);
        }
    }
}
