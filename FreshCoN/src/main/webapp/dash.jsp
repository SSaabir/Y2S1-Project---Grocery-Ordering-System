<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/styles.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
    String currentPage = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1); 
%>
<div id="side-nav">
    <a href="dashboard.jsp" class="<%= "dashboard.jsp".equals(currentPage) ? "active" : "" %>">
        <span class="material-symbols-outlined">dashboard</span>Dashboard
    </a>
    <a href="CustDash.jsp" class="<%= "CustDash.jsp".equals(currentPage) ? "active" : "" %>">
        <span class="material-symbols-outlined">groups</span>Customer
    </a>
    <a href="OrderDash.jsp" class="<%= "OrderDash.jsp".equals(currentPage) ? "active" : "" %>">
        <span class="material-symbols-outlined">shopping_bag</span>Order
    </a>
    <a href="ViewEmployees" class="<%= "ViewEmployees".equals(currentPage) ? "active" : "" %>">
        <span class="material-symbols-outlined">badge</span>Employee
    </a>
    <a href="CatDash.jsp" class="<%= "CatDash.jsp".equals(currentPage) ? "active" : "" %>">
        <span class="material-symbols-outlined">category</span>Category
    </a>
    <a href="ProDash.jsp" class="<%= "ProDash.jsp".equals(currentPage) ? "active" : "" %>">
        <span class="material-symbols-outlined">inventory_2</span>Product
    </a>
    <a href="FeedDash.jsp" class="<%= "FeedDash.jsp".equals(currentPage) ? "active" : "" %>">
        <span class="material-symbols-outlined">feedback</span>Feedback
    </a>
    <a href="EnqDash.jsp" class="<%= "EnqDash.jsp".equals(currentPage) ? "active" : "" %>">
        <span class="material-symbols-outlined">support</span>Enquiry
    </a>
    <a href="PayDash.jsp" class="<%= "PayDash.jsp".equals(currentPage) ? "active" : "" %>">
        <span class="material-symbols-outlined">payments</span>Payment
    </a>
</div>


</body>
</html>