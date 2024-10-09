package freshco.Model;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import freshco.Beans.Product;

public class ProductDBUtil {
    
    // Get all products
    public static List<Product> getAllProducts() throws Exception {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Product";  // Query to get all products

        ResultSet rs = webDB.executeSearch(query);
        while (rs.next()) {
            Product product = new Product(rs.getInt("PrID"),rs.getString("productName"),rs.getString("descript"),rs.getDouble("price"),rs.getString("unit"),rs.getInt("quantity"),rs.getString("imgUrl"),rs.getDouble("discount"),rs.getInt("CID"));
            products.add(product);
        }
        rs.close();
        return products;
    }

    // Insert a new product
    public static boolean insertProduct(String productName, String descript, double price, String unit, int quantity, String imgUrl, double discount, int CID) {
        boolean isSuccess = false;
        String query = "INSERT INTO Product (productName, descript, price, unit, quantity,imgUrl, discount, CID) " +
                "VALUES ('" + productName + "', '" + descript + "', " + price + ", '" + unit + "', " + quantity + ", '" + imgUrl + "', " + discount + ", " + CID + ")";


        try {
            int rowsAffected = webDB.executeIUD(query);
            isSuccess = rowsAffected > 0;  // Check if the insertion was successful
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
    

    // Update an existing product
    public static boolean updateProduct(int PrID, String productName, String descript, double price, int quantity, String imgUrl, double discount) {
        boolean isSuccess = false;
        String query = "UPDATE Product SET productName='" + productName + "', descript='" + descript + "', price=" + price +
                       ", quantity=" + quantity + ", imgUrl='" + imgUrl + "', discount=" + discount +
                       " WHERE PrID=" + PrID;

        try {
            int rowsAffected = webDB.executeIUD(query);
            
            isSuccess = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    // Delete a product by ID
    public static boolean deleteProduct(int PrID) {
        boolean isSuccess = false;
        String query = "DELETE FROM Product WHERE PrID = " + PrID;

        try {
            int rowsAffected = webDB.executeIUD(query);
            isSuccess = rowsAffected > 0;  // Check if deletion was successful
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    public static Product getProductById(int prId) throws Exception {
        Product product = null; // Initialize product as null
        String query = "SELECT * FROM Product WHERE PrID = ?"; // Parameterized query to get the product by PrID

        try (PreparedStatement pstmt = webDB.getConnection().prepareStatement(query)) {
            pstmt.setInt(1, prId); // Set the PrID parameter

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) { // Check if a result was returned
                    product = new Product(
                        rs.getInt("PrID"),
                        rs.getString("productName"),
                        rs.getString("descript"),
                        rs.getDouble("price"),
                        rs.getString("unit"),
                        rs.getInt("quantity"),
                        rs.getString("imgUrl"),
                        rs.getDouble("discount"),
                        rs.getInt("CID")
                    );
                }
            }
        } catch (SQLException e) {
            // Handle the exception (log it or rethrow with additional context)
            throw new Exception("Error retrieving product from database", e);
        }
        
        return product; // Return the product, or null if not found
    }


}

