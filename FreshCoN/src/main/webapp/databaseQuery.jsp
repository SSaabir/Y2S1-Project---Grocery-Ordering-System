<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet, freshco.Model.webDB" %>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Database Query Example</title>
</head>
<body>
 <table id="myTable" class="display nowrap" style="width:100%">
 
 <c:forEach var="emp" items="${employees}">
	
	${emp.EmID}
	${emp.email}
	${emp.nic}
	${emp.dob}
	${emp.imgUrl}
	${emp.phone}
	${emp.username}
	${emp.password}
	</c:forEach>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Position</th>
                    <th>Office</th>
                    <th>Age</th>
                    <th>Start date</th>
                    <th>Salary</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
             
           
            </tbody>
            
        </table>
        
</body>
</html>
