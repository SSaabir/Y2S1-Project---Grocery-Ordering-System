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
<%
	String errorMessage = (String) request.getAttribute("errorMessage");
	if (errorMessage != null) {
	%>
	<script>
        alert("<%= errorMessage %>");
	</script>
	<%
	}
	%>
    <div class="main-box">
        <%
            HttpSession sess = request.getSession(false); // Get the session without creating a new one
            String userType = (String) sess.getAttribute("userType"); // Get userType from the session

            if (userType != null && userType.equals("Customer")) {
        %>
            <form id="profileForm" action="EditProfileC" method="post" enctype="multipart/form-data">
                <div class="profile-header">
                    <h2>Profile Settings</h2>
                </div>

                <div class="main-form">
                    <div class="sub_part">
                        <label for="fName">First Name</label>
                        <i class="fa fa-id-card"></i>
                        <input type="text" id="fName" name="fName" value='<%= (String) session.getAttribute("fName") %>' placeholder="First Name" required>
                    </div>
                    <div class="sub_part">
                        <label for="lName">Last Name</label>
                        <i class="fa fa-id-card-alt"></i>
                        <input type="text" id="lName" name="lName" value='<%= (String) session.getAttribute("lName") %>' placeholder="Last Name" required>
                    </div>

                    <div class="sub_part">
                        <label for="email">Email</label>
                        <i class="fa fa-envelope"></i>
                        <input type="email" id="email" name="email" value='<%= (String) session.getAttribute("email") %>' placeholder="Enter Email" required>
                    </div>

                    <div class="sub_part">
                        <label for="phone">Mobile Number</label>
                        <i class="fa fa-phone"></i>
                        <input type="tel" id="phone" name="phone" value='<%= (String) session.getAttribute("phone") %>' placeholder="Enter Phone Number" required>
                    </div>

                    <div class="sub_part">
                        <label for="img">Add Image</label>
                        <input type="file" id="img" name="imgUrl">
                    </div>

                    <div class="sub_part">
                        <label for="lane">Address : Lane</label>
                        <i class="fa fa-map-marker-alt"></i>
                        <input type="text" id="lane" name="lane" value='<%= (String) session.getAttribute("lane") %>' placeholder="Enter Address" required>
                    </div>
                    <div class="sub_part">
                        <label for="city">City</label>
                        <i class="fa fa-city"></i>
                        <input type="text" id="city" name="city" value='<%= (String) session.getAttribute("city") %>' placeholder="Enter City" required>
                    </div>

                    <div class="sub_part">
                        <label for="password">Password</label>
                        <i class="fa fa-lock"></i>
                        <input type="password" id="password" name="password" value='<%= (String) session.getAttribute("password") %>' placeholder="Password" required>
                    </div>

                    <div class="sub_part">
                        <label for="Confirmpassword">Confirm Password</label>
                        <i class="fa fa-lock"></i>
                        <input type="password" id="Confirmpassword" name="Confirmpassword" placeholder="Confirm Password" required>
                    </div>

                    <button type="submit" class="save-btn" id="saveBtn">
                        Save Profile
                    </button>
                                    </div>
            </form>
                    <form id="deleteProfileForm" method="POST" action="DeleteProfileC?CusID=<%= (int) session.getAttribute("ID") %>">
                <button type="submit" class="save-btn" id="deleteBtn" style="background-color: #d9534f;" onclick="return confirmDelete();">
                    Delete Profile
                </button>
            </form>

            
        <%
            } else if (userType != null && userType.equals("Admin")) {
        %>
            <form id="profileForm" action="EditProfileA" method="post" enctype="multipart/form-data">
                <div class="main-form">
                    <h2>Admin Profile Settings</h2>

                    <div class="sub_part">
                        <label for="fName">First Name</label>
                        <i class="fa fa-id-card"></i>
                        <input type="text" id="fName" name="fName" value='<%= (String) session.getAttribute("fName") %>' placeholder="First Name" required>
                    </div>
                    <div class="sub_part">
                        <label for="lName">Last Name</label>
                        <i class="fa fa-id-card-alt"></i>
                        <input type="text" id="lName" name="lName" value='<%= (String) session.getAttribute("lName") %>' placeholder="Last Name" required>
                    </div>

                    <div class="sub_part">
                        <label for="email">Email</label>
                        <i class="fa fa-envelope"></i>
                        <input type="email" id="email" name="email" value='<%= (String) session.getAttribute("email") %>' placeholder="Enter Email" required>
                    </div>

                    <div class="sub_part">
                        <label for="phone">Mobile Number</label>
                        <i class="fa fa-phone"></i>
                        <input type="tel" id="phone" name="phone" value='<%= (String) session.getAttribute("phone") %>' placeholder="Enter Phone Number" required>
                    </div>

                    <div class="sub_part">
                        <label for="img">Add Image</label>
                        <input type="file" id="img" name="imgUrl">
                    </div>

                    <div class="sub_part">
                        <label for="password">Password</label>
                        <i class="fa fa-lock"></i>
                        <input type="password" id="password" name="password" value='<%= (String) session.getAttribute("password") %>' placeholder="Password" required>
                    </div>

                    <div class="sub_part">
                        <label for="Confirmpassword">Confirm Password</label>
                        <i class="fa fa-lock"></i>
                        <input type="password" id="Confirmpassword" name="Confirmpassword" placeholder="Confirm Password" required>
                    </div>

                    <button type="submit" class="save-btn" id="saveBtn">
                        Save Profile
                    </button>
                         </div>
            </form>
            
                    <form id="deleteProfileForm" method="POST" action="DeleteProfileA?AID=<%= (int) session.getAttribute("ID") %>">
                <button type="submit" class="save-btn" id="deleteBtn" style="background-color: #d9534f;" onclick="return confirmDelete();">
                    Delete Profile
                </button>
            </form>
           
        <%
            } else if (userType != null && userType.equals("Employee")) {
        %>
            <form id="profileForm" action="UpdateEmps" method="post" enctype="multipart/form-data">
                <div class="main-form">
                    <h2>Employee Profile Settings</h2>
                    <div class="sub_part">
                        <label for="email">Email</label>
                        <i class="fa fa-envelope"></i>
                        <input type="email" id="email" name="email" value='<%= (String) session.getAttribute("email") %>' placeholder="Enter Email" required>
                    </div>

                    <div class="sub_part">
                        <label for="phone">Mobile Number</label>
                        <i class="fa fa-phone"></i>
                        <input type="tel" id="phone" name="phone" value='<%= (String) session.getAttribute("phone") %>' placeholder="Enter Phone Number" required>
                    </div>

                    <div class="sub_part">
                        <label for="img">Add Image</label>
                        <input type="file" id="img" name="imgUrl">
                    </div>

                    <div class="sub_part">
                        <label for="password">Password</label>
                        <i class="fa fa-lock"></i>
                        <input type="password" id="password" name="password" value='<%= (String) session.getAttribute("password") %>' placeholder="Password" required>
                    </div>

                    <div class="sub_part">
                        <label for="Confirmpassword">Confirm Password</label>
                        <i class="fa fa-lock"></i>
                        <input type="password" id="Confirmpassword" name="Confirmpassword" placeholder="Confirm Password" required>
                    </div>

                    <button type="submit" class="save-btn" id="saveBtn">
                        Save Profile
                    </button>
                          </div>
            </form>
                    <form id="deleteProfileForm" method="POST" action="DeleteProfileE?EmID=<%= (int) session.getAttribute("ID") %>">
                <button type="submit" class="save-btn" id="deleteBtn" style="background-color: #d9534f;" onclick="return confirmDelete();">
                    Delete Profile
                </button>
            </form>
          
            
        <%
            } else if (userType != null && userType.equals("Manager")) {
        %>
            <form id="profileForm" action="EditProfileM" method="post" enctype="multipart/form-data">
                <div class="main-form">
                    <h2>Manager Profile Settings</h2>
                    <div class="sub_part">
                        <label for="email">Email</label>
                        <i class="fa fa-envelope"></i>
                        <input type="email" id="email" name="email" value='<%= (String) session.getAttribute("email") %>' placeholder="Enter Email" required>
                    </div>

                    <div class="sub_part">
                        <label for="phone">Mobile Number</label>
                        <i class="fa fa-phone"></i>
                        <input type="tel" id="phone" name="phone" value='<%= (String) session.getAttribute("phone") %>' placeholder="Enter Phone Number" required>
                    </div>

                    <div class="sub_part">
                        <label for="img">Add Image</label>
                        <input type="file" id="img" name="imgUrl">
                    </div>

                    <div class="sub_part">
                        <label for="password">Password</label>
                        <i class="fa fa-lock"></i>
                        <input type="password" id="password" name="password" value='<%= (String) session.getAttribute("password") %>' placeholder="Password" required>
                    </div>

                    <div class="sub_part">
                        <label for="Confirmpassword">Confirm Password</label>
                        <i class="fa fa-lock"></i>
                        <input type="password" id="Confirmpassword" name="Confirmpassword" placeholder="Confirm Password" required>
                    </div>

                    <button type="submit" class="save-btn" id="saveBtn">
                        Save Profile
                    </button>
                            </div>
                    </form>
                    <form id="deleteProfileForm" method="POST" action="DeleteProfileM?EmID=<%= (int) session.getAttribute("ID") %>">
                <button type="submit" class="save-btn" id="deleteBtn" style="background-color: #d9534f;" onclick="return confirmDelete();">
                    Delete Profile
                </button>
            </form>
        
            
        <%
            } else if (userType != null && userType.equals("DeliveryPerson")) {
        %>
            <form id="profileForm" action="EditProfileDP" method="post" enctype="multipart/form-data">
                <div class="main-form">
                    <h2>Delivery Person Profile Settings</h2>
                    <div class="sub_part">
                        <label for="email">Email</label>
                        <i class="fa fa-envelope"></i>
                        <input type="email" id="email" name="email" value='<%= (String) session.getAttribute("email") %>' placeholder="Enter Email" required>
                    </div>

                    <div class="sub_part">
                        <label for="phone">Mobile Number</label>
                        <i class="fa fa-phone"></i>
                        <input type="tel" id="phone" name="phone" value='<%= (String) session.getAttribute("phone") %>' placeholder="Enter Phone Number" required>
                    </div>

                    <div class="sub_part">
                        <label for="img">Add Image</label>
                        <input type="file" id="img" name="imgUrl">
                    </div>
                    
                    <div class="sub_part">
                        <label for="vN">Vehicle Number :</label>
                        <i class="fa fa-envelope"></i>
                        <input type="text" id="email" name="vehicleNum" value='<%= (String) session.getAttribute("vehicleNum") %>' placeholder="Enter Vehicle Num" required>
                    </div>
                    <div class="sub_part">
                        <label for="city">City</label>
                        <i class="fa fa-envelope"></i>
                        <input type="text" id="email" name="city" value='<%= (String) session.getAttribute("city") %>' placeholder="Enter City" required>
                    </div>
                    

                    <div class="sub_part">
                        <label for="password">Password</label>
                        <i class="fa fa-lock"></i>
                        <input type="password" id="password" name="password" value='<%= (String) session.getAttribute("password") %>' placeholder="Password" required>
                    </div>

                    <div class="sub_part">
                        <label for="Confirmpassword">Confirm Password</label>
                        <i class="fa fa-lock"></i>
                        <input type="password" id="Confirmpassword" name="Confirmpassword" placeholder="Confirm Password" required>
                    </div>

                    <button type="submit" class="save-btn" id="saveBtn">
                        Save Profile
                    </button>
                         </div>
                    </form>
                     <form id="deleteProfileForm" method="POST" action="DeleteProfileDP?EmID=<%= (int) session.getAttribute("ID") %>">
                <button type="submit" class="save-btn" id="deleteBtn" style="background-color: #d9534f;" onclick="return confirmDelete();">
                    Delete Profile
                </button>
            </form>
           
            
           
        <%
            } else {
        %>
            <h2 style="color: red; text-align: center;">You are not authorized to view this page.</h2>
        <%
            }
        %>
    </div>
    <script>
    function confirmDelete() {
        return confirm("Are you sure you want to delete your profile? This action cannot be undone.");
    }
</script>
</body>

</html>
