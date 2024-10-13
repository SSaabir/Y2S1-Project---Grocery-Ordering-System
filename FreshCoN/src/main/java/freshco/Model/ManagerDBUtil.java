package freshco.Model;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import freshco.Beans.Manager;

public class ManagerDBUtil {
    public static Manager validateManager(String email, String password) throws Exception {
        // SQL query to validate manager credentials using JOIN
        String query = "SELECT e.*" +  // Assuming role or other manager-specific columns exist in the manager table
                       "FROM employee e " +
                       "JOIN manager m ON e.EmID = m.EmID " + // Join on common EmID
                       "WHERE e.email='" + email + "' AND e.password='" + password + "'";
        
        // Execute the query and get the result set
        ResultSet rs = webDB.executeSearch(query);
        
        // Check if a result was returned
        if (rs.next()) {
            // Create a Manager object with the retrieved data
            Manager manager = new Manager(
                rs.getInt("EmID"),                  // Common ID
                rs.getString("email"),               // From employee table
                rs.getString("nic"),                 // From employee table
                rs.getString("dob"),                 // From employee table
                rs.getString("imgUrl"),              // From employee table
                rs.getString("phone"),               // From employee table
                rs.getString("password")          	// From employee table
            );
            
            rs.close(); // Close the ResultSet
            return manager; // Return the Manager object
        } else {
            rs.close(); // Close the ResultSet if no manager found
            return null; // Return null if no valid manager found
        }
    }
    
	public static List<Manager> getAllManager() throws Exception {
        List<Manager> managers = new ArrayList<>();
        String query = "SELECT e.EmID, e.email, e.nic, e.dob, e.imgUrl, e.phone, e.password " +
                "FROM Manager m " +
                "JOIN Employee e ON m.EmID = e.EmID";
 

        ResultSet rs = webDB.executeSearch(query);
        while (rs.next()) {
        	Manager man = new Manager(rs.getInt("EmID"),rs.getString("email"),rs.getString("nic"),rs.getString("dob"),rs.getString("imgUrl"),rs.getString("phone"),rs.getString("password"));
            managers.add(man);
        }
        rs.close();
        return managers;
    }
	
	public static boolean insertManager(String email, String nic, String dob, String phone, String imgUrl, String password, int ID) {
	    
	    boolean isSuccess = false;

	    
	    String queryEmployee = "INSERT INTO employee (email, nic, dob, phone, imgUrl, password) VALUES ('" + email + "', '" + nic + "', '" + dob + "', '" + phone + "','" + imgUrl + "', '" + password + "')";

	    try {
	      
	        int rowsAffected = webDB.executeIUD(queryEmployee);

	        if (rowsAffected > 0) {
	        	
	            ResultSet rs = webDB.executeSearch("SELECT LAST_INSERT_ID()");
	            if (rs.next()) {
	            	int lastEmID = rs.getInt(1);
	                
	                
	                String queryManager = "INSERT INTO manager (EmID) VALUES ('" + lastEmID + "')";
	                int rowsAffected2 = webDB.executeIUD(queryManager);
	                
	                isSuccess = rowsAffected2 > 0; 
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return isSuccess;
	}


    
	public static boolean updateManager(int EmID, String email, String imgUrl, String phone, String password) {
	    
	    boolean isSuccess = false;
	    
	    // Fixed query with correct spacing
	    String query = "UPDATE employee SET email='" + email + "', imgUrl='"+imgUrl+"',  phone='" + phone + "', password='" + password + "' WHERE EmID='" + EmID + "'";
	    
	    try {
	        int rowsAffected = webDB.executeIUD(query);

	        isSuccess = rowsAffected > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return isSuccess;
	}

	
public static boolean deleteManager(int EmID) {
	
	boolean isSuccess = false;
	boolean isSuccess2 = false;
	
	String queryManager = "DELETE FROM manager WHERE EmID = '" + EmID + "'";
	String queryEmployee = "DELETE FROM employee WHERE EmID = '" + EmID + "'";


    	try {
            int rowsAffected = webDB.executeIUD(queryManager);
            int rowsAffected2 = webDB.executeIUD(queryEmployee);
            
            isSuccess = rowsAffected > 0;
            isSuccess2 = rowsAffected2 > 0;
            
            
        	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	if(isSuccess && isSuccess2) {
    		return true;
    	}else {
    			return false;
    	}
	}

public static boolean updateManagerWithoutImage(int emID, String email, String phone, String password) {
	boolean isSuccess = false;
    
    // Fixed query with correct spacing
    String query = "UPDATE employee SET email='" + email + "',  phone='" + phone + "', password='" + password + "' WHERE EmID='" + emID + "'";
    
    try {
        int rowsAffected = webDB.executeIUD(query);

        isSuccess = rowsAffected > 0;

    } catch (Exception e) {
        e.printStackTrace();
    }
    
    return isSuccess;
}
}
