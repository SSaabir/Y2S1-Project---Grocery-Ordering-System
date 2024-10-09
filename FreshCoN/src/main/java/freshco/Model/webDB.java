package freshco.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class webDB {
    
    private static Connection connection;
    
    public static void createConnection() throws Exception{
        if (connection == null) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/freshco","root","Jingles@1");
        }
    }
    
    public static ResultSet executeSearch(String query) throws Exception{
        createConnection();
        return connection.createStatement().executeQuery(query);
    }
    
    public static Integer executeIUD(String query) throws Exception{
        createConnection();
        return connection.createStatement().executeUpdate(query);
    }

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        if (connection == null || connection.isClosed()) { // Check if connection is null or closed
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load the MySQL JDBC driver
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/freshco", "root", "Jingles@1"); // Establish the connection
        }
        return connection; // Return the established connection
    }
    
}