<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="freshco.Model.FeedbackDBUtil" %>
<%@ page import="freshco.Beans.Feedback" %>
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
        #main {
            padding-top: 2%;
            margin-top: 2%;
        }
    </style>
</head>

<body>
 <jsp:include page="Dash.jsp"/>

<div id="main">
    <h1 class="title-sec">Feedback</h1>
    <hr>
    
    <div class="top-container">
        <div class="top-in-container">
            <button class="button-top">Button1</button>
            <button class="button-top">Button2</button>
            <button class="button-top">Button3</button>
            <button class="button-top">Button4</button>
            <button class="button-top">Button5</button>
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
                        <th>FID</th>
                        <th>Comments</th>
                        <th>Rating</th>
                        <th>OID</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    try {
                    	List<Feedback> feedback = (List<Feedback>) request.getAttribute("feedback");
                        if (feedback != null) {
                        for (Feedback Feed : feedback) {
                    %>
                    <tr>
                    	<td><%= Feed.getFID() %></td>
                        <td><%= Feed.getComments() %></td>
                        <td><%= Feed.getRating() %></td>
                        <td><%= Feed.getOID()%></td>
                    </tr>
                    <%
                        	}
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    %>
                </tbody>
            </table>
        </div>
    </section>
</div>

<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>
