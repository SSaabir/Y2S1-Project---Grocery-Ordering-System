package freshco.Model;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import freshco.Beans.CartProducts;
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
    public static boolean insertProduct(String productName, String descript, double price, String unit, int quantity, String imgUrl, double discount, int CID, int employeeId) {
        boolean isSuccess = false;

        // SQL query to insert into the Product table
        String queryProduct = "INSERT INTO Product (productName, descript, price, unit, quantity, imgUrl, discount, CID) " +
                "VALUES ('" + productName + "', '" + descript + "', " + price + ", '" + unit + "', " + quantity + ", '" + imgUrl + "', " + discount + ", " + CID + ")";

        try {
            // Execute the insert query for the Product
            int rowsAffected = webDB.executeIUD(queryProduct);

            if (rowsAffected > 0) {
                // Get the last inserted product ID
                ResultSet rs = webDB.executeSearch("SELECT LAST_INSERT_ID()");
                if (rs.next()) {
                    int lastProductID = rs.getInt(1); // Assuming this is the ID of the last inserted product

                    // SQL query to insert into the Product_Employee table
                    String queryProductEmployee = "INSERT INTO Product_Employee (PrID, EmID) VALUES (" + lastProductID + ", " + employeeId + ")";

                    // Execute the insert query for Product_Employee
                    int rowsAffected2 = webDB.executeIUD(queryProductEmployee);
                    
                    // Check if the insertion was successful
                    isSuccess = rowsAffected2 > 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Handle exceptions appropriately
        }

        return isSuccess; // Return whether the entire operation was successful
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

    public static void createProductSale(int saleId, List<CartProducts> cartItems) throws Exception {
        for (CartProducts product : cartItems) {
            if (product == null) {
                throw new Exception("One of the cart products is null");
            } else {
                // Construct the SQL query using the provided saleId, product ID, and quantity
                String sql = "INSERT INTO Product_Sale (OID, PrID, quantity, netPrice) VALUES (" 
                            + saleId + ", " 
                            + product.getPid() + ", " 
                            + product.getQuantity() + ", "
                            + product.getQuantity() * product.getNetPrice() + ")";
                // Log the SQL statement for debugging purposes
                System.out.println("Executing SQL: " + sql);
                
                // Execute the SQL query
                webDB.executeIUD(sql);
                // Update the product quantity
                updateProductQuantity(product.getPid(), product.getQuantity());
            }
        }
    }


    private static void updateProductQuantity(int string, int quantity) throws Exception {
        String sql = "UPDATE Product SET quantity = quantity - " + quantity + " WHERE PrID = " + string;
        webDB.executeIUD(sql);
    }
    
}

