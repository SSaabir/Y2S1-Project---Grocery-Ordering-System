package freshco.Model;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import freshco.Beans.Customer;
import freshco.Beans.Employee;


public class CustomerDBUtil {
/*
	public static Customer validateCustomer(String username, String password) throws Exception {
		
		String query = "SELECT * FROM customer WHERE username='"+username+"' AND password='"+password+"'";
		
		ResultSet rs = webDB.executeSearch(query);
		
		if (rs.next()) {
		Customer cus = new Customer(rs.getInt("CusID"),rs.getString("fName"),rs.getString("lName"),rs.getString("email"),rs.getString("lane"),rs.getString("city"),rs.getString("dob"),rs.getString("imgUrl"),rs.getString("username"),rs.getString("password"));
		rs.close();
        return cus;
		} else {
			rs.close();
			return null;
		}
	}
	*/
	public static List<Customer> getAllCustomer() throws Exception {
	    List<Customer> customers = new ArrayList<>();
	    String customerQuery = "SELECT * FROM Customer";
	    
	    try (ResultSet rs = webDB.executeSearch(customerQuery)) {
	        while (rs.next()) {
	            // Fetch customer basic details
	            int cusID = rs.getInt("CusID");
	            String fName = rs.getString("fName");
	            String lName = rs.getString("lName");
	            String email = rs.getString("email");
	            String lane = rs.getString("lane");
	            String city = rs.getString("city");
	            String dob = rs.getString("dob");  // Assuming LocalDate for dob
	            String imgUrl = rs.getString("imgUrl");
	            String username = rs.getString("username");
	            String password = rs.getString("password");

	            // Build and execute the phone query
	            String phoneQuery = "SELECT phone FROM Customer_Phone WHERE CusID = " + cusID;
	            ResultSet phoneRs = webDB.executeSearch(phoneQuery);
	            
	            List<String> phones = new ArrayList<>();
	            while (phoneRs.next()) {
	                phones.add(phoneRs.getString("phone"));
	            }
	            phoneRs.close(); // Don't forget to close the phone ResultSet

	            // Create customer object with phone numbers
	            Customer cus = new Customer(cusID, fName, lName, email, lane, city, dob, imgUrl, username, password, phones);
	            
	            customers.add(cus);
	            
	        }
	    } catch (Exception e) {
	        // Log the exception (if you have a logger) or handle it as needed
	        throw e;
	    }

	    return customers;
	}

	
	public static boolean insertCustomer(String fName, String lName, String email, String lane, String city, String dob,String imgUrl, String username,String password) {
    	
    	boolean isSuccess = false;
    	
    	String query = "INSERT INTO customer (fName, lName, email, lane, city, dob,imgUrl,username,password) VALUES ('" + fName + "', '" + lName + "', '" + email + "', '" + lane + "', '" + city + "', '" + dob + "','"+imgUrl+"','"+username+"','"+password+"')";
    	
    		try {
                int rowsAffected = webDB.executeIUD(query);

                isSuccess = rowsAffected > 0;

            } catch (Exception e) {
                e.printStackTrace();
            }

            return isSuccess;
    }
    
	public static boolean updateCustomer(int CusID,String fName, String lName, String email, String lane, String city, String dob,String imgUrl, String username,String password) {
	
		boolean isSuccess = false;
		
		String query = "UPDATE customer SET fname='"+fName+"',lname='"+lName+"',email='"+email+"',lane='"+lane+"',city='"+city+"',dob='"+dob+"',imgUrl='"+imgUrl+"',username='"+username+"',password='"+password+"'"
				+ "where CusID='"+CusID+"'";

	try {
        int rowsAffected = webDB.executeIUD(query);

        isSuccess = rowsAffected > 0;

	}
	catch(Exception e) {
		e.printStackTrace();
	}
	
	return isSuccess;
}
	
public static boolean deleteCustomer(int CusID) {
	
	boolean isSuccess = false;
	
	String query = "DELETE FROM customer WHERE CusID='"+CusID+"'";

    	try {
            int rowsAffected = webDB.executeIUD(query);

            isSuccess = rowsAffected > 0;

    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
    }
}
