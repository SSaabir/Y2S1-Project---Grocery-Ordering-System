<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
	<link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
   
@import url('https://fonts.googleapis.com/css2?family=Finger+Paint&display=swap');

     * {
            margin: 0;
            padding: 0;
            font-family: 'poppins', sans-serif;
            box-sizing: border-box;
        }
        
		.logo{
		font-family: 'Finger Paint', cursive;
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
        
        .nav-links a:hover,
        .nav-links a.main-active {
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
            position: relative;
            display: flex;
            align-items: center;
        }
        
        .user-pic {
            width: 40px;
            border-radius: 50%;
            cursor: pointer;
            margin-left: 30px;
        }
        
        .sub-menu-wrap {
            display: none;
            position: absolute;
            top: 100%;
            right: 0;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 200px;
        }
        
        .sub-menu-wrap.active {
            display: block;
        }
        
        .sub-menu {
            padding: 10px;
        }
        
        .sub-menu ul {
            list-style: none;
        }
        
        .sub-menu ul li {
            padding: 10px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .sub-menu ul li a {
            text-decoration: none;
            color: black;
            font-size: 14px;
        }
        
        .sub-menu ul li a:hover {
            color: #0ded2b;
        }
        
        .sub-menu ul li i {
            font-size: 16px;
            color: #b0b0b0;
            transition: color 0.3s;
        }
        
        .sub-menu ul li:hover i {
            color: #0ded2b;
        }
    </style>
</head>

<body>
    <header>
        <nav class="navbar">
            <div class="freshco">
                <span>FreshCo</span>
            </div>
            <ul class="nav-links">
                <li><a href="#">Home</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="Fruits.html">Shop</a></li>
                <li><a href="#">Contact Us</a></li>
                <li><a href="#">Pages</a></li>
            </ul>
            <div class="search-bar">
                <input type="text" placeholder="Search...">
                <button><i class='bx bx-search-alt-2'></i></button>
            </div>
            <div class="buttons">

                <img src="./image/user.png" class="user-pic" alt="User Profile">
                <div class="sub-menu-wrap">
                    <div class="sub-menu">
                        <ul>
                            <li><a href="#">Login</a><i class='bx bx-chevron-right'></i></li>
                            <li><a href="#">Edit Profile</a><i class='bx bx-chevron-right'></i></li>
                            <li><a href="#">Registration</a><i class='bx bx-chevron-right'></i></li>
                            <li><a href="#">Logout</a><i class='bx bx-chevron-right'></i></li>
                        </ul>
                    </div>
                </div>
            </div>
            <a href="Fruits.html"><i class="fas fa-shopping-cart"></i></a>
        </nav>
    </header>

    <script>
        const userPic = document.querySelector('.user-pic');
        const subMenuWrap = document.querySelector('.sub-menu-wrap');

        userPic.addEventListener('click', function() {
            subMenuWrap.classList.toggle('active');
        });


        window.addEventListener('click', function(event) {
            if (!userPic.contains(event.target) && !subMenuWrap.contains(event.target)) {
                subMenuWrap.classList.remove('active');
            }
        });
    </script>
</body>

</html>