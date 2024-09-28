<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In/Sign Up Form</title>
    <script src="./javascript/all.js" defer></script>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
        }
        
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url(/Images/loginback.jpg);
            background-repeat: no-repeat;
            background-size: cover;
        }
        
        .container {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
            display: flex;
            width: 900px;
            max-width: 100%;
            min-height: 600px;
            overflow: hidden;
            position: relative;
        }
        
        .form-container {
            position: absolute;
            top: 0;
            height: 100%;
            transition: all 0.6s ease-in-out;
        }
        
        .sign-in-container {
            left: 0;
            width: 50%;
            z-index: 2;
        }
        
        .sign-up-container {
            left: 0;
            width: 50%;
            opacity: 0;
            z-index: 1;
        }
        
        .container.right-panel-active .sign-in-container {
            transform: translateX(100%);
        }
        
        .container.right-panel-active .sign-up-container {
            transform: translateX(100%);
            opacity: 1;
            z-index: 5;
        }
        
        form {
            background: #fff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 0 50px;
            height: 100%;
        }
        
        h1 {
            font-weight: bold;
            margin: 0 0 20px;
        }
        
        span {
            font-size: 14px;
            color: #888;
            margin-bottom: 20px;
        }
        
        input {
            background: #eee;
            border: none;
            padding: 15px;
            margin: 8px 0;
            width: 100%;
            border-radius: 5px;
            transition: all 0.3s ease-in-out;
        }
        
        input:focus {
            outline: none;
            background: #ddd;
        }
        
        button {
            border-radius: 20px;
            border: 1px solid #4CAF50;
            background: #4CAF50;
            color: #fff;
            font-size: 12px;
            font-weight: bold;
            padding: 12px 45px;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: transform 80ms ease-in;
            cursor: pointer;
        }
        
        button:hover {
            background: #05f50d;
        }
        
        button:active {
            transform: scale(0.95);
        }
        
        button.ghost {
            background: transparent;
            border-color: #fff;
            margin-top: 15px;
        }
        
        button.ghost:hover {
            background: #05f50d;
            color: black;
        }
        
        .overlay-container {
            position: absolute;
            top: 0;
            left: 50%;
            width: 50%;
            height: 100%;
            overflow: hidden;
            transition: transform 0.6s ease-in-out;
            z-index: 100;
        }
        
        .container.right-panel-active .overlay-container {
            transform: translateX(-100%);
        }
        
        .overlay {
            background: #4CAF50;
            background: -webkit-linear-gradient(to right, #4CAF50, #56ab2f);
            background: linear-gradient(to right, #4CAF50, #56ab2f);
            position: absolute;
            left: -100%;
            height: 100%;
            width: 200%;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
        }
        
        .container.right-panel-active .overlay {
            transform: translateX(50%);
        }
        
        .overlay-panel {
            position: absolute;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 0 40px;
            height: 100%;
            width: 50%;
        }
        
        .overlay-left {
            transform: translateX(-20%);
        }
        
        .container.right-panel-active .overlay-left {
            transform: translateX(0);
        }
        
        .overlay-right {
            right: 0;
            transform: translateX(0);
        }
        
        .container.right-panel-active .overlay-right {
            transform: translateX(20%);
        }
        
        .a {
            color: #333;
            font-size: 14px;
            text-decoration: none;
            margin: 15px 0;
        }
        
        .a:hover {
            color: blue;
            text-decoration: underline;
        }
        
        .error {
            color: red;
            font-size: 12px;
            margin-top: 5px;
        }
        
        .success-message {
            color: green;
            font-size: 14px;
            margin-top: 10px;
            display: none;
        }
        
        .enter_details {
            color: green;
        }
    </style>

</head>

<body>
    <div class="container" id="container">
        <div class="form-container sign-up-container">
            <form id="signUpForm" action="#">
                <h1>Create Account</h1>
                <span class="enter_details">Enter Following Details</span>
                <input type="text" id="signUpName" placeholder="Name" required />
                <span id="nameError" class="error"></span>
                <input type="email" id="signUpEmail" placeholder="Email" required />
                <span id="emailError" class="error"></span>
                <input type="password" id="signUpPassword" placeholder="Password" required />
                <span id="passwordError" class="error"></span>
                <input type="text" id="signUpPhone" placeholder="Phone Number" required />
                <span id="phoneError" class="error"></span>
                <input type="text" id="signUpAddress" placeholder="Address" required />
                <span id="addressError" class="error"></span>
                <button type="submit">Sign Up</button>
                <span id="signUpSuccess" class="success-message">Sign Up Successful!</span>
            </form>
        </div>
        <div class="form-container sign-in-container">
            <form id="signInForm" action="#">
                <h1>Sign In</h1>
                <span class="enter_details">Use your Email for login</span>
                <input type="email" id="signInEmail" placeholder="Email" required />
                <span id="signInEmailError" class="error"></span>
                <input type="password" id="signInPassword" placeholder="Password" required />
                <span id="signInPasswordError" class="error"></span>
                <a href="#" class="a">Forgot Your Password?</a>
                <button type="submit">Sign In</button>
                <span id="signInSuccess" class="success-message">Sign In Successful!</span>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>Welcome Back!</h1>
                    <p>Log in to continue your fresh shopping experience.</p>
                    <button class="ghost" id="signIn">Sign In</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Hello, Friend!</h1>
                    <p>New here? Sign up and get fresh groceries with just a click!</p>
                    <button class="ghost" id="signUp">Sign Up</button>
                </div>
            </div>
        </div>
    </div>


</body>

</html>