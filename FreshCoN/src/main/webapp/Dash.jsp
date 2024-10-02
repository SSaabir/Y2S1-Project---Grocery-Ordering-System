<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./css/styles.css">
        <link rel="stylesheet" href="./css/dataStyles.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <title>Fresh Co</title>

    </head>

    <body>
        <header>
            <jsp:include page="header.jsp" />
        </header>
        
        <!--Side Navigation-->
        <div id="side-nav">
            <a href="dashboard.jsp"><span class="material-symbols-outlined">
                    dashboard
                </span>Dashboard</a>
            <a href="/Customer"><span class="material-symbols-outlined">
                    groups
                </span> Customer</a>
                <a href="/Admin"><span class="material-symbols-outlined">
                    groups
                </span> Admin</a>
            <a href="/Sale"><span class="material-symbols-outlined">
                    shopping_bag
                </span> Sale</a>
            <a href="/viewEmployees"><span class="material-symbols-outlined">
                    badge
                </span> Employee</a>
            <a href="/Category"><span class="material-symbols-outlined">
                    category
                </span> Category</a>
            <a href="/Product"><span class="material-symbols-outlined">
                    inventory_2
                </span> Product</a>
            <a href="/Feedback"><span class="material-symbols-outlined">
                    feedback
                </span> Feedback</a>
            <a href="/EnqDash"><span class="material-symbols-outlined">
                    support
                </span> Enquiry</a>
            <a href="/PayDash"><span class="material-symbols-outlined">
                    payments
                </span> Payment </a>
        </div>
  

    </body>

    </html>