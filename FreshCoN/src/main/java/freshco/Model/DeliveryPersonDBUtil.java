package freshco.Model;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import freshco.Beans.DeliveryPerson;
import freshco.Beans.Manager;

public class DeliveryPersonDBUtil {
	    public static DeliveryPerson validateDeliveryPerson(String email, String password) throws Exception {
	        // SQL query to validate delivery person credentials using JOIN
	        String query = "SELECT e.*, dp.vehicleNum, dp.drivingLicenseNum, dp.city " +
	                       "FROM employee e " +
	                       "JOIN deliveryPerson dp ON e.EmID = dp.EmID " +
	                       "WHERE e.email='" + email + "' AND e.password='" + password + "'";
	        
	        // Execute the query and get the result set
	        ResultSet rs = webDB.executeSearch(query);
	        
	        // Check if a result was returned
	        if (rs.next()) {
	            // Create a DeliveryPerson object with the retrieved data
	            DeliveryPerson deliveryPerson = new DeliveryPerson(
	                rs.getInt("EmID"),                  // Common ID
	                rs.getString("email"),               // From employee table
	                rs.getString("nic"),                 // From employee table
	                rs.getString("dob"),                 // From employee table
	                rs.getString("imgUrl"),              // From employee table
	                rs.getString("phone"),               // From employee table
	                rs.getString("password"),            // From employee table
	                rs.getString("vehicleNum"),          // From deliveryPerson table
	                rs.getString("drivingLicenseNum"),   // From deliveryPerson table
	                rs.getString("city")                 // From deliveryPerson table
	            );
	            
	            rs.close(); // Close the ResultSet
	            return deliveryPerson; // Return the DeliveryPerson object
	        } else {
	            rs.close(); // Close the ResultSet if no delivery person found
	            return null; // Return null if no valid delivery person found
	        }
	    }
	    
    public static List<DeliveryPerson> getAllDeliveryPersons() throws Exception {
        List<DeliveryPerson> deliveryPersons = new ArrayList<>();
        
        String query = "SELECT e.EmID, e.email, e.nic, e.dob, e.imgUrl, e.phone, e.password, dp.vehicleNum, dp.drivingLicenseNum, dp.city " +
                       "FROM DeliveryPerson dp " +
                       "JOIN Employee e ON dp.EmID = e.EmID";
        
        ResultSet rs = webDB.executeSearch(query);
        
        while (rs.next()) {
            DeliveryPerson dp = new DeliveryPerson(
                rs.getInt("EmID"),
                rs.getString("email"),
                rs.getString("nic"),
                rs.getString("dob"),
                rs.getString("imgUrl"),
                rs.getString("phone"),
                rs.getString("password"),
                rs.getString("vehicleNum"),
                rs.getString("drivingLicenseNum"),
                rs.getString("city")
            );
            deliveryPersons.add(dp);
        }
        
        rs.close();
        return deliveryPersons;
    }

    public static boolean insertDeliveryPerson(String email, String nic, String dob, String imgUrl, String phone, String password, String vehicleNum, String drivingLicenseNum, String city, int ID) {
        boolean isSuccess = false;
        
        String queryEmployee = "INSERT INTO employee (email, nic, dob, imgUrl, phone, password) VALUES ('" + email + "', '" + nic + "', '" + dob + "', '" + imgUrl +"', '" + phone + "', '" + password + "')";
        
        try {
            int rowsAffected = webDB.executeIUD(queryEmployee);

            if (rowsAffected > 0) {
                ResultSet rs = webDB.executeSearch("SELECT LAST_INSERT_ID()");
                if (rs.next()) {
                    int lastEmID = rs.getInt(1);
                    
                    String queryDeliveryPerson = "INSERT INTO DeliveryPerson (EmID, vehicleNum, drivingLicenseNum, city) VALUES ('" + lastEmID + "', '" + vehicleNum + "', '" + drivingLicenseNum + "', '" + city + "')";
                    int rowsAffected2 = webDB.executeIUD(queryDeliveryPerson);
                    
                    isSuccess = rowsAffected2 > 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return isSuccess;
    }

    public static boolean updateDeliveryPerson(int EmID, String email, String nic, String dob, String imgUrl, String phone, String password, String vehicleNum, String drivingLicenseNum, String city) {
        boolean isSuccess = false;

        String queryEmployee = "UPDATE employee SET email='" + email + "', nic='" + nic + "', dob='" + dob + "', imgUrl='" + imgUrl + "', phone='" + phone + "', password='" + password + "' WHERE EmID='" + EmID + "'";
        
        try {
            int rowsAffected = webDB.executeIUD(queryEmployee);
            
            String queryDeliveryPerson = "UPDATE DeliveryPerson SET vehicleNum='" + vehicleNum + "', drivingLicenseNum='" + drivingLicenseNum + "', city='" + city + "' WHERE EmID='" + EmID + "'";
            int rowsAffected2 = webDB.executeIUD(queryDeliveryPerson);

            isSuccess = (rowsAffected > 0 && rowsAffected2 > 0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return isSuccess;
    }

    public static boolean deleteDeliveryPerson(int EmID) {
        boolean isSuccess = false;

        String queryDeliveryPerson = "DELETE FROM DeliveryPerson WHERE EmID = '" + EmID + "'";
        String queryEmployee = "DELETE FROM employee WHERE EmID = '" + EmID + "'";

        try {
            int rowsAffected = webDB.executeIUD(queryDeliveryPerson);
            int rowsAffected2 = webDB.executeIUD(queryEmployee);
            
            isSuccess = (rowsAffected > 0 && rowsAffected2 > 0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return isSuccess;
    }
}
