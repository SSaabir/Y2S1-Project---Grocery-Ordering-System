package freshco.Control;

import freshco.Model.FeedbackDBUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateFeedback")
public class UpdateFeedback extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateFeedback() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        int FID = Integer.parseInt(request.getParameter("FID"));
        String comments = request.getParameter("comments");
        int rating = Integer.parseInt(request.getParameter("rating"));
        int OID = Integer.parseInt(request.getParameter("OID"));

        // Call the method to update feedback
        boolean isUpdated = FeedbackDBUtil.updateFeedback(FID, comments, rating, OID);

        // Redirect or forward based on the result
        if (isUpdated) {
            response.sendRedirect("feedbackList.jsp"); // Redirect to feedback list page on success
        } else {
            request.setAttribute("errorMessage", "Failed to update feedback. Please try again.");
            request.getRequestDispatcher("updateFeedback.jsp?FID=" + FID).forward(request, response); // Forward back to form with error
        }
    }
}
