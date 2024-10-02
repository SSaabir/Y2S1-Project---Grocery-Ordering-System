package freshco.Model;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import freshco.Beans.Customer;
import freshco.Beans.Employee;


public class CustomerDBUtil {

	public static Customer validateCustomer(String username, String password) throws Exception {
		
		String query = "SELECT * FROM customer WHERE username='"+username+"' AND password='"+password+"'";
		
		ResultSet rs = webDB.executeSearch(query);
		
		if (rs.next()) {
		Customer cus = new Customer(rs.getInt("CusID"),rs.getString("fName"),rs.getString("lName"),rs.getString("email"),rs.getString("phone"),rs.getString("lane"),rs.getString("city"),rs.getString("dob"),rs.getString("imgUrl"),rs.getString("username"),rs.getString("password"));
		rs.close();
        return cus;
		} else {
			rs.close();
			return null;
		}
	}
	
	public static List<Customer> getAllCustomer() throws Exception {
	    List<Customer> customers = new ArrayList<>();
	    String Query = "SELECT * FROM Customer";
	    ResultSet rs = webDB.executeSearch(Query);
	    try {
	        while (rs.next()) {
	            // Fetch customer basic details
	            int cusID = rs.getInt("CusID");
	            String fName = rs.getString("fName");
	            String lName = rs.getString("lName");
	            String email = rs.getString("email");
	            String phone = rs.getString("phone");
	            String lane = rs.getString("lane");
	            String city = rs.getString("city");
	            String dob = rs.getString("dob");  // Assuming LocalDate for dob
	            String imgUrl = rs.getString("imgUrl");
	            String username = rs.getString("username");
	            String password = rs.getString("password");

	            Customer cus = new Customer(cusID, fName, lName, email, phone, lane, city, dob, imgUrl, username, password);
	            customers.add(cus);
	            
	        }
	    } catch (Exception e) {
	        throw e;
	    }
	    rs.close();
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
