<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
            text-transform: capitalize;
        }
        
        body {
            display: flex;
            flex-direction: column;
            height: 100vh;
        }
        
        .container {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            width: 100%;
        }
        
        .footer {
            width: 100%;
        }
        
        .newsletter {
            display: flex;
            width: 100%;
            position: relative;
            top: 60px;
            max-width: 1000px;
            margin: auto;
            background: #616361;
            justify-content: space-between;
            align-items: center;
            padding: 20px 15px;
            border-radius: 10px;
        }
        
        .newsletter-left h2 {
            color: #fff;
            text-transform: uppercase;
            font-size: 1rem;
            opacity: 0.5;
            letter-spacing: 1px;
        }
        
        .newsletter-left h1 {
            color: #fff;
            text-transform: uppercase;
            font-size: 1.5rem;
        }
        
        .newsletter-right {
            width: 500px;
        }
        
        .newsletter-input {
            background: #fff;
            padding: 5px;
            border-radius: 20px;
            display: flex;
            justify-content: space-between;
        }
        
        .newsletter-input input {
            border: none;
            outline: none;
            background: transparent;
            width: 80%;
            padding-left: 10px;
            font-weight: 600;
        }
        
        .newsletter-input button {
            background: #201e1e;
            padding: 9px 15px;
            border-radius: 15px;
            color: #fff;
            cursor: pointer;
        }
        
        .newsletter-input button:hover {
            background: #3a3939;
        }
        
        .footer-content {
            background: #3ea055;;
            padding: 100px 40px 40px;
            width: 100%;
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }
        
        .footer-main {
            margin: 10px 20px;
            width: 400px;
        }
        
        .footer-main h2 {
            color: #fff;
            font-size: 1.6rem;
        }
        
        .footer-main p {
            color: #fff;
            font-size: 0.8rem;
            line-height: 1.3rem;
        }
        
        .social-link {
            margin: 15px 0;
            display: flex;
            gap: 8px;
        }
        
        .social-link a {
            width: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            text-decoration: none;
            border-radius: 5px;
            transition: .3s;
            height: 40px;
            background: #dbd8e3;
        }
        
        .social-link a:hover {
            opacity: 0.7;
        }
        
        .social-link a i {
            font-size: 1.1rem;
            color: #201e1e;
        }
        
        .links {
            display: flex;
            flex-direction: column;
            width: 200px;
            margin: 40px 20px;
        }
        
        .links p {
            font-size: 1.3rem;
            margin-bottom: 15px;
            font-weight: 600;
            color: #fff;
        }
        
        .links a {
            font-size: 0.8rem;
            text-decoration: none;
            margin-bottom: 15px;
            font-weight: 600;
            color: #dbd8db;
            transition: .3s all;
        }
        
        .links a:hover {
            opacity: 0.5;
        }
        
        @media(max-width: 1000px) {
            .newsletter {
                border-radius: 0px;
            }
        }
        
        @media(max-width: 800px) {
            .newsletter {
                flex-direction: column;
            }
            .newsletter-left {
                margin-bottom: 10px;
            }
            .newsletter-right {
                width: 100%;
            }
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="footer">
            </div>
            <div class="footer-content">
                <div class="footer-main">
                    <h2>FreshCo</h2>
                    <p>"Shop groceries online effortlessly. Access fresh produce and essentials,
                        enjoy secure payments, and get reliable home delivery for a quick and convenient shopping experience." 
                    </p>
                    <div class="social-link">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-tiktok"></i></a>
                        <a href="#"><i class="fab fa-facebook"></i></a>
                    </div>
                </div>
                
                <div class="links">
                    <p>Helpful Links</p>
                    <a href="#" class="link">Services</a>
                    <a href="#" class="link">Support</a>
                    <a href="#" class="link">Terms & Conditions</a>
                </div>
                <div class="links">
                    <p>Information</p>
                    <a href="#" class="link">Home</a>
                    <a href="#" class="link">About</a>
                    <a href="#" class="link">Contact Us</a>
                </div>
            </div>
        </div>
    </div>
</body>

</html>