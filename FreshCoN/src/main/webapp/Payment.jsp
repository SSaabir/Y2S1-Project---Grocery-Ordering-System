<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fresh Co</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url(./image/editprofile.jpg);
            backdrop-filter: blur(5px);
        }
        
        .payment-container {
            width: 500px;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            transition: transform 0.3s ease-in-out;
        }
        
        h3 {
            font-size: 1.3em;
            color: #333;
            margin-bottom: 10px;
        }
        
        .method {
            display: flex;
            align-items: center;
            padding: 15px;
            border-bottom: 1px solid #ddd;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .method:hover {
            background-color: #f1f1f1;
        }
        
        input[type="radio"] {
            margin-right: 15px;
            cursor: pointer;
        }
        
        label {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 100%;
        }
        
        .logo {
            width: 40px;
            margin-right: 10px;
        }
        
        .payment-methods a {
            display: flex;
            align-items: center;
            padding: 15px;
            border-bottom: 1px solid #ddd;
            text-decoration: none;
            color: #000;
            transition: background-color 0.3s;
        }
        
        .payment-methods a:hover {
            background-color: #eaeaea;
        }
        
        .payment-details {
            display: none;
            padding: 20px;
            background-color: #f8f9fa;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        
        .submit-btn {
            background-color: #28a745;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease-in-out;
        }
        
        .submit-btn:hover {
            background-color: #218838;
        }
        
        .success-message {
            display: none;
            padding: 10px;
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            border-radius: 5px;
            text-align: center;
        }
        /* Media Queries for Responsive Design */
        
        @media (max-width: 600px) {
            .payment-container {
                width: 90%;
            }
            .method,
            .payment-methods a {
                padding: 10px;
            }
        }
    </style>
</head>

<body>

    <div class="payment-container">
        <div class="recommended-method">
            <h3>Recommended method(s)</h3>
            <div class="method" id="points-method">
                <input type="radio" name="payment" />
                <label for="points">
                    <img src="./image/logo.png" alt="Freshco Points" class="logo" />FreshCo Points
                    <span class="price">Rs. 0</span>
                </label>
            </div>
        </div>

        <div class="payment-methods">
            <h3>Payment Methods</h3>
            <a href="#" id="credit-card-method">
                <img src="./image/creditcard.png" alt="Credit/Debit Card" class="logo" /> Credit/Debit Card
            </a>
            <a href="#" id="cash-method">
                <img src="./image/money.png" alt="Cash on Delivery" class="logo" /> Cash on Delivery
            </a>
        </div>

        <!-- Payment Details Section -->
        <div id="cash-details" class="payment-details">
            <h3>Cash on Delivery</h3>
            <div class="form-group">
                <input type="text" id="address" placeholder="Enter delivery address" />
            </div>
            <button class="submit-btn" id="cash-submit">Submit Payment</button>
        </div>

        <div id="card-details" class="payment-details">
            <h3>Credit/Debit Card</h3>
            <div class="form-group">
                <input type="text" id="card-number" placeholder="Card Number" />
            </div>
            <div class="form-group">
                <input type="text" id="expiry-date" placeholder="MM/YY" />
            </div>
            <div class="form-group">
                <input type="text" id="cvv" placeholder="CVV" />
            </div>
            <button class="submit-btn" id="card-submit">Submit Payment</button>
        </div>

        <div id="success-message" class="success-message">
            Payment submitted successfully!
        </div>
    </div>

    <script>
        const cashMethod = document.getElementById('cash-method');
        const cardMethod = document.getElementById('credit-card-method');
        const cashDetails = document.getElementById('cash-details');
        const cardDetails = document.getElementById('card-details');
        const successMessage = document.getElementById('success-message');
        const cashSubmitBtn = document.getElementById('cash-submit');
        const cardSubmitBtn = document.getElementById('card-submit');

        function resetPaymentSection() {
            cashDetails.style.display = 'none';
            cardDetails.style.display = 'none';
            successMessage.style.display = 'none';
        }

        cashMethod.addEventListener('click', (e) => {
            e.preventDefault();
            cashDetails.style.display = 'block';
            cardDetails.style.display = 'none';
            successMessage.style.display = 'none';
        });

        cardMethod.addEventListener('click', (e) => {
            e.preventDefault();
            cardDetails.style.display = 'block';
            cashDetails.style.display = 'none';
            successMessage.style.display = 'none';
        });

        cashSubmitBtn.addEventListener('click', () => {
            successMessage.style.display = 'block';
            setTimeout(() => {
                resetPaymentSection();
            }, 3000);
        });

        cardSubmitBtn.addEventListener('click', () => {
            successMessage.style.display = 'block';
            setTimeout(() => {
                resetPaymentSection();
            }, 3000);
        });
    </script>

</body>

</html>