package freshco.Control;

import freshco.Model.FeedbackDBUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteFeedback")
public class DeleteFeedback extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteFeedback() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the FID parameter from the request
        int FID = Integer.parseInt(request.getParameter("FID"));

        // Call the method to delete feedback
        boolean isDeleted = FeedbackDBUtil.deleteFeedback(FID);

        // Redirect or forward based on the result
        if (isDeleted) {
            response.sendRedirect("feedbackList.jsp"); // Redirect to feedback list page on success
        } else {
            request.setAttribute("errorMessage", "Failed to delete feedback. Please try again.");
            request.getRequestDispatcher("feedbackList.jsp").forward(request, response); // Forward to feedback list with error
        }
    }
}
