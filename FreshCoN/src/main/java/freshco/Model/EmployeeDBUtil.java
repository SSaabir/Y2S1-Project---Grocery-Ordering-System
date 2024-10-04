package freshco.Model;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import freshco.Beans.Employee;


public class EmployeeDBUtil {
	public static Employee validateEmployee(String username, String password) throws Exception {
		
		String query = "SELECT * FROM employee WHERE username='"+username+"' AND password='"+password+"'";
		
		ResultSet rs = webDB.executeSearch(query);
		
		if (rs.next()) {
		Employee emp = new Employee(rs.getInt("EmID"),rs.getString("email"),rs.getString("nic"),rs.getString("dob"),rs.getString("imgUrl"),rs.getString("phone"),rs.getString("username"),rs.getString("password"));
		
		rs.close();
        return emp;
		} else {
			rs.close();
			return null;
		}
	}

	public static List<Employee> getAllEmployees() throws Exception {
        List<Employee> employees = new ArrayList<>();
        String query = "SELECT * FROM Employee";

        ResultSet rs = webDB.executeSearch(query);
        while (rs.next()) {
            Employee emp = new Employee(rs.getInt("EmID"),rs.getString("email"),rs.getString("nic"),rs.getString("dob"),rs.getString("imgUrl"),rs.getString("phone"),rs.getString("username"),rs.getString("password"));
            employees.add(emp);
        }
        rs.close();
        return employees;
    }
	
	public static boolean insertEmployee(String email, String nic, String dob, String phone, String imgUrl, String username, String password) {
    	
    	boolean isSuccess = false;
    	
    	String query = "INSERT INTO employee (email, nic, dob, phone, imgUrl, username, password) VALUES ('" + email + "', '" + nic + "', '" + dob + "', '" + phone + "','" + imgUrl + "', '" + username + "', '" + password + "')";
    	
    		try {
                int rowsAffected = webDB.executeIUD(query);

                isSuccess = rowsAffected > 0;

            } catch (Exception e) {
                e.printStackTrace();
            }

            return isSuccess;
    }
    
	public static boolean updateEmployee(int EmID, String email, String nic, String dob, String phone, String username, String password) {
	
		boolean isSuccess = false;
		
		String query = "UPDATE employee SET email='"+email+"',nic='"+nic+"',dob='"+dob+"',phone='"+phone+"',username='"+username+"',password='"+password+"'"
				+ "where EmID='"+EmID+"'";

	try {
        int rowsAffected = webDB.executeIUD(query);

        isSuccess = rowsAffected > 0;

	}
	catch(Exception e) {
		e.printStackTrace();
	}
	
	return isSuccess;
}
	
public static boolean deleteEmployee(int EmID) {
	
	boolean isSuccess = false;
	
	String query = "DELETE FROM employee WHERE EmID='"+EmID+"'";

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
