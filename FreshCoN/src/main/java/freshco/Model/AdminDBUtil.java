package freshco.Model;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import freshco.Beans.Admin; // Assuming you have an Admin bean class


public class AdminDBUtil {
	
	public static Admin validateAdmin(String username, String password) throws Exception {
		
		String query = "SELECT * FROM admin WHERE username='"+username+"' AND password='"+password+"'";
		
		ResultSet rs = webDB.executeSearch(query);
		
		if (rs.next()) {
		Admin adm = new Admin(
                rs.getInt("AID"),
                rs.getString("fName"),
                rs.getString("lName"),
                rs.getString("email"),
                rs.getString("lane"),
                rs.getString("city"),
                rs.getString("dob"),
                rs.getString("imgUrl"),
                rs.getString("phone"),
                rs.getString("username"),
                rs.getString("password")
            );
		rs.close();
        return adm;
		} else {
			rs.close();
			return null;
		}
	}
	
    public static List<Admin> getAllAdmins() throws Exception {
        List<Admin> admins = new ArrayList<>();
        String query = "SELECT * FROM Admin";

        ResultSet rs = webDB.executeSearch(query);
        while (rs.next()) {
            Admin admin = new Admin(
                rs.getInt("AID"),
                rs.getString("fName"),
                rs.getString("lName"),
                rs.getString("email"),
                rs.getString("lane"),
                rs.getString("city"),
                rs.getString("dob"),
                rs.getString("imgUrl"),
                rs.getString("phone"),
                rs.getString("username"),
                rs.getString("password")
            );
            admins.add(admin);
        }
        rs.close();
        return admins;
    }

    // Method to add a new admin record
    public static boolean addAdmin(String fName, String lName, String email, String address,
                                   String city, String dob, String imgUrl, String phone,
                                   String username, String password) {
        boolean isSuccess = false;
        String query = "INSERT INTO Admin (fName, lName, email, address, city, dob, imgUrl, phone, username, password) " +
                       "VALUES ('" + fName + "', '" + lName + "', '" + email + "', '" + address + "', '" +
                       city + "', '" + dob + "', '" + imgUrl + "', '" + phone + "', '" + username + "', '" + password + "')";

        try {
            int rowsAffected = webDB.executeIUD(query);
            isSuccess = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    // Method to update an existing admin record
    public static boolean updateAdmin(int AID, String fName, String lName, String email, 
                                       String address, String city, String dob, String imgUrl, 
                                       String phone, String username, String password) {
        boolean isSuccess = false;
        String query = "UPDATE Admin SET fName='" + fName + "', lName='" + lName + "', email='" + email + 
                       "', address='" + address + "', city='" + city + "', dob='" + dob + "', imgUrl='" + 
                       imgUrl + "', phone='" + phone + "', username='" + username + "', password='" + password + 
                       "' WHERE AID=" + AID;

        try {
            int rowsAffected = webDB.executeIUD(query);
            isSuccess = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    // Method to delete an admin record
    public static boolean deleteAdmin(int AID) {
        boolean isSuccess = false;
        String query = "DELETE FROM Admin WHERE AID=" + AID;

        try {
            int rowsAffected = webDB.executeIUD(query);
            isSuccess = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
}
