package freshco.Model;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import freshco.Beans.Customer;


public class CustomerDBUtil {

	public static List<Customer> getAllCustomer() throws Exception {
        List<Customer> customer = new ArrayList<>();
        String query = "SELECT * FROM Customer";

        ResultSet rs = webDB.executeSearch(query);
        while (rs.next()) {
        	Customer cus = new Customer(rs.getInt("id"),rs.getString("fname"),rs.getString("lname"),rs.getString("email"),rs.getString("lane"),rs.getString("city"),rs.getString("dob"),rs.getString("imgUrl"),rs.getString("username"),rs.getString("password"));
        	customer.add(cus);
        }
        rs.close();
        return customer;
    }
	
	public static boolean insertCustomer(String fname, String lname, String email, String lane, String city, String dob,String imgUrl, String username,String password) {
    	
    	boolean isSuccess = false;
    	
    	String query = "INSERT INTO customer (fname, lname, email, lane, city, dob,imgUrl,username,password) VALUES ('" + fname + "', '" + lname + "', '" + email + "', '" + lane + "', '" + city + "', '" + dob + "','"+imgUrl+"','"+username+"','"+password+"')";
    	
    		try {
                int rowsAffected = webDB.executeIUD(query);

                isSuccess = rowsAffected > 0;

            } catch (Exception e) {
                e.printStackTrace();
            }

            return isSuccess;
    }
    
	public static boolean updateCustomer(int id,String fname, String lname, String email, String lane, String city, String dob,String imgUrl, String username,String password) {
	
		boolean isSuccess = false;
		
		String query = "UPDATE customer SET fname='"+fname+"',lname='"+lname+"',email='"+email+"',lane='"+lane+"',city='"+city+"',dob='"+dob+"',imgUrl='"+imgUrl+"',username='"+username+"',password='"+password+"'"
				+ "where id='"+id+"'";

	try {
        int rowsAffected = webDB.executeIUD(query);

        isSuccess = rowsAffected > 0;

	}
	catch(Exception e) {
		e.printStackTrace();
	}
	
	return isSuccess;
}
	
public static boolean deleteCustomer(int id) {
	
	boolean isSuccess = false;
	
	String query = "DELETE FROM customer WHERE id='"+id+"'";

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
