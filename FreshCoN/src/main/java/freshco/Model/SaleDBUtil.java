package freshco.Model;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import freshco.Beans.Sale;

public class SaleDBUtil {

    // Method to retrieve all Sale records
    public static List<Sale> getAllSales() throws Exception {
        List<Sale> sales = new ArrayList<>();
        String query = "SELECT * FROM Sale";

        ResultSet rs = webDB.executeSearch(query);
        while (rs.next()) {
            Sale sale = new Sale(
                rs.getInt("OID"),
                rs.getDate("orderDate"),
                rs.getFloat("totalAmount"),
                rs.getBoolean("orderStatus"),
                rs.getInt("CusID"),
                rs.getInt("PID"),
                rs.getInt("EmID")
            );
            sales.add(sale);
        }
        rs.close();
        return sales;
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
