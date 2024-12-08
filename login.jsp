login.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            display: flex;
            height: 100vh;
            margin: 0;
            background-color: #1C1D21;
            font-family: Arial, sans-serif;
        }
        .container {
            display: flex;
            width: 100%;
        }
        .login-section {
            width: 40%;
            background-color: #1C1D21;
            padding: 40px;
            color: #fff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
        }
        .login-content {
            position: relative;
            z-index: 2;
        }
        .login-section h1 {
            margin-bottom: 10px;
            font-size: 36px;
        }
        .login-section input {
            width: 80%;
            max-width: 300px;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: none;
        }
        .login-section .btn {
            width: 80%;
            max-width: 300px;
            background-color: #a259ff;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .login-section a {
            color: #a259ff;
            text-decoration: none;
            display: block;
            margin-top: 5px;
        }
        .image-section {
            width: 60%;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            border-left: 5px solid #a259ff; /* Border on the left */
            overflow: hidden; /* Ensures no gaps around the image */
        }
        .image-section img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .image-section h2 {
            position: absolute;
            color: #fff;
            font-size: 48px;
            text-align: center;
            z-index: 2;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-section">
            <div class="login-content">
                <h1>Login</h1>
                <p>Enter your account details</p>
                <form action="loginHandler.jsp" method="post">
                    <input type="text" name="username" placeholder="Username" required>
                    <input type="password" name="password" placeholder="Password" required>
                    <a href="forgotPassword.jsp">Forgot Password?</a>
                    <button type="submit" class="btn">Login</button>
                </form>
                <div style="margin-top: 20px;">
                    <p>Admin?</p>
                    <button onclick="window.location.href='adminlogin.jsp'" class="btn" style="background-color: #444;">Login as Admin</button>
                </div>
            </div>
        </div>
        <div class="image-section">
            <img src="image1.png" alt="Illustration">
            <h2></h2>
        </div>
    </div>
</body>
</html>
