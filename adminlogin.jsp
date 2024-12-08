<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    if (request.getMethod().equalsIgnoreCase("post")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/student";
        String dbUser = "root";
        String dbPassword = "Sahiminnu@2";

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Insert query to save user data
            String sql = "INSERT INTO admin (username, password) VALUES (?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            int result = preparedStatement.executeUpdate();
            if (result > 0) {
                // Redirect to the welcome page if insert is successful
                response.sendRedirect("adminhome.jsp");
            } else {
                out.println("Error: Unable to save user data.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Database connection problem: " + e.getMessage());
        } finally {
            if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException ignored) {}
            if (connection != null) try { connection.close(); } catch (SQLException ignored) {}
        }
    }
%>
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
    background-color: #f4f4f9; /* Light gray background */
    font-family: Arial, sans-serif;
}

.container {
    display: flex;
    width: 100%;
}

.login-section {
    width: 40%;
    background-color: #ffffff; /* White background for the login section */
    padding: 40px;
    color: #333; /* Dark gray text for better readability */
    display: flex;
    flex-direction: column;
    justify-content: center;
    position: relative;
    background-image: none; /* Remove any background image */
    background-color: #e0e0e0; /* Light gray background for the section */
}

.login-section::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0, 0, 0, 0.1); /* Subtle dark overlay */
    z-index: 1;
}

.login-content {
    position: relative;
    z-index: 2;
}

.login-section h1 {
    margin-bottom: 10px;
    font-size: 36px;
    color: #333; /* Dark gray for headings */
}

.login-section input {
    width: 80%;
    max-width: 300px;
    padding: 10px;
    margin: 10px 0;
    border-radius: 5px;
    border: 1px solid #ccc; /* Light gray border */
}

.login-section .btn {
    width: 80%;
    max-width: 300px;
    background-color: #007bff; /* Classic blue button */
    color: #fff;
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.login-section a {
    color: #007bff; /* Classic blue for links */
    text-decoration: none;
    display: block;
    margin-top: 5px;
}

.illustration-section {
    width: 60%;
    background-color: #ffffff;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #fff;
    text-align: center;
    background-image: url("image3.png"); /* Use a relative path */
    background-size: 50%; /* Scales the image to 50% of the section size */
    background-repeat: no-repeat;
    background-position: center;
}

.illustration-section h2 {
    font-size: 48px;
    color: #333; /* Dark gray for the illustration section heading */
}

    </style>
</head>
<body>
    <div class="container">
        <div class="login-section">
            <div class="login-content">
                <h1>Admin Login</h1>
                <p>Enter your account details</p>
                <form action="adminlogin.jsp" method="post">
                    <input type="text" name="username" placeholder="Username" required>
                    <input type="password" name="password" placeholder="Password" required>
                   
                    <button type="submit" class="btn">Login</button>
                    
                </form>
                <div style="margin-top: 20px;">
                    
                </div>
            </div>
        </div>
        <div class="illustration-section">
            <h2></h2>
        </div>
    </div>
</body>
</html>
