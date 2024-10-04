<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fresh Co</title>
    <script src="./javascript/DeliveryPerson.js" defer></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }
        
        .main {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-image: url(./image/delivey_person.png);
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
        }
        
        .registration {
            padding: 30px;
            width: 50%;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(5px);
        } 
        
        h2 {
            margin-bottom: 20px;
            font-size: 30px;
            color: #000000;
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
        }
        
        .sub-part input,
        .sub-part select {
            width: 50%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        
        .eType-group {
            display: flex;
            align-items: center;
        }
        
        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }
        
        .back-btn,
        .reset-btn,
        .submit-btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }
        
        .back-btn {
            background-color: #007bff;
            color: white;
        }
        
        .reset-btn {
            background-color: #ccc;
            color: #333;
        }
        
        .submit-btn {
            background-color: #ff6600;
            color: white;
        }
        
        @media (max-width: 768px) {
            .main {
                flex-direction: column;
            }
            .registration {
                width: 90%;
                padding: 20px;
            }
            .form-row {
                flex-direction: column;
                align-items: flex-start;
            }
        }
    </style>
</head>

<body>
    <div class="main">
        <div class="registration">
            <h2>Driver REGISTRATION FORM</h2>
            <form id="registrationForm" action="AddDelPerson" method="post">
                <div class="form-row">
                    <div class="sub-part">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" placeholder="Enter your Email" required>
                    </div>
                       <div class="sub-part">
                        <label for="phone">Phone:</label>
                        <input type="tel" id="phone" name="phone" placeholder="Enter your Phone Number" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="sub-part">
                        <label for="nic">NIC:</label>
                        <input type="text" id="nic" name="nic" required>
                    </div>
                      <div class="sub-part">
                        <label for="Dimg">Add Driver Image</label>
                        <input type="file" id="Dimg" name="imgUrl">
                    </div>
                                   
                </div>
                <div class="form-row">
                    <div class="sub-part">
                        <label for="city">City:</label>
                        <input type="text" id="address" name="city" placeholder="Enter your address" required>
                    </div>
                    <div class="sub-part">
                        <label for="dob">DOB:</label>
                        <input type="date" id="dob" name="dob" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="sub-part">
                        <label for="LNumber">License Number:</label>
                        <input type="text" id="LNumber" name="drivingLicenseNum" required>
                    </div>
                      <div class="sub-part">
                        <label for="vNumber">Vehicle Number:</label>
                        <input type="text" id="vNumber" name="vehicleNum" required>
                    </div>
                </div>
                <div class="form-row">
                  
                </div>
                <div class="form-row">
                    <div class="sub-part">
                        <label for="uName">User Name:</label>
                        <input type="text" id="uName" name="username" placeholder="Enter User Name" required>
                    </div>
                    <div class="sub-part">
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" placeholder="Enter Password" required>
                    </div>
                </div>
                <div class="form-actions">
                    <button type="button" class="back-btn" onclick="history.back();">Back</button>
                    <button type="reset" class="reset-btn">Reset All</button>
                    <button type="submit" class="submit-btn">Submit Form</button>
                </div>
            </form>
        </div>
    </div>
</body>

</html>