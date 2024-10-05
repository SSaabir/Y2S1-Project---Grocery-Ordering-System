<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="freshco.Model.AdminDBUtil" %>
<%@ page import="freshco.Beans.Admin" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            background-image: url("https://i.pinimg.com/736x/5d/aa/aa/5daaaacda6f2f3d2837cd981658318dc.jpg");
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

        .edit-form {
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
            .edit-form {
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
        <div class="edit-form">
            <h2>EDIT ADMIN FORM</h2>
            <form action="UpdateAdmin" method="post" enctype="multipart/form-data">
                <div class="form-row">
                    <div class="sub-part">
                        <label for="fName">First Name:</label>
                        <input type="text" id="fName" name="fName" placeholder="Enter First Name" value="<%= (String) session.getAttribute("fName") %>" required>
                    </div>
                    <div class="sub-part">
                        <label for="lName">Last Name:</label>
                        <input type="text" id="lName" name="lName" placeholder="Enter Last Name" value="<%= (String) session.getAttribute("lName") %>" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="sub-part">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" placeholder="Enter Email" value="<%= (String) session.getAttribute("email") %>" required>
                    </div>
                    <div class="sub-part">
                        <label for="phone">Phone:</label>
                        <input type="tel" id="phone" name="phone" placeholder="Enter Phone Number" value="<%= (String) session.getAttribute("phone") %>" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="sub-part">
                        <label for="img">Add Image</label>
                        <input type="file" id="img" name="img">
                    </div>
                </div>
                <div class="form-row">
                    <div class="sub-part">
                        <label for="password">New Password:</label>
                        <input type="password" id="password" name="password" placeholder="Enter New Password">
                    </div>
                    <div class="sub-part">
                        <label for="Confirmpassword">Confirm New Password:</label>
                        <input type="password" id="Confirmpassword" name="Confirmpassword" placeholder="Confirm Password">
                    </div>
                </div>

                <div class="form-actions">
                    <button type="button" class="back-btn" onclick="history.back();">Back</button>
                    <button type="reset" class="reset-btn">Reset All</button>
                    <button type="submit" class="submit-btn">Submit Changes</button>
                </div>
            </form>
        </div>
    </div>
</body>

</html>
