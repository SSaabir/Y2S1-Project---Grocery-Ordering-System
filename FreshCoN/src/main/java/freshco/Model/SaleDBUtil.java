package freshco.Model;

import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	        String rating = rs.getString("rating");

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
	        Sale sale = new Sale(OID, orderDate, totalAmount, orderStatus, CusID, PID, DPID);
	        
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
    
    }
