<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="freshco.Model.PaymentDBUtil" %>
<%@ page import="freshco.Beans.Payment" %>
<%@ page import="java.util.List" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/styles.css">
      <link rel="stylesheet" href="./css/dataStyles.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <title>Fresh Co</title>
    <style>
        #main{
       padding-top: 2%;
   margin-top: 2%;
      }
    </style>
</head>

<body>
<header>
    <jsp:include page="header.jsp"/>
</header>

<div id="side-nav">
    <a href="dashboard.jsp"><span class="material-symbols-outlined">dashboard</span>Dashboard</a>
    <a href="CustDash.jsp"><span class="material-symbols-outlined">groups</span> Customer</a>
    <a href="OrderDash.jsp"><span class="material-symbols-outlined">shopping_bag</span> Order</a>
    <a href="ViewEmployees"><span class="material-symbols-outlined">badge</span> Employee</a>
    <a href="CatDash.jsp"><span class="material-symbols-outlined">category</span> Category</a>
    <a href="ProDash.jsp"><span class="material-symbols-outlined">inventory_2</span> Product</a>
    <a href="FeedDash.jsp"><span class="material-symbols-outlined">feedback</span> Feedback</a>
    <a href="EnqDash.jsp"><span class="material-symbols-outlined">support</span> Enquiry</a>
    <a class="active" href="PayDash.jsp"><span class="material-symbols-outlined">payments</span> Payment</a>
</div>

<div id="main">
<h1 class="title-sec">Payment</h1>
   <hr>
<div class="top-container">
    <div class="top-in-container">
        <button class="button-top">Button1</button>
        <button class="button-top">Button2</button>
        <button class="button-top">Button3</button>
        <button class="button-top">Button3</button>
        <button class="button-top">Button3</button>
    </div>
</div>
<hr>
    <section class="table-container">
    <div class="table-wrapper">
    <script>
        $(document).ready(function() {
            $('#myTable').DataTable({
                paging: true,
                searching: true,
                ordering: true,
                info: true,
                scrollX: true,
                columnDefs: [
                    { orderable: false, targets: -1 }
                ],
                language: {
                    paginate: {
                        previous: "<",
                        next: ">"
                    }
                }
            });
        });
    </script>
        <table id="myTable" class="display nowrap" style="width:100%">
            <thead>
                <tr>
                    <th>Payment_ID</th>
                    <th>PayMethod</th>
                    <th>PayStatus</th>
                   
                </tr>
            </thead>
            <tbody>
                 <%
                    try {
                    	List<Payment> payment = (List<Payment>) request.getAttribute("payment");
                        if (payment != null) {
                        for (Payment pay : payment) {
                    %>
                    <tr>
                        <td><%= pay.getPID() %></td>
                        <td><%= pay.getPayMethod() %></td>
                        <td><%= pay.isPayStatus() %></td>
                       
                        
                           
                    </tr>
                    <%
                        	}
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    %>
                <!-- Add more rows as needed -->
            </tbody>
        </table>
        </div>
    </section>
</div>

<footer>
    <jsp:include page="footer.jsp"/>
</footer>
  
</body>
</html>
