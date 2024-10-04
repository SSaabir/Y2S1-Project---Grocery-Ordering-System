<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Settings</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-image: url(/image/5786039.jpg);
            background-repeat: no-repeat;
            background-size: cover;
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
        
        .areas {
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
        
        .areas:hover {
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
        
        .sub_part {
            margin-bottom: 20px;
            position: relative;
        }
        
        .sub_part label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #333;
        }
        
        .sub_part input {
            width: 80%;
            padding: 12px;
            padding-left: 35px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        
        .sub_part input:focus {
            border-color: #5f2c84;
            box-shadow: 0 0 8px rgba(95, 44, 132, 0.2);
            outline: none;
        }
        
        .sub_part input:invalid {
            border-color: red;
        }
        
        .sub_part .fa {
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
        
        .save-btn:disabled {
            background-color: #ccc;
            cursor: not-allowed;
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
        <form id="profileForm">
            <div class="profile-header">
                <h2>Profile Settings</h2>
                <div class="areas" onclick="document.getElementById('imgUrl').click();">
                    <img src="/path/to/default-image.jpg" alt="Profile Picture" class="profile-pic" id="profilePic">
                </div>
                <input type="file" id="imgUrl" class="file-input" name="imgUrl" accept="image/*" onchange="previewImage(event)">
            </div>

            <div class="main-form">
                <div class="sub_part">
                    <label for="fName">First Name</label>
                    <i class="fa fa-id-card"></i>
                    <input type="text" id="fName" name="fName" placeholder="First Name" required>
                </div>
                <div class="sub_part">
                    <label for="lName">Last Name</label>
                    <i class="fa fa-id-card-alt"></i>
                    <input type="text" id="lName" name="lName" placeholder="Last Name" required>
                </div>

                <div class="sub_part">
                    <label for="email">Email</label>
                    <i class="fa fa-envelope"></i>
                    <input type="email" id="email" name="email" placeholder="Enter Email" required>
                </div>

                <div class="sub_part">
                    <label for="phone">Mobile Number</label>
                    <i class="fa fa-phone"></i>
                    <input type="tel" id="phone" name="phone" placeholder="Enter Phone Number" required>
                </div>

                <div class="sub_part">
                    <label for="lane">Address</label>
                    <i class="fa fa-map-marker-alt"></i>
                    <input type="text" id="lane" name="lane" placeholder="Enter Address" required>
                </div>
                <div class="sub_part">
                    <label for="city">City</label>
                    <i class="fa fa-city"></i>
                    <input type="text" id="city" name="city" placeholder="Enter City" required>
                </div>

                <div class="sub_part">
                    <label for="password">Password</label>
                    <i class="fa fa-lock"></i>
                    <input type="password" id="password" name="password" placeholder="Password" required>
                </div>

                <div class="sub_part">
                    <label for="Confirmpassword">Confirm Password</label>
                    <i class="fa fa-lock"></i>
                    <input type="password" id="Confirmpassword" name="Confirmpassword" placeholder="Confirm Password" required>
                </div>

                <button type="submit" class="save-btn" id="saveBtn">
                    Save Profile
                    <div class="loading-spinner" id="spinner"></div>
                </button>
            </div>
        </form>
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

        document.getElementById('profileForm').addEventListener('submit', function(event) {
            event.preventDefault();

            const phone = document.getElementById('phone').value;
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('Confirmpassword').value;

            // Validation checks
            let validationErrors = [];
            if (phone.length !== 10 || !/^\d{10}$/.test(phone)) {
                validationErrors.push('Please enter a valid 10-digit phone number.');
            }
            if (password !== confirmPassword) {
                validationErrors.push('Passwords do not match.');
            }

            if (validationErrors.length > 0) {
                alert(validationErrors.join('\n'));
                return;
            }

            // Show spinner and disable button
            const spinner = document.getElementById('spinner');
            const saveBtn = document.getElementById('saveBtn');
            saveBtn.disabled = true;
            spinner.style.display = 'inline-block';

            // Simulate an API call
            setTimeout(() => {
                alert('Profile saved successfully!');

                // Reset form fields
                document.getElementById('profileForm').reset();

                // Reset profile picture to default
                const imgElement = document.getElementById('profilePic');
                imgElement.src = '/path/to/default-image.jpg'; // Change this to your default image path

                spinner.style.display = 'none';
                saveBtn.disabled = false;
            }, 2000);
        });
    </script>
</body>

</html>