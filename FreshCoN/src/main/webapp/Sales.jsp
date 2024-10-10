<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FreshCo | Order Receipt</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            width: 30%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        /* FreshCo header styling */
        .brand-header {
            text-align: center;
            padding: 20px 0;
            background-color: #ccf4be; /* Changed background to dark grey */
            color: white;
            font-size: 36px;
            letter-spacing: 2px;
            font-weight: bold;
            border-radius: 8px 8px 0 0;
        }

        /* Specific colors for Fresh and Co */
        .brand-header .fresh {
            color: green;
        }

        .brand-header .co {
            color: rgb(239, 185, 6);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-top: 20px;
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
            background-color: #f7e6e6;
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

        @media screen and (max-width: 768px) {
            .container {
                width: 90%;
            }
        }

        .Order {
            margin-bottom: 15px;
        }
    </style>
</head>

<body>

    <div class="container">
        <!-- FreshCo Brand Header -->
        <div class="brand-header">
            <span class="fresh">Fresh</span><span class="co">Co</span>
        </div>

        <h2>Order Receipt</h2>
        <hr>

        <div class="order-details">
            <div class="Order">
                <label>Order Number:</label>
                <p>#123456789</p>
            </div>

            <div class="Order">
                <label>Customer Name:</label>
                <p>John Doe</p>
            </div>

            <div class="Order">
                <label>Email:</label>
                <p>johndoe@example.com</p>
            </div>

            <div class="Order">
                <label>Phone Number:</label>
                <p>+1234567890</p>
            </div>

            <div class="Order">
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
    </div>

</body>

</html>
