package freshco.Control;

import freshco.Model.FeedbackDBUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddFeedback extends HttpServlet {  
		private static final long serialVersionUID = 1L;
		
		public AddFeedback() {
			super();
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        String comments = request.getParameter("comments");
        int rating = Integer.parseInt(request.getParameter("rating"));
        int OID = Integer.parseInt(request.getParameter("OID"));

        // Call the method to insert feedback
        boolean isAdded = FeedbackDBUtil.insertFeedback(comments, rating, OID);

        // Redirect or forward based on the result
        if (isAdded) {
            response.sendRedirect("Feedback"); // Redirect to feedback list page on success
        } else {
            request.setAttribute("errorMessage", "Failed to add feedback. Please try again.");
            
        }
    }
}
