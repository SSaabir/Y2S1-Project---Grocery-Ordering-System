<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FreshCo Grocery Navigation Bar</title>
    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f5f5f5;
            
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: white;
            border-bottom: 1px solid #e0e0e0;
        }

        .freshco {
            display: flex;
            align-items: center;
        }

        .freshco span {
            font-size: 18px;
            font-weight: bold;
            color: #000000;
        }

        .nav-links {
            display: flex;
            list-style: none;
        }

        .nav-links li {
            margin: 0 15px;
        }

        .nav-links a {
            text-decoration: none;
            font-size: 14px;
            color: black;
            padding: 10px 0;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: #0c0000;
            border-bottom: 2px solid #0ded2b;
        }

        .search-bar {
            position: relative;
            display: flex;
            align-items: center;
            margin-right: 20px;
        }

        .search-bar input {
            padding: 7px 10px;
            border: 1px solid #0c0000;
            border-radius: 20px;
            font-size: 14px;
            width: 200px;
            transition: width 0.3s ease;
        }

        .search-bar input:focus {
            width: 300px;
        }

        .search-bar button {
            position: absolute;
            right: 10px;
            background: none;
            border: none;
            font-size: 18px;
            cursor: pointer;
            color: #0b0600;
        }

        .nav-icons {
            display: flex;
            align-items: center;
        }

        .nav-icons a {
            color: #080000;
            margin: 0 10px;
            font-size: 18px;
            transition: color 0.3s;
        }

        .nav-icons a:hover {
            color: #0ded2b;
        }

        .buttons {
            display: flex;
            align-items: center;
        }

        .buttons a {
            text-decoration: none;
            font-size: 14px;
            padding: 8px 15px;
            border: 1px solid #010913;
            border-radius: 4px;
            margin-left: 10px;
            transition: background-color 0.3s, color 0.3s;
        }

        .buttons a:hover {
            background-color: #0ded2b;
            color: #ffffff;
        }
    </style>
</head>

<body>
    <header>
        <nav class="navbar">
            <div class="freshco">
                <span><i>FreshCo</i></span>
            </div>
            <ul class="nav-links">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#">Shop</a></li>
                <li><a href="#contactUS">Contact Us</a></li>
                <li><a href="aboutUs.jsp">About Us</a></li>
                
            </ul>
            <div class="search-bar">
                <input type="text" placeholder="Search...">
                <button><i class='bx bx-search-alt-2'></i></button>
            </div>
            <div class="buttons">
                <a href="./login.jsp">Log In</a>
            </div>
            <div class="nav-icons">
                <a href="#"> <i class='bx bx-cart-alt'></i>
                </a>
            </div>
        </nav>
    </header>
</body>

</html>
