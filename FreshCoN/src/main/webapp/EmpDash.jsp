<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="freshco.Model.EmployeeDBUtil" %>
<%@ page import="freshco.Beans.Employee" %>
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
    <h1 class="title-sec">Employee</h1>
    <hr>
    
    <div class="top-container">
        <div class="top-in-container">
        <button class="button-top" onclick="window.location.href='EmployeeDPRegistration.jsp'">Driver Registration form</button>
        <button class="button-top" onclick="window.location.href='EmployeeManRegistration.jsp'">Add New Employee</button>
            
            
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
             <%
                HttpSession sess = request.getSession(false); // Get the session without creating a new one
                String userType = (String) sess.getAttribute("userType"); // Get userType from the session

                if (userType != null && userType.equals("employee")) {
            %>
            <table id="myTable" class="display nowrap" style="width:100%">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Email</th>
                        <th>NIC</th>
                        <th>DOB</th>
                        <th>Phone</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    try {
                    	List<Employee> employees = (List<Employee>) request.getAttribute("employees");
                        if (employees != null) {
                        for (Employee emp : employees) {
                    %>
                    <tr>
                        <td><%= emp.getEmID() %></td>
                        <td><%= emp.getEmail() %></td>
                        <td><%= emp.getNic() %></td>
                        <td><%= emp.getDob() %></td>
                        <td><%= emp.getPhone() %></td>
                        
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
             <%
                } else if (userType != null && userType.equals("customer")) {
            %>
            <!-- table             -->
            <%
                } else {
            %>
                <!-- Access Denied Message -->
                <h2>Access Denied</h2>
                <p>You do not have permission to view this content.</p>
            <%
                }
            %>
            
        </div>
    </section>
</div>

<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>
