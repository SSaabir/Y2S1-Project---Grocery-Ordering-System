package freshco.Model;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import freshco.Beans.DeliveryPerson;

public class DeliveryPersonDBUtil {

    public static List<DeliveryPerson> getAllDeliveryPersons() throws Exception {
        List<DeliveryPerson> deliveryPersons = new ArrayList<>();
        
        String query = "SELECT e.EmID, e.email, e.nic, e.dob, e.imgUrl, e.phone, e.username, e.password, dp.vehicleNum, dp.drivingLicenseNum, dp.city " +
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
                rs.getString("username"),
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

    public static boolean insertDeliveryPerson(String email, String nic, String dob, String phone, String username, String password, String vehicleNum, String drivingLicenseNum, String city) {
        boolean isSuccess = false;
        
        String queryEmployee = "INSERT INTO employee (email, nic, dob, phone, username, password) VALUES ('" + email + "', '" + nic + "', '" + dob + "', '" + phone + "', '" + username + "', '" + password + "')";
        
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

    public static boolean updateDeliveryPerson(int EmID, String email, String nic, String dob, String phone, String username, String password, String vehicleNum, String drivingLicenseNum, String city) {
        boolean isSuccess = false;

        String queryEmployee = "UPDATE employee SET email='" + email + "', nic='" + nic + "', dob='" + dob + "', phone='" + phone + "', username='" + username + "', password='" + password + "' WHERE EmID='" + EmID + "'";
        
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
