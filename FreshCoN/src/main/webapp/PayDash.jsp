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
 <jsp:include page="Dash.jsp"/>
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
                    	@SuppressWarnings("unchecked")
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
