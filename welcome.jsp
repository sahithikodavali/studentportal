welcome.jsp

<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    String userName = (String) session.getAttribute("username");

    if (userName == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if the user is not logged in
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            display: flex;
            background-color: #f9f9f9;
        }

        .navbar {
            width: 250px;
            background-color: #333;
            color: #fff;
            display: flex;
            flex-direction: column;
            height: 100vh;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 0;
            left: 0;
        }

        .navbar h2 {
            margin-top: 0;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            margin-bottom: 10px;
            display: block;
            transition: background 0.3s;
        }

        .navbar a:hover {
            background-color: #575757;
        }

        .navbar a.active {
            background-color: #575757;
        }

        .content {
            margin-left: 270px;
            padding: 20px;
            width: calc(100% - 270px);
        }

        .header {
            background-color: #fff;
            padding: 15px 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
        }

        .main-content {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-top: 20px;
        }

        .card {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card h3 {
            margin: 0 0 10px;
        }

        .card .info {
            font-size: 14px;
            margin-bottom: 5px;
        }

        .card .status {
            font-size: 12px;
            padding: 3px 6px;
            border-radius: 5px;
        }

        .status.completed {
            background-color: #d4edda;
            color: #155724;
        }

        .status.in-progress {
            background-color: #fff3cd;
            color: #856404;
        }

        .status.not-submitted {
            background-color: #f8d7da;
            color: #721c24;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h2>Student Portal</h2>
        <a href="welcome.jsp" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="timetable.jsp"><i class="fas fa-calendar"></i> Schedule</a>
        <a href="examboard.jsp"><i class="fas fa-file-alt"></i> Exam Board</a>
        <a href="displayMarks.jsp"><i class="fas fa-chart-bar"></i> Grade Report</a>
        <a href="enrolledcoures.jsp"><i class="fas fa-book"></i> Enrolled Courses</a>
        <a href="announcements.jsp"><i class="fas fa-bullhorn"></i> Announcements</a>
        <a href="account.jsp"><i class="fas fa-user-cog"></i> Account</a>
        <a href="login.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <div class="content">
        <div class="header">
            <h1>Welcome, <%= request.getParameter("username") != null ? request.getParameter("username") : "Guest" %>!</h1> <!-- Dynamically display username -->
            <div>Semester 5 of 8</div>
        </div>
        
        <div class="main-content">
            <div class="card">
                <h3>Java Full Stack Development</h3>
                <div class="info">Prof. Smith</div>
                <div class="info">Mon & Wed</div>
                <div class="info">9:00 AM - 10:30 AM</div>
                <div class="info">C Block</div>
            </div>
            <div class="card">
                <h3>Data Analytics and Visualization</h3>
                <div class="info">Dr. Johnson</div>
                <div class="info">Tue & Thu</div>
                <div class="info">1:30 PM - 3:00 PM</div>
                <div class="info">Computer Lab 3</div>
            </div>
            <!-- Add more course cards as needed -->
        </div>

        <div class="main-content">
            <div class="card">
                <h3>Graphic Fundamentals</h3>
                <div class="info">Assignment: Design Project 1</div>
                <div class="info">Due Date: Sep 22, 2024</div>
                <div class="status not-submitted">Not Submitted</div>
            </div>
            <div class="card">
                <h3>Advanced Web Design</h3>
                <div class="info">Assignment: Responsive Website Project</div>
                <div class="info">Due Date: Sep 5, 2024</div>
                <div class="status completed">Completed</div>
            </div>
            <!-- Add more homework cards as needed -->
        </div>
    </div>
</body>
</html>
