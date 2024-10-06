package freshco.Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import freshco.Beans.Product;
import freshco.Beans.Sale;

public class SaleDBUtil {

    // Method to retrieve all Sale records
    public static List<Sale> getAllSales() throws Exception {
        List<Sale> sales = new ArrayList<>();
        String query = "SELECT * FROM Sale";

        ResultSet rs = webDB.executeSearch(query);
        while (rs.next()) {
            Sale sale = new Sale(
                rs.getInt("OID"),
                rs.getDate("orderDate"),
                rs.getFloat("totalAmount"),
                rs.getBoolean("orderStatus"),
                rs.getInt("CusID"),
                rs.getInt("PID"),
                rs.getInt("EmID")
            );
            sales.add(sale);
        }
        rs.close();
        return sales;
    }

    // Method to insert a new Sale record
    public static boolean insertSale(String orderDate, float totalAmount, boolean orderStatus, int CusID, int PID, int EmID) {
        boolean isSuccess = false;

        String query = "INSERT INTO sale (orderDate, totalAmount, orderStatus, CusID, PID, EmID) VALUES ('"
            + orderDate + "', " + totalAmount + ", " + (orderStatus ? 1 : 0) + ", " + CusID + ", " + PID + ", " + EmID + ")";

        try {
            int rowsAffected = webDB.executeIUD(query);
            isSuccess = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    // Method to update a Sale record
    public static boolean updateSale(int OID, String orderDate, float totalAmount, boolean orderStatus, int CusID, int PID, int EmID) {
        boolean isSuccess = false;

        String query = "UPDATE sale SET orderDate='" + orderDate + "', totalAmount=" + totalAmount + ", orderStatus=" + (orderStatus ? 1 : 0)
            + ", CusID=" + CusID + ", PID=" + PID + ", EmID=" + EmID + " WHERE OID=" + OID;

        try {
            int rowsAffected = webDB.executeIUD(query);
            isSuccess = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    // Method to delete a Sale record
    public static boolean deleteSale(int OID) {
        boolean isSuccess = false;

        String query = "DELETE FROM sale WHERE OID=" + OID;

        try {
            int rowsAffected = webDB.executeIUD(query);
            isSuccess = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
    
    
        public static  int getLastOrderIDByCustomerID(int customerID) throws SQLException {
        	int id = -1;
        	String query = "SELECT OID FROM Sale WHERE CusID = " + customerID + " ORDER BY orderDate DESC LIMIT 1";


                ResultSet rs = null;
				try {
					rs = webDB.executeSearch(query);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

                
                if (rs.next()) {
                    id =  rs.getInt("OID"); // Adjusted to OID from Sale table
                    return id;
                } else {
                    return -1; // No orders found
                }
            
            
        }

        // Method to get all products associated with an orderID
        public static List<Product> getProductsByOrderID(int orderID) throws SQLException {
            String query = "SELECT Product.PrID, Product.productName, Product.price, Product_Sale.quantity, Product_Sale.netPrice, Product_Sale.discount " +
                    "FROM Product_Sale " +
                    "JOIN Product ON Product_Sale.PrID = Product.PrID " +
                    "WHERE Product_Sale.OID = " + orderID;

            List<Product> products = new ArrayList<>();

                ResultSet rs;
				try {
					rs = webDB.executeSearch(query);
				

                while (rs.next()) {
                    int productID = rs.getInt("PrID");  // Adjusted to PrID
                    String productName = rs.getString("productName");
                    int quantity = rs.getInt("quantity");
                    float netPrice = rs.getFloat("netPrice");
                    int discount = rs.getInt("discount");

                    // Assuming your Product class has these fields
                    products.add(new Product(productID, productName, quantity,  netPrice, discount));
                }
                
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

            return products;
        }
    }
