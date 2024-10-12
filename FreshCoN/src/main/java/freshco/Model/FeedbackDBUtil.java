package freshco.Model;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import freshco.Beans.Feedback;

public class FeedbackDBUtil {

    // Method to retrieve all feedback records
    public static List<Feedback> getAllFeedbacks() throws Exception {
        List<Feedback> feedbacks = new ArrayList<>();
        String query = "SELECT * FROM Feedback";

        ResultSet rs = webDB.executeSearch(query);
        while (rs.next()) {
            Feedback feedback = new Feedback(
                rs.getInt("FID"),
                rs.getString("comments"),
                rs.getString("rating"),
                rs.getInt("OID")
            );
            feedbacks.add(feedback);
        }
        rs.close();
        return feedbacks;
    }

    // Method to insert a new feedback record
    public static boolean insertFeedback(String comments, String rating, int OID) {
        boolean isSuccess = false;

        String query = "INSERT INTO feedback (comments, rating, OID) VALUES ('"
                + comments + "', " + rating + ", " + OID + ")";

        try {
            int rowsAffected = webDB.executeIUD(query);
            isSuccess = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    // Method to update an existing feedback record
    public static boolean updateFeedback(int FID, String comments, int rating, int OID) {
        boolean isSuccess = false;

        String query = "UPDATE feedback SET comments='" + comments + "', rating=" + rating
                + ", OID=" + OID + " WHERE FID=" + FID;

        try {
            int rowsAffected = webDB.executeIUD(query);
            isSuccess = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    // Method to delete a feedback record
    public static boolean deleteFeedback(int FID) {
        boolean isSuccess = false;

        String query = "DELETE FROM feedback WHERE FID=" + FID;

        try {
            int rowsAffected = webDB.executeIUD(query);
            isSuccess = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
}
