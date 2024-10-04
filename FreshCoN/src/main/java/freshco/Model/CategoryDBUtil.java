package freshco.Model;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import freshco.Beans.Category;


public class CategoryDBUtil {
	
	

    // Get all categories
    public static List<Category> getAllCategories() throws Exception {
        List<Category> categories = new ArrayList<>();
        String query = "SELECT * FROM Category";  // Query to get all categories

        try {
            ResultSet rs = webDB.executeSearch(query);  // Execute the search query
            // Iterate over the result set and create Category objects
            while (rs.next()) {
                Category category = new Category(
                    rs.getInt("CID"),
                    rs.getString("category_Name"), 
                    rs.getString("imgUrl")
                   
                );
                categories.add(category);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw e;  // Optional: rethrow the exception if needed
        }
        return categories;
    }

    // Insert a new category
    public static boolean insertCategory(String category_Name, String ImgUrl) {
        boolean isSuccess = false;
        // Corrected the SQL statement, removed the String type from the column list
        String query = "INSERT INTO Category (category_Name, ImgUrl) VALUES ('" + category_Name + "', '" + ImgUrl + "')";

        try {
            int rowsAffected = webDB.executeIUD(query);  // Execute the insert query
            isSuccess = rowsAffected > 0;  // Check if the insertion was successful
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;   
    }

    // Update an existing category
    public static boolean updateCategory(int CID, String category_Name) {
        boolean isSuccess = false;
        String query = "UPDATE Category SET category_Name='" + category_Name + "' WHERE CID=" + CID;

        try {
            int rowsAffected = webDB.executeIUD(query);  // Execute the update query
            isSuccess = rowsAffected > 0;  // Check if the update was successful
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    // Delete a category by ID
    public static boolean deleteCategory(int CID) {
        boolean isSuccess = false;
        String query = "DELETE FROM Category WHERE CID=" + CID;

        try {
            int rowsAffected = webDB.executeIUD(query);  // Execute the delete query
            isSuccess = rowsAffected > 0;  // Check if the deletion was successful
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
}
