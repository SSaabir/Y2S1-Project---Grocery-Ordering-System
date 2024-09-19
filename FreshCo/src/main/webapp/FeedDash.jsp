<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/styles.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <title>Document</title>
</head>
<body>
<header>
<jsp:include page="header.jsp"/>
</header>
<!--Side Navigation-->
<div id="side-nav">
    <a href="dashboard.jsp"><span class="material-symbols-outlined">
        dashboard
        </span>Dashboard</a>
    <a  href="CustDash.jsp"><span class="material-symbols-outlined">
        groups
        </span> Customer</a>
    <a  href="OrderDash.jsp"><span class="material-symbols-outlined">
        shopping_bag
        </span> Order</a>
    <a href="EmpDash.jsp"><span class="material-symbols-outlined">
        badge
        </span>  Employee</a>
    <a href="CatDash.jsp"><span class="material-symbols-outlined">
        category
        </span>   Category</a>
    <a href="ProDash.jsp"><span class="material-symbols-outlined">
        inventory_2
        </span>    Product</a>
    <a class="active" href="FeedDash.jsp"><span class="material-symbols-outlined">
        feedback
        </span> Feedback</a>
    <a href="EnqDash.jsp"><span class="material-symbols-outlined">
        support
        </span> Enquiry</a>
    <a href="PayDash.jsp"><span class="material-symbols-outlined">
        payments
        </span> Payment  </a>
</div>


<div id="main">

   
</div>

<footer>
<jsp:include page = "footer.jsp"/>
</footer>

</body>
</html>