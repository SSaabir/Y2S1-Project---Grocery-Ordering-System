package freshco.Model;

import java.sql.ResultSet;
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
        String query = "INSERT INTO Product (productName, descript, price, unit, quantity, discount, CID) " +
                       "VALUES ('" + productName + "', '" + descript + "', " + price + ", " + unit + ", " + quantity + ", '" + imgUrl + "', " + discount + ", " + CID + ")";
        

        try {
            int rowsAffected = webDB.executeIUD(query);
            isSuccess = rowsAffected > 0;  // Check if the insertion was successful
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
    

    // Update an existing product
    public static boolean updateProduct(int PrID, String productName, String descript, double price, String unit, int quantity, String imgUrl, double discount, int CID) {
        boolean isSuccess = false;
        String query = "UPDATE Product SET productName='" + productName + "', descript='" + descript + "', price=" + price +
                       ", unit=" + unit + ", quantity=" + quantity + ", imgUrl='" + imgUrl + "', discount=" + discount +
                       ", CID=" + CID + " WHERE PrID=" + PrID;

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

	
}

