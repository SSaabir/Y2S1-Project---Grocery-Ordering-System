</html><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="freshco.Beans.CartProducts"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart - Fresh Co</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="./css/style.css">
</head>

<body>

    <header>
        <div class="header-container">
            <h1>Your Shopping Cart</h1>
            <a href="product.jsp" class="continue-shopping">Continue Shopping</a>
        </div>
    </header>

    <section class="cart-section">
        <table class="cart-table">
            <tr>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Net Price</th>
                <th>Action</th>
            </tr>
            <%
                List<CartProducts> cartItems = (List<CartProducts>) request.getAttribute("cartItems");
                if (cartItems != null && !cartItems.isEmpty()) {
                    double total = 0;
                    for (CartProducts item : cartItems) {
                        double itemTotal = item.getNetPrice() * item.getQuantity();
                        total += itemTotal;
            %>
            <tr>
                <td><%= item.getProductName() %></td>
                <td><%= item.getQuantity() %></td>
                <td>$<%= itemTotal %></td>
                <td>
                    <form action="RemoveFromCartServlet" method="post">
                        <input type="hidden" name="pid" value="<%= item.getPid() %>">
                        <button type="submit" class="remove-button">Remove</button>
                    </form>
                </td>
            </tr>
            <%
                    }
            %>
            <tr>
                <td colspan="2"><strong>Total</strong></td>
                <td colspan="2">$<%= total %></td>
            </tr>
            <%
                } else {
            %>
            <tr>
                <td colspan="4">Your cart is empty.</td>
            </tr>
            <%
                }
            %>
        </table>

        <div class="cart-actions">
            <form action="ClearCartServlet" method="post">
                <button type="submit" class="clear-button">Clear Cart</button>
            </form>
            <form action="CheckoutServlet" method="post">
                <button type="submit" class="checkout-button">Checkout</button>
            </form>
        </div>
    </section>

</body>
</html>
