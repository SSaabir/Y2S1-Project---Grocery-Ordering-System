<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet, freshco.Model.webDB" %>
<html>
<head>
    <title>Database Query Example</title>
</head>
<body>

<h2>Execute Search Query</h2>
<%
    String searchQuery = "SELECT * FROM product";
    try {
        ResultSet rs = webDB.executeSearch(searchQuery);
%>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Product Name</th>
                <th>Price</th>
            </tr>
<%
        while (rs.next()) {
%>
            <tr>
                <td><%= rs.getInt("PrID") %></td>
                <td><%= rs.getString("productName") %></td>
                <td><%= rs.getDouble("price") %></td>
            </tr>
<%
        }
        rs.close();
    } catch (Exception e) {
        out.println("Error executing search query: " + e.getMessage());
    }
%>
        </table>

<h2>Insert New Product</h2>
<%
    String insertQuery = "INSERT INTO category (category_Name) VALUES ('Drinks')";
    try {
        int result = webDB.executeIUD(insertQuery);
        if (result > 0) {
            out.println("New product inserted successfully.");
        } else {
            out.println("No rows affected.");
        }
    } catch (Exception e) {
        out.println("Error inserting product: " + e.getMessage());
    }
%>

</body>
</html>
