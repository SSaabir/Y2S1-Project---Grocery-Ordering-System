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

        ResultSet rs = webDB.executeSearch(query);
            // Iterate over the result set and create Category objects
            while (rs.next()) {
                Category category = new Category(
                    rs.getInt("CID"),
                    rs.getString("category_Name")
                );
                categories.add(category);
            }
            
        rs.close();
        return categories;
    }

    // Insert a new category
    public static boolean insertCategory(String category_Name) {
        boolean isSuccess = false;
        
        String query = "INSERT INTO Category (category_Name) VALUES ( '" + category_Name +"')";

        try {
        	int rowsAffected = webDB.executeIUD(query);
        	
        	isSuccess = rowsAffected > 0;  // Check if the insertion was successful
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return isSuccess;
    }

    // Update an existing category
    public static boolean updateCategory(int CID, String category_Name) {
        boolean isSuccess = false;
        String query = "UPDATE Product SET productName='" + category_Name + " WHERE PrID=" + CID;

        try {
            int rowsAffected = webDB.executeIUD(query);
            isSuccess = rowsAffected > 0;  // Check if the insertion was successful
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    // Delete a category by ID
    public static boolean deleteCategory(int CID) {
        boolean isSuccess = false;
        String query = "DELETE FROM Category WHERE CID='"+CID+"'";

        try {
            int rowsAffected = webDB.executeIUD(query);
            isSuccess = rowsAffected > 0;  // Check if the insertion was successful
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
}
