package freshco.Model;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import freshco.Beans.Manager;

public class ManagerDBUtil {
	public static List<Manager> getAllManager() throws Exception {
        List<Manager> managers = new ArrayList<>();
        String query = "SELECT e.EmID, e.email, e.nic, e.dob, e.imgUrl, e.phone, e.username, e.password " +
                "FROM Manager m " +
                "JOIN Employee e ON m.EmID = e.EmID";
 

        ResultSet rs = webDB.executeSearch(query);
        while (rs.next()) {
        	Manager man = new Manager(rs.getInt("EmID"),rs.getString("email"),rs.getString("nic"),rs.getString("dob"),rs.getString("imgUrl"),rs.getString("phone"),rs.getString("username"),rs.getString("password"));
            managers.add(man);
        }
        rs.close();
        return managers;
    }
	
	public static boolean insertManager(String email, String nic, String dob, String phone, String username, String password) {
	    
	    boolean isSuccess = false;

	    
	    String queryEmployee = "INSERT INTO employee (email, nic, dob, phone, username, password) VALUES ('" + email + "', '" + nic + "', '" + dob + "', '" + phone + "', '" + username + "', '" + password + "')";

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


    
	public static boolean updateManager(int EmID, String email, String nic, String dob, String phone, String username, String password) {
	    
	    boolean isSuccess = false;
	    
	    // Fixed query with correct spacing
	    String query = "UPDATE employee SET email='" + email + "', nic='" + nic + "', dob='" + dob + "', phone='" + phone + "', username='" + username + "', password='" + password + "' WHERE EmID='" + EmID + "'";
	    
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
}
