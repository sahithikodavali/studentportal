<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Announcements</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
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
        .announcement {
            padding: 15px;
            border-bottom: 1px solid #ccc;
        }
        .announcement:last-child {
            border-bottom: none;
        }
        .title {
            font-size: 20px;
            font-weight: bold;
            color: #007BFF;
        }
        .date {
            font-size: 14px;
            color: #888;
        }
        .content {
            margin-top: 10px;
            font-size: 16px;
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
<a href="welcome.jsp" class="active">Dashboard</a>
        <a href="timetable.jsp">Schedule</a>
        <a href="examboard.jsp">Exam Board</a>
        <a href="displayMarks.jsp">Grade Report</a>
        <a href="enrolledcoures.jsp">Enrolled Courses</a>
        <a href="announcements.jsp">Announcements</a>
        <a href="account.jsp">Account </a>
        <a href="login.jsp">Logout</a>    </div>
    <div class="container">
        <h1>Announcements</h1>

        <div class="announcement">
            <div class="title">Exam Schedule Update</div>
            <div class="date">Posted on: November 15, 2024</div>
            <div class="content">
                The exam schedule for the upcoming semester has been updated. Please check the student portal for details.
            </div>
        </div>

        <div class="announcement">
            <div class="title">New Course Enrollment Open</div>
            <div class="date">Posted on: November 10, 2024</div>
            <div class="content">
                Enrollment for new elective courses for the next semester is now open. Visit the 'Enrolled Courses' section to register.
            </div>
        </div>

        <div class="announcement">
            <div class="title">Library Maintenance</div>
            <div class="date">Posted on: November 8, 2024</div>
            <div class="content">
                The library will be closed for maintenance from November 20-22. Plan your visits accordingly.
            </div>
        </div>
    </div>
</body>
</html>
