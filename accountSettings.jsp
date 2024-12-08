<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Account Settings</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin: 10px 0 5px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        button {
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #0056b3;
        }
                .sidebar {
    width: 250px;
    background-color: #333; /* Match navbar color from welcome.jsp */
    color: white;
    padding: 20px;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
}

.sidebar h2 {
    font-size: 24px;
    margin-bottom: 20px;
}

.sidebar a {
    color: white;
    text-decoration: none;
    padding: 12px 20px;
    border-radius: 5px;
    margin-bottom: 10px;
    transition: background-color 0.3s ease;
    font-size: 16px;
}

.sidebar a:hover {
    background-color: #575757; /* Match hover color from welcome.jsp */
}

.sidebar a.active {
    background-color: #575757; /* Match active color from welcome.jsp */
}
     
    </style>
</head>
<body>
  <div class="sidebar">
        <h2>ACADEMIC</h2>
        <a href="welcome.jsp" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="timetable.jsp"><i class="fas fa-calendar"></i> Schedule</a>
        <a href="examboard.jsp"><i class="fas fa-file-alt"></i> Exam Board</a>
        <a href="grade.jsp"><i class="fas fa-chart-bar"></i> Grade Report</a>
        <a href="enrolledcoures.jsp"><i class="fas fa-book"></i> Enrolled Courses</a>
        <a href="announcements.jsp"><i class="fas fa-bullhorn"></i> Announcements</a>
        <a href="accountSettings.jsp"><i class="fas fa-user-cog"></i> Account Settings</a>
        <a href="login.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
    <div class="container">
        <h1>Account Settings</h1>
        <form action="updateAccount.jsp" method="post">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Enter your username" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter new password" required>

            <button type="submit">Update Settings</button>
        </form>
    </div>
</body>
</html>
