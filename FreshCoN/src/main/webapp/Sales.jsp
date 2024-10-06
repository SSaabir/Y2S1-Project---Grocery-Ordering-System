<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Receipt</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        
        .container {
            width: 50%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        
        h2 {
            text-align: center;
            color: #333;
        }
        
        .order-details {
            margin: 20px 0;
        }
        
        .order-details label {
            font-weight: bold;
        }
        
        .order-details p {
            font-size: 16px;
            margin: 5px 0;
        }
        
        .order-summary {
            background-color: #f9f9f9;
            padding: 10px;
            border-radius: 5px;
            margin-top: 20px;
        }
        
        .order-summary p {
            margin: 8px 0;
        }
        
        .total {
            font-weight: bold;
            font-size: 18px;
            text-align: right;
        }
        
        .print-button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            text-align: center;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
        }
        
        .print-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>

    <div class="container">
        <h2>Order Receipt</h2>

        <div class="order-details">
            <label>Order Number:</label>
            <p>#123456789</p>

            <label>Customer Name:</label>
            <p>John Doe</p>

            <label>Email:</label>
            <p>johndoe@example.com</p>

            <label>Phone Number:</label>
            <p>+1234567890</p>

            <label>Shipping Address:</label>
            <p>1234 Street, City, Country</p>
        </div>

        <div class="order-summary">
            <h3>Order Summary</h3>
            <p>Product: T-Shirt</p>
            <p>Quantity: 2</p>
            <p>Price per item: $20</p>
            <p class="total">Total: $40</p>
        </div>

        <button class="print-button" onclick="window.print()">Print Receipt</button>
    </div>

</body>

</html>