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
    <style>
        .table-container {
        margin-top: 10%;
        	display: flex;
            justify-content: center;
            align-items: center;
            overflow-x: auto;
            max-height: 1200px;
        }

        #myTable {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            border-collapse: collapse;
        }

        #myTable th, #myTable td {
            padding: 15px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        #myTable th {
            background-color: #f4f4f4;
            font-weight: bold;
        }

        #myTable td {
            width: 14.28%;
        }

        #main {	
            
            padding: 20px;
        }

        .material-symbols-outlined {
            cursor: pointer;
        }
    </style>
</head>

<body>
<header>
    <jsp:include page="header.jsp"/>
</header>

<div id="side-nav">
    <a href="dashboard.jsp"><span class="material-symbols-outlined">
        dashboard
        </span>Dashboard</a>
    <a href="CustDash.jsp"><span class="material-symbols-outlined">
        groups
        </span> Customer</a>
    <a class="active" href="OrderDash.jsp"><span class="material-symbols-outlined">
        shopping_bag
        </span> Order</a>
    <a href="EmpDash.jsp"><span class="material-symbols-outlined">
        badge
        </span> Employee</a>
    <a href="CatDash.jsp"><span class="material-symbols-outlined">
        category
        </span> Category</a>
    <a href="ProDash.jsp"><span class="material-symbols-outlined">
        inventory_2
        </span> Product</a>
    <a href="FeedDash.jsp"><span class="material-symbols-outlined">
        feedback
        </span> Feedback</a>
    <a href="EnqDash.jsp"><span class="material-symbols-outlined">
        support
        </span> Enquiry</a>
    <a href="PayDash.jsp"><span class="material-symbols-outlined">
        payments
        </span> Payment</a>
</div>

<div id="main">
<h1>Orders</h1>
    <section class="table-container">
        <table id="myTable" class="display">
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
                <tr>
                    <td>Tiger Nixon</td>
                    <td>System Architect</td>
                    <td>Edinburgh</td>
                    <td>61</td>
                    <td>2011/04/25</td>
                    <td>$320,800</td>
                    <td>
                        <a href="#"><span class="material-symbols-outlined">edit</span></a>
                        <a href="#"><span class="material-symbols-outlined">delete_forever</span></a>
                    </td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <th>Name</th>
                    <th>Position</th>
                    <th>Office</th>
                    <th>Age</th>
                    <th>Start date</th>
                    <th>Salary</th>
                    <th>Action</th>
                </tr>
            </tfoot>
        </table>
    </section>
</div>

<footer>
    <jsp:include page="footer.jsp"/>
</footer>

</body>
</html>
