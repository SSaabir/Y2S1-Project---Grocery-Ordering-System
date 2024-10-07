package freshco.Model;


import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

    
    
    public static boolean addProductSale(Map<String, Product> cartItems, int cusID) {
        boolean isSuccess = false;
        int oid = -1;  // To store the generated OID
        int prID = -1; // To store the retrieved PrID
        double discount = -1;
        // Step 1: Insert into Sale table
        String insertSaleQuery = "INSERT INTO Sale (orderDate, CusID) VALUES (GETDATE(), '"+cusID+"')";

        try {
            // Execute insert query for Sale
            int rowsAffected = webDB.executeIUD(insertSaleQuery);

            // Check if the insert was successful
            if (rowsAffected > 0) {
                // Retrieve the generated OID
                String getOidQuery = "SELECT LAST_INSERT_ID()";
                ResultSet resultSet = webDB.executeSearch(getOidQuery);
                if (resultSet.next()) {
                    oid = resultSet.getInt(1);  // Get the last inserted OID
                }
for (Map.Entry<String, Product> entry : cartItems.entrySet()) {
        String productName = entry.getKey();
        int quantity = entry.getValue().getQuantity();
        double netPrice = entry.getValue().getPrice();

        
    
                // Step 2: Retrieve the PrID for the given productName
                String getPrIdQuery = "SELECT PrID, discount FROM Product WHERE productName = '" + productName + "'";
                ResultSet InfoResultSet = webDB.executeSearch(getPrIdQuery);
                if (InfoResultSet.next()) {
                    prID = InfoResultSet.getInt("PrID");  // Get the PrID for the product
                    discount = InfoResultSet.getDouble("discount");
                }

                // Step 3: Insert into Product_Sale table
                if (oid != -1 && prID != -1) {
                    String insertProductSaleQuery = "INSERT INTO Product_Sale (quantity, netPrice, discount, OID, PrID) " +
                            "VALUES (" + quantity + ", " + netPrice + ", " + discount + ", " + oid + ", " + prID + ")";
                    int productSaleRowsAffected = webDB.executeIUD(insertProductSaleQuery);
                    isSuccess = productSaleRowsAffected > 0;  // Check if the insert was successful
                }
            }
          }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

}

