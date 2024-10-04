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
    public static boolean insertCategory(String category_Name, String imgUrl, int ID) {
        boolean isSuccess = false;

        // SQL query to insert into the Category table
        String queryCategory = "INSERT INTO Category (category_Name, ImgUrl) VALUES ('" + category_Name + "', '" + imgUrl + "')";

        try {
            // Execute the insert query for the Category
            int rowsAffected = webDB.executeIUD(queryCategory);

            if (rowsAffected > 0) {
                // Get the last inserted category ID
                ResultSet rs = webDB.executeSearch("SELECT LAST_INSERT_ID()");
                if (rs.next()) {
                    int lastCategoryID = rs.getInt(1); // Assuming this is the ID of the last inserted category

                    // SQL query to insert into the category_employee table
                    String queryCategoryEmployee = "INSERT INTO category_employee (CID, EmID) VALUES (" + lastCategoryID + ", " + ID + ")";

                    // Execute the insert query for category_employee
                    int rowsAffected2 = webDB.executeIUD(queryCategoryEmployee);
                    
                    // Check if the insertion was successful
                    isSuccess = rowsAffected2 > 0;
                }
            }
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
