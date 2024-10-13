package freshco.Model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import freshco.Beans.CartProducts;
import freshco.Beans.Customer;
import freshco.Beans.Feedback;
import freshco.Beans.Payment;
import freshco.Beans.Sale;
import freshco.Beans.SaleDetails;

public class SaleDBUtil {

    // Method to retrieve all Sale records
	public static List<SaleDetails> getAllSales() throws Exception {
	    List<SaleDetails> salesDetails = new ArrayList<>();
	    String query = "SELECT * FROM Manager_Sales_View";

	    // Execute the query and process the result set
	    ResultSet rs = webDB.executeSearch(query);
	    while (rs.next()) {
	        // Fetch Sale details from Manager_Sales_View
	        int OID = rs.getInt("OrderID");
	        Date orderDate = rs.getDate("orderDate");
	        double totalAmount = rs.getDouble("totalAmount");

	        // Fetch and process orderStatus (convert to boolean based on 'Completed')
	        String orderStatusStr = rs.getString("orderStatus");
	        String address = rs.getString("address");
	        boolean orderStatus = orderStatusStr.equals("Completed");

	        // Fetch Payment details
	        int PID = rs.getInt("PaymentID");
	        String payMethod = rs.getString("payMethod");
	        String payStatusStr = rs.getString("payStatus");
	        boolean payStatus = payStatusStr.equals("Paid");

	        // Create Payment object
	        Payment payment = new Payment(PID, payMethod, payStatus);

	        // Fetch Feedback details
	        int FID = rs.getInt("FeedbackID");
	        String comments = rs.getString("comments");
	        int rating = rs.getInt("rating");

	        // Create Feedback object
	        Feedback feedback = new Feedback(FID, comments, rating, OID);

	        // Fetch Customer details
	        int CusID = rs.getInt("CusID");
	        String fName = rs.getString("fName");
	        String lName = rs.getString("lName");
	        String email = rs.getString("email");

	        // Create Customer object using the simplified constructor
	        Customer customer = new Customer(CusID, fName, lName, email);

	        // Handle DPID as nullable
	        Integer DPID = rs.getInt("DeliveryPersonID");
	        if (rs.wasNull()) {
	            DPID = null; // Set DPID to null if the fetched value was null
	        }

	        // Create Sale object using the constructor that fits this logic
	        Sale sale = new Sale(OID, orderDate, totalAmount, orderStatus, address, CusID, PID, DPID);
	        
	        // Create SaleDetails object and add it to the list
	        SaleDetails saleDetails = new SaleDetails(sale, payment, feedback, customer);
	        salesDetails.add(saleDetails);
	    }

	    rs.close();
	    return salesDetails;
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



    public static boolean UpdateEmID(Integer iD, int oID) {
        boolean isSuccess = false;

        // Construct the SQL update query
        String query = "UPDATE sale SET EmID='" + iD + "' WHERE OID=" + oID;

        try {
            // Execute the update query using webDB's executeIUD method
            int affectedRows = webDB.executeIUD(query);

            // Check if the update affected any rows
            if (affectedRows > 0) {
                isSuccess = true; // Update was successful
            }

        } catch (Exception e) {
            e.printStackTrace(); // Log any exceptions
        }

        return isSuccess; // Return whether the update was successful
    }



    public static boolean UpdateStatus(int pID, int oID) {
        boolean isSuccess = false;

        // Construct the SQL update queries
        String updateOrderStatusQuery = "UPDATE sale SET orderStatus='" + 1 + "' WHERE OID=" + oID;
        String updatePayStatusQuery = "UPDATE payment SET payStatus='" + 1 + "' WHERE PID=" + pID;

        try {
            // Execute the first update query
            int affectedRows1 = webDB.executeIUD(updateOrderStatusQuery);
            
            // Execute the second update query
            int affectedRows2 = webDB.executeIUD(updatePayStatusQuery);

            // Check if both updates affected any rows
            if (affectedRows1 > 0 && affectedRows2 > 0) {
                isSuccess = true; // Both updates were successful
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log any exceptions
        }

        return isSuccess; // Return whether the update was successful
    }

    public static int createSale(String address, int paymentId, int customerId, double totalAmount) throws Exception {
        String sql = "INSERT INTO Sale (orderDate, totalAmount, address, orderStatus, CusID, PID) VALUES (NOW(), "
                + totalAmount + ", '" + address + "', FALSE, " + customerId + ", " + paymentId + ")";
        Integer affectedRows = webDB.executeIUD(sql);
        if (affectedRows == 0) {
            throw new SQLException("Creating sale failed, no rows affected.");
        }

        // Get the last inserted ID (sale ID)
        ResultSet rs = webDB.executeSearch("SELECT LAST_INSERT_ID() AS saleId");
        if (rs.next()) {
            return rs.getInt("saleId");
        } else {
            throw new SQLException("Creating sale failed, no ID obtained.");
        }
    }

    
    public static SaleDetails getSaleDetailsByOrderID(int orderID) throws Exception {
        Sale sale = null;
        Customer customer = null;
        List<CartProducts> cartProducts = new ArrayList<>(); // List to hold multiple cart products
        ResultSet rs = null;

        try {
            // Query the SaleDetails view using orderID
            String query = "SELECT * FROM SaleDetails WHERE OrderID = " + orderID;
            rs = webDB.executeSearch(query);

            if (rs.next()) {
                // Extract Sale details
                sale = new Sale(
                    rs.getInt("OrderID"),
                    rs.getDate("OrderDate"),
                    rs.getDouble("TotalAmount"),
                    rs.getString("Address")
                );

                // Extract Customer details
                customer = new Customer(
                    rs.getInt("CustomerID"),
                    rs.getString("CustomerFirstName"),
                    rs.getString("CustomerLastName"),
                    rs.getString("CustomerEmail"),
                    rs.getString("CustomerPhone")
                );

                // Create CartProducts for the first product (the current row)
                do {
                    CartProducts cartProduct = new CartProducts(
                    	rs.getInt("ProductID"),
                        rs.getString("ProductName"), // Use ProductName
                        rs.getInt("Quantity"), // Use Quantity
                        rs.getDouble("netPrice") // Set netPrice to ProductPrice
                    );

                    // Add the cart product to the list
                    cartProducts.add(cartProduct);

                } while (rs.next()); // Continue to the next row for the same OrderID

                // Create SaleDetails object with the list of cart products
                return new SaleDetails(sale, customer, cartProducts); // Assuming SaleDetails is adjusted to take a List<CartProducts>
            }

        } catch (Exception e) {
            throw new Exception("Error fetching sale details", e);
        } finally {
            // Close the result set
            if (rs != null) {
                rs.close();
            }
        }

        return null; // If no sale details found
    }

    }
