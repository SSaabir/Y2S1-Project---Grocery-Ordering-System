<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="freshco.Beans.CartProducts" %> <!-- Update with the correct package name -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <style>
        /* Your existing styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f3f4f6;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: auto;
        }

        .checkout-container {
            display: flex;
            justify-content: space-between;
            max-width: 1200px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 100%;
        }

        .payment-section,
        .review-order-section {
            width: 100%;
        }

        .payment-section {
            background-color: #f9f9f9;
            padding: 25px;
            border-radius: 12px;
            border: 1px solid #e0e0e0;
            transition: border-color 0.3s;
        }

        .payment-section:hover {
            border-color: #c6c6c6;
        }

        .payment-section h2,
        .review-order-section h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .payment-method {
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            transition: background-color 0.3s;
            padding: 10px;
            border-radius: 6px;
        }

        .payment-method:hover {
            background-color: #e6f7ff;
        }

        .payment-method label {
            font-size: 18px;
            margin-left: 10px;
            cursor: pointer;
            color: #555;
        }

        .payment-method input {
            cursor: pointer;
            margin-right: 10px;
        }

        .pay-now {
            background-color: #f36c3d;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 18px;
            font-weight: bold;
            width: 100%;
            margin-top: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .pay-now:hover {
            background-color: #d65a2c;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        }

        .order-item {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .order-item img {
            width: 100px;
            height: auto;
            margin-right: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .order-item p {
            margin-bottom: 8px;
            color: #555;
        }

        .order-item p:last-child {
            font-weight: bold;
            color: #000;
        }

        .card-details {
            display: none;
            margin-top: 20px;
        }

        .card-details label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }

        .card-details input {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            transition: border 0.3s;
        }

        .card-details input:focus {
            border: 1px solid #f36c3d;
            outline: none;
        }

        .order-summary {
            margin-top: 20px;
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 12px;
        }

        .order-summary p {
            margin: 10px 0;
            color: #555;
        }

        .order-summary strong {
            font-size: 16px;
            color: #000;
        }

        .order-summary-box {
            margin-top: 20px;
            background-color: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .address-details {
            display: none;
            margin-top: 20px;
            background-color: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .address-details label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }

        .address-details input,
        .address-details select {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            transition: border 0.3s;
        }

        .address-details input:focus,
        .address-details select:focus {
            border: 1px solid #f36c3d;
            outline: none;
        }

        @media (max-width: 768px) {
            .checkout-container {
                flex-direction: column;
                align-items: center;
            }

            .payment-section,
            .review-order-section {
                width: 100%;
                margin-bottom: 20px;
            }
        }
    </style>
</head>

<body>
    <div class="checkout-container">
        <!-- Single Form for Payment and Order Review -->
        <form action="OrderConfirm" method="POST">
            <h1>Fresh Co Checkout</h1>
            <div class="payment-section">
                <h2>Select Payment Method</h2>
                <div class="payment-method">
                    <input type="radio" name="payment" id="card" value="card" onclick="showCardDetails(true)" required>
                    <label for="card">Card</label>
                </div>
                <div class="payment-method">
                    <input type="radio" name="payment" id="cod" value="cash" onclick="showCardDetails(false)" required>
                    <label for="cod">Cash on Delivery</label>
                </div>

                <!-- Card details section -->
                <div class="card-details" id="card-details">
                    <h3>Enter Card Details</h3>
                    <label for="card-name">Name on Card</label>
                    <input type="text" id="card-name" name="cardName" placeholder="John Doe">
                    <label for="card-number">Card Number</label>
                    <input type="text" id="card-number" name="cardNumber" placeholder="1234 5678 9012 3456">
                    <label for="card-expiry">Expiry Date</label>
                    <input type="text" id="card-expiry" name="cardExpiry" placeholder="MM/YY" >
                    <label for="card-cvc">CVC</label>
                    <input type="text" id="card-cvc" name="cardCVC" placeholder="123" >
                </div>

                <!-- Delivery Address Selection -->
                <h3>Select Delivery Address</h3>
                <div class="payment-method">
                    <input type="radio" name="address" id="existing-address" value="existing" onclick="toggleAddressDetails(false)" required>
                    <label for="existing-address">Existing Address</label>
                </div>
                <div class="payment-method">
                    <input type="radio" name="address" id="add-delivery-address" value="new" onclick="toggleAddressDetails(true)" required>
                    <label for="add-delivery-address">Add Delivery Address</label>
                </div>

                <!-- New Address input field -->
                <div class="address-details" id="address-details">
                    <label for="address">Enter your Delivery Address</label>
                    <input type="text" id="address" name="deliveryAddress" placeholder="Delivery Address" >
                </div>
            </div>

            <!-- Review Order Section -->
            <div class="review-order-section">
                <h2>Review Your Order</h2>
                <%
                    // Retrieve the cart products
                    @SuppressWarnings("unchecked")
                    List<CartProducts> cartItems = (List<CartProducts>) request.getAttribute("cartItems");
                    double totalAmount = 0.0;
                    double discount = 50.00; // Example discount
                %>

                <%
                    // Loop through the cart products and display them
                    for (CartProducts product : cartItems) {
                %>
                    <div class="order-item">
                        <img src="<%= product.getImgUrl() %>" alt="<%= product.getProductName() %>">
                        <div>
                            <p><%= product.getProductName() %></p>
                            <p>Quantity: <%= product.getQuantity() %></p>
                            <p>Price: $<%= product.getNetPrice() %>.00</p>
                        </div>
                    </div>
                <%
                        totalAmount += product.getNetPrice() * product.getQuantity();
                    }
                %>

                <!-- Order Summary Section -->
                <div class="order-summary-box">
                    <h3>Order Summary</h3>
                    <div class="order-summary">
                        <p><strong>Order ID:</strong> <span id="order-id">#123456</span></p>
                        <p><strong>Order Date:</strong> <span id="order-date"><%= new java.util.Date() %></span></p>
                        <p><strong>Discount:</strong> <span id="discount">- $<%= discount %></span></p>
                        <p>Total Items: <strong><%= cartItems.size() %></strong></p>
                        <p>Total Amount: <strong>$<%= totalAmount - discount %></strong></p>
                    </div>
                </div>
            </div>
<!-- Add this hidden field inside the form to pass the totalAmount -->
<input type="hidden" name="totalAmount" value="<%= totalAmount - discount %>">
            <button class="pay-now" type="submit">Pay Now</button>
        </form>
    </div>

    <script>
        function showCardDetails(isCard) {
            document.getElementById('card-details').style.display = isCard ? 'block' : 'none';
        }

        function toggleAddressDetails(show) {
            document.getElementById('address-details').style.display = show ? 'block' : 'none';
        }
    </script>
</body>

</html>
