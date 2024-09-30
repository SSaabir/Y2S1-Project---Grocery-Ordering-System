<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fresh Co</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, rgb(46, 45, 45), #504e4e);
        }
        
        .main-box {
            display: flex;
            flex-direction: column;
            width: 600px;
            max-width: 1200px;
            margin: 40px auto;
            background: linear-gradient(to right, #cbd4cb, #c9cec7);
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            backdrop-filter: blur(10px);
        }
        
        .profile-header {
            text-align: center;
            padding: 20px;
            border-bottom: 1px solid #ddd;
            background-color: rgba(255, 255, 255, 0.6);
        }
        
        .profile-pic {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin-bottom: 15px;
            object-fit: cover;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            border: 3px solid #5f2c84;
            transition: transform 0.3s ease;
        }
        
        .profile-pic:hover {
            transform: scale(1.05);
        }
        
        .drag-drop-area {
            width: 150px;
            height: 150px;
            border: 2px dashed #5f2c84;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        
        .drag-drop-area:hover {
            background-color: rgba(95, 44, 132, 0.1);
        }
        
        .upload-btn {
            display: none;
        }
        
        .main-form {
            padding: 40px;
        }
        
        h2 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }
        
        .group {
            margin-bottom: 20px;
            position: relative;
        }
        
        .group label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #333;
        }
        
        .group input {
            width: 80%;
            padding: 12px;
            padding-left: 35px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        
        .group input:focus {
            border-color: #5f2c84;
            box-shadow: 0 0 8px rgba(95, 44, 132, 0.2);
            outline: none;
        }
        
        .group .fa {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #888;
        }
        
        .save-btn {
            background-color: #5f2c84;
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
            margin-top: 20px;
            width: 100%;
            max-width: 250px;
            align-self: center;
        }
        
        .save-btn:hover {
            background-color: #4a206a;
        }
        
        .loading-spinner {
            display: none;
            margin-left: 10px;
            border: 2px solid white;
            border-top: 2px solid transparent;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            animation: spin 1s linear infinite;
        }
        
        @keyframes spin {
            100% {
                transform: rotate(360deg);
            }
        }
        
        @media (max-width: 768px) {
            .main-box {
                flex-direction: column;
                box-shadow: none;
            }
            .main-form {
                padding: 20px;
            }
        }
        
        .file-input {
            display: none;
        }
    </style>
</head>

<body>
    <div class="main-box">
        <div class="profile-header">
            <h2>Profile Settings</h2>
            <div class="drag-drop-area" onclick="document.getElementById('fileInput').click();">
                <img src="/user.png" alt="Profile Picture" class="profile-pic" id="profilePic">
            </div>
            <input type="file" id="fileInput" class="file-input" accept="image/*" onchange="previewImage(event)">
        </div>

        <div class="main-form">
            <form id="profileForm">
                <div class="group">
                    <label for="userName">User Name</label>
                    <i class="fa fa-user"></i>
                    <input type="text" id="userName" placeholder="User Name" required>
                </div>
                <div class="group">
                    <label for="firstname">First Name</label>
                    <i class="fa fa-id-card"></i>
                    <input type="text" id="firstname" placeholder="First Name" required>
                </div>
                <div class="group">
                    <label for="lastname">Last Name</label>
                    <i class="fa fa-id-card-alt"></i>
                    <input type="text" id="lastname" placeholder="Last Name" required>
                </div>
                <div class="group">
                    <label for="phone">Mobile Number</label>
                    <i class="fa fa-phone"></i>
                    <input type="tel" id="phone" placeholder="Enter Phone Number" required>
                </div>
                <div class="group">
                    <label for="address">Address</label>
                    <i class="fa fa-map-marker-alt"></i>
                    <input type="text" id="address" placeholder="Enter Address" required>
                </div>
                <div class="group">
                    <label for="city">City</label>
                    <i class="fa fa-city"></i>
                    <input type="text" id="city" placeholder="Enter City" required>
                </div>
                <div class="group">
                    <label for="email">Email</label>
                    <i class="fa fa-envelope"></i>
                    <input type="email" id="email" placeholder="Enter Email" required>
                </div>

                <button type="submit" class="save-btn" id="saveBtn">
                    Save Profile
                    <div class="loading-spinner" id="spinner"></div>
                </button>
            </form>
        </div>
    </div>

    <script>
        function previewImage(event) {
            const file = event.target.files[0];
            const reader = new FileReader();

            reader.onload = function() {
                const imgElement = document.getElementById('profilePic');
                imgElement.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            }
        }

        document.getElementById('profileForm').addEventListener('submit', function(e) {
            e.preventDefault();
            const saveBtn = document.getElementById('saveBtn');
            const spinner = document.getElementById('spinner');
            saveBtn.disabled = true;
            spinner.style.display = 'inline-block';

            setTimeout(function() {
                alert('Profile saved successfully!');


                document.getElementById('profileForm').reset();


                document.getElementById('profilePic').src = '/user.png';

                saveBtn.disabled = false;
                spinner.style.display = 'none';
            }, 2000);
        });
    </script>

</body>

</html>