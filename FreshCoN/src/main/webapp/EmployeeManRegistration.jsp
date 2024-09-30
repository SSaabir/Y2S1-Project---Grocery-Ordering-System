<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fresh Co</title>
    <script src="/javascript/all.js" defer></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url(/image/back1.jpg);
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }
        
        .main {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        .registration {
            padding: 30px;
            width: 50%;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(80px);
        }
        
        h2 {
            margin-bottom: 20px;
            font-size: 30px;
            color: #040404;
            text-align: center;
            font-style: italic;
        }
        
        .form-row {
            display: flex;
            justify-content: space-between;
        }
        
        .sub-part {
            margin-bottom: 15px;
            width: 100%;
        }
        
        .sub-part label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }
        
        .sub-part input,
        .sub-part select {
            width: 60%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        
        .sub-part input[type="radio"] {
            margin-right: 5px;
        }
        
        .eType-group,
        .gender-group {
            display: flex;
            align-items: center;
        }
        
        .eType-group label,
        .gender-group label {
            margin-right: 15px;
            display: flex;
            align-items: center;
            width: auto;
        }
        
        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }
        
        .reset-btn,
        .submit-btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }
        
        .reset-btn {
            background-color: #ccc;
            color: #333;
        }
        
        .submit-btn {
            background-color: #ff6600;
            color: white;
        }
        
        .reset-btn:hover,
        .submit-btn:hover {
            opacity: 0.8;
        }
        
        @media (max-width: 768px) {
            .main {
                flex-direction: column;
            }
            .registration {
                width: 90%;
                padding: 20px;
            }
            h2 {
                font-size: 20px;
            }
            .form-row {
                flex-direction: column;
                align-items: flex-start;
            }
            .sub-part input,
            .sub-part select {
                width: 100%;
            }
            .form-actions {
                flex-direction: column;
                align-items: stretch;
                gap: 5px;
            }
            .reset-btn,
            .submit-btn {
                width: 100%;
            }
        }
    </style>
</head>

<body>
    <div class="main">

        <div class="registration">
            <h2> REGISTRATION FORM</h2>
            <form id="registrationForm">

                <div class="form-row">
                    <div class="sub-part">
                        <label for="fname">First Name :</label>
                        <input type="text" id="fname" placeholder="Enter your First Name" required>
                    </div>

                    <div class="sub-part">
                        <label for="lname">Last Name :</label>
                        <input type="text" id="lname" placeholder="Enter your Last Name" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="sub-part">
                        <label>Gender:</label>
                        <div class="gender-group">
                            <label><input type="radio" name="gender" value="male" required> Male</label>
                            <label><input type="radio" name="gender" value="female"> Female</label>
                        </div>
                    </div>

                    <div class="sub-part">
                        <label>Select Your Type :</label>
                        <div class="eType-group">
                            <label><input type="radio" name="eType" value="manager" required> Manager</label>
                            <label><input type="radio" id="driverOption" name="eType" value="delivery"> Driver</label>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="sub-part">
                        <label for="email">Email :</label>
                        <input type="email" id="email" placeholder="Enter your Email" required>
                    </div>

                    <div class="sub-part">
                        <label for="address">Address :</label>
                        <input type="text" id="address" placeholder="Enter your address" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="sub-part">
                        <label for="nic">NIC :</label>
                        <input type="text" id="nic" required>
                    </div>

                    <div class="sub-part">
                        <label for="dob">DOB :</label>
                        <input type="date" id="dob" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="sub-part">
                        <label for="phone">Phone :</label>
                        <input type="tel" id="phone" placeholder="Enter your Phone Number" required>
                    </div>

                    <div class="sub-part">
                        <label for="img">Add Image</label>
                        <input type="file" id="img" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="sub-part">
                        <label for="uName">User Name :</label>
                        <input type="text" id="uName" placeholder="Enter User Name" required>
                    </div>

                    <div class="sub-part">
                        <label for="password">Password :</label>
                        <input type="password" id="password" placeholder="Enter Password" required>
                    </div>
                </div>

                <div class="form-actions">
                    <button type="reset" class="reset-btn">Reset All</button>
                    <button type="submit" class="submit-btn">Submit Form</button>
                </div>
            </form>
        </div>
    </div>
</body>

</html>