<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="freshco.Model.SaleDBUtil"%>
<%@ page import="freshco.Beans.Sale"%>
<%@ page import="freshco.Beans.SaleDetails"%>
<%@ page import="freshco.Beans.Payment"%>
<%@ page import="freshco.Beans.Customer"%>
<%@ page import="freshco.Beans.Feedback"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<script
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"
	type="text/javascript"></script>
<title>Fresh Co</title>
<style type="text/css">
#main {
	padding-top: 2%;
	margin-top: 2%;
}
</style>
</head>
<body>
	<jsp:include page="Dash.jsp" />
	<%
	HttpSession sess = request.getSession(false); // Get the session without creating a new one
	String userType = (String) sess.getAttribute("userType"); // Get userType from the session

	if (userType != null && userType.equals("Manager")) {
	%>
	<div id="main">
		<h1 class="title-sec">Sale</h1>
		<hr>

		<div class="top-container">
			<div class="top-in-container"></div>
		</div>
		<hr>
		<section class="table-container">
			<div class="table-wrapper">
				<script type="text/javascript">
					$(document)
							.ready(
									function() {
										$('#myTable')
												.DataTable(
														{
															paging : true,
															searching : true,
															ordering : true,
															info : true,
															scrollX : true,
															columnDefs : [ {
																orderable : false,
																targets : -1
															} ],
															language : {
																paginate : {
																	previous : "<",
                                next: ">"
																}
															}
														});
									});
				</script>
				<table id="myTable" class="display nowrap" style="width: 100%">
					<thead>
						<tr>
							<th>Order ID</th>
							<th>Order Date</th>
							<th>Total Amount</th>
							<th>Order Status</th>
							<th>Customer Name</th>
							<th>Payment Method</th>
							<th>Payment Status</th>
							<!-- Added Payment Status Column -->
							<th>Feedback Comments</th>
							<th>Feedback Rating</th>
							<th>DPID</th>
						</tr>
					</thead>
					<tbody>
						<%
						try {
							@SuppressWarnings("unchecked")
							List<SaleDetails> salesDetails = (List<SaleDetails>) request.getAttribute("salesDetails");
							if (salesDetails != null) {
								for (SaleDetails saleDetail : salesDetails) {
							Sale sale = saleDetail.getSale(); // Get Sale object
							Payment payment = saleDetail.getPayment(); // Get Payment object
							Customer customer = saleDetail.getCustomer(); // Get Customer object
							Feedback feedback = saleDetail.getFeedback(); // Get Feedback object

							String orderStatus = sale.isOrderStatus() ? "Completed" : "Pending";
							String fullName = customer.getfName() + " " + customer.getlName();
							String paymentStatus = payment.isPayStatus() ? "Paid" : "Not Paid"; // Determine Payment Status
						%>
						<tr>
							<td><%=sale.getOID()%></td>
							<td><%=sale.getOrderDate()%></td>
							<td><%=sale.getTotalAmount()%></td>
							<td><%=orderStatus%></td>
							<td><%=fullName%></td>
							<td><%=payment.getPayMethod()%></td>
							<td><%=paymentStatus%></td>
							<!-- Display Payment Status -->
							<td><%=feedback != null ? feedback.getComments() : "N/A"%></td>
							<td><%=feedback != null ? feedback.getRating() : "N/A"%></td>
							<td><%=(sale.getDPID() != null) ? sale.getDPID() : "N/A"%></td>
							<td><a href=""><span class="material-symbols-outlined">receipt_long</span></a></td>
							

						</tr>
						<%
						}
						} else {
						%>
						<tr>
							<td colspan="10">No sales data available.</td>
							<!-- Updated colspan to 10 -->
						</tr>
						<%
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

	<%
	} else if (userType != null && userType.equals("DeliveryPerson")) {
	%>
	<div id="main">
		<h1 class="title-sec">Sale</h1>
		<hr>

		<div class="top-container">
			<div class="top-in-container"></div>
		</div>
		<hr>
		<section class="table-container">
			<div class="table-wrapper">
				<script type="text/javascript">
					$(document)
							.ready(
									function() {
										$('#myTable')
												.DataTable(
														{
															paging : true,
															searching : true,
															ordering : true,
															info : true,
															scrollX : true,
															columnDefs : [ {
																orderable : false,
																targets : -1
															} ],
															language : {
																paginate : {
																	previous : "<",
                                next: ">"
																}
															}
														});
									});
				</script>
				<table id="myTable" class="display nowrap" style="width: 100%">
					<thead>
						<tr>
							<th>Order ID</th>
							<th>Order Date</th>
							<th>Total Amount</th>
							<th>Order Status</th>
							<th>Customer Name</th>
							<th>Payment Method</th>
							<th>Payment Status</th>
							<!-- Added Payment Status Column -->
							<th>Feedback Comments</th>
							<th>Feedback Rating</th>
							<th>DPID</th>
						</tr>
					</thead>
					<tbody>
						<%
						try {
							@SuppressWarnings("unchecked")
							List<SaleDetails> salesDetails = (List<SaleDetails>) request.getAttribute("salesDetails");
							if (salesDetails != null) {
								for (SaleDetails saleDetail : salesDetails) {
							Sale sale = saleDetail.getSale(); // Get Sale object
							Payment payment = saleDetail.getPayment(); // Get Payment object
							Customer customer = saleDetail.getCustomer(); // Get Customer object
							Feedback feedback = saleDetail.getFeedback(); // Get Feedback object

							String orderStatus = sale.isOrderStatus() ? "Completed" : "Pending";
							String fullName = customer.getfName() + " " + customer.getlName();
							String paymentStatus = payment.isPayStatus() ? "Paid" : "Not Paid"; // Determine Payment Status
						%>
						<tr>
							<td><%=sale.getOID()%></td>
							<td><%=sale.getOrderDate()%></td>
							<td><%=sale.getTotalAmount()%></td>
							<td><%=orderStatus%></td>
							<td><%=fullName%></td>
							<td><%=payment.getPayMethod()%></td>
							<td><%=paymentStatus%></td>
							<!-- Display Payment Status -->
							<td><%=feedback != null ? feedback.getComments() : "N/A"%></td>
							<td><%=feedback != null ? feedback.getRating() : "N/A"%></td>
							<td><%=(sale.getDPID() != null) ? sale.getDPID() : "N/A"%></td>
							<td><a href=""><span class="material-symbols-outlined">receipt_long</span></a></td><!-- accept link -->
							
						</tr>
						<%
						}
						} else {
						%>
						<tr>
							<td colspan="10">No sales data available.</td>
							<!-- Updated colspan to 10 -->
						</tr>
						<%
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
	<%
	} else if (userType != null && userType.equals("Customer")) {
	%>
	<div id="main">
		<h1 class="title-sec">Sale</h1>
		<hr>

		<div class="top-container">
			<div class="top-in-container"></div>
		</div>
		<hr>
		<section class="table-container">
			<div class="table-wrapper">
				<script type="text/javascript">
					$(document)
							.ready(
									function() {
										$('#myTable')
												.DataTable(
														{
															paging : true,
															searching : true,
															ordering : true,
															info : true,
															scrollX : true,
															columnDefs : [ {
																orderable : false,
																targets : -1
															} ],
															language : {
																paginate : {
																	previous : "<",
                                next: ">"
																}
															}
														});
									});
				</script>
				<table id="myTable" class="display nowrap" style="width: 100%">
					<thead>
						<tr>
							<th>Order ID</th>
							<th>Order Date</th>
							<th>Total Amount</th>
							<th>Order Status</th>
							<th>Customer Name</th>
							<th>Payment Method</th>
							<th>Payment Status</th>
							<!-- Added Payment Status Column -->
							<th>Feedback Comments</th>
							<th>Feedback Rating</th>
							<th>DPID</th>
						</tr>
					</thead>
					<tbody>
						<%
						try {
							@SuppressWarnings("unchecked")
							List<SaleDetails> salesDetails = (List<SaleDetails>) request.getAttribute("salesDetails");
							if (salesDetails != null) {
								for (SaleDetails saleDetail : salesDetails) {
							Sale sale = saleDetail.getSale(); // Get Sale object
							Payment payment = saleDetail.getPayment(); // Get Payment object
							Customer customer = saleDetail.getCustomer(); // Get Customer object
							Feedback feedback = saleDetail.getFeedback(); // Get Feedback object

							String orderStatus = sale.isOrderStatus() ? "Completed" : "Pending";
							String fullName = customer.getfName() + " " + customer.getlName();
							String paymentStatus = payment.isPayStatus() ? "Paid" : "Not Paid"; // Determine Payment Status
						%>
						<tr>
							<td><%=sale.getOID()%></td>
							<td><%=sale.getOrderDate()%></td>
							<td><%=sale.getTotalAmount()%></td>
							<td><%=orderStatus%></td>
							<td><%=fullName%></td>
							<td><%=payment.getPayMethod()%></td>
							<td><%=paymentStatus%></td>
							<!-- Display Payment Status -->
							<td><%=feedback != null ? feedback.getComments() : "N/A"%></td>
							<td><%=feedback != null ? feedback.getRating() : "N/A"%></td>
							<td><%=(sale.getDPID() != null) ? sale.getDPID() : "N/A"%></td>
							<td><a href=""><span class="material-symbols-outlined">receipt_long</span></a>
							<a href=""><span class="material-symbols-outlined">reviews</span></a></td>

						</tr>
						<%
						}
						} else {
						%>
						<tr>
							<td colspan="10">No sales data available.</td>
							<!-- Updated colspan to 10 -->
						</tr>
						<%
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
	<%
	} else {
	%>
	<h2>Access Denied</h2>
	<p>You do not have permission to view this content.</p>
	<%
	}
	%>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>

</body>
</html>
