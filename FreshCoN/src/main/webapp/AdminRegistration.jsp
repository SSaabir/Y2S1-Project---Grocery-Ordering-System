<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="freshco.Model.AdminDBUtil" %>
<%@ page import="freshco.Beans.Admin" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fresh Co</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        .main {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #ffffff;
        }

        .registration {
            padding: 30px;
            width: 50%;
            background-color: #ffffff;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
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
            margin-bottom: 15px;
        }

        .sub-part {
            width: 48%;
        }

        .sub-part label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        .sub-part input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
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
            .registration {
                width: 90%;
            }

            .form-row {
                flex-direction: column;
            }

            .sub-part {
                width: 100%;
            }
        }
    </style>
</head>

<body>
    <div class="main">
        <div class="registration">
            <h2>ADMIN REGISTRATION FORM</h2>
            <form action="AddAdm" method="post" enctype="multipart/form-data">
                <div class="form-row">
                    <div class="sub-part">
                        <label for="fName">First Name:</label>
                        <input type="text" id="fName" name="fName" placeholder="Enter First Name" required>
                    </div>
                    <div class="sub-part">
                        <label for="lName">Last Name:</label>
                        <input type="text" id="lName" name="lName" placeholder="Enter Last Name" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="sub-part">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" placeholder="Enter Email" required>
                    </div>
                    <div class="sub-part">
                        <label for="phone">Phone:</label>
                        <input type="tel" id="phone" name="phone" placeholder="Enter Phone Number" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="sub-part">
                        <label for="Lane">Address Line:</label>
                        <input type="text" id="Lane" name="Lane" placeholder="Enter Address Line" required>
                    </div>
                    <div class="sub-part">
                        <label for="city">City:</label>
                        <input type="text" id="city" name="city" placeholder="Enter City" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="sub-part">
                        <label for="dob">Date of Birth:</label>
                        <input type="date" id="dob" name="dob" required>
                    </div>
				<div class="sub-part">
                    <label for="imgUrl">Image</label>
                    <input type="file" id="imgUrl" name="imgUrl" required>
                    </div>              
            </div>
                <div class="form-row">
                    <div class="sub-part">
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" placeholder="Enter Password" required>
                    </div>
                </div>
                  <div class="sub_part">
                    <label for="Confirmpassword">Confirm Password</label>
                    <i class="fa fa-lock"></i>
                    <input type="password" id="Confirmpassword" name="Confirmpassword" placeholder="Confirm Password" required>
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
