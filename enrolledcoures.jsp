<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam Board</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Main styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            background-color: #f4f6f9;
            height: 100vh;
        }

      /* Updated Sidebar styling for examboard.jsp */
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


        /* Content Styling */
        .content {
            margin-left: 270px;
            padding: 30px;
            width: calc(100% - 270px);
            background-color: #fff;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            overflow-y: auto;
        }

        h3 {
            font-size: 36px;
            margin-bottom: 40px;
            color: #2c3e50;
        }

        .course-card {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 30px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .course-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.15);
        }

        .course-card h4 {
            font-size: 24px;
            color: #2980b9;
            margin-bottom: 15px;
            font-weight: 600;
        }

        .course-card p {
            font-size: 16px;
            color: #7f8c8d;
            margin-bottom: 12px;
        }

        .course-card a.button {
            display: inline-block;
            padding: 12px 25px;
            background-color: #3498db;
            color: white;
            border-radius: 30px;
            text-decoration: none;
            font-size: 16px;
            text-align: center;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .course-card a.button:hover {
            background-color: #2980b9;
            transform: scale(1.05);
        }

        /* Responsive styles */
        @media (max-width: 768px) {
            .sidebar {
                width: 220px;
            }

            .content {
                margin-left: 240px;
                padding: 25px;
            }

            .course-card h4 {
                font-size: 22px;
            }

            .course-card p {
                font-size: 15px;
            }

            .course-card a.button {
                padding: 10px 20px;
                font-size: 14px;
            }
        }

        @media (max-width: 480px) {
            .sidebar {
                width: 100%;
                padding: 15px;
                position: relative;
                height: auto;
            }

            .content {
                margin-left: 0;
                padding: 20px;
            }

            .course-card {
                padding: 15px;
            }

            .course-card h4 {
                font-size: 18px;
            }

            .course-card a.button {
                padding: 8px 15px;
                font-size: 14px;
            }
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
        <a href="login.jsp">Logout</a>
    </div>

    <div class="content">
        <h3>Enrolled Courses</h3>

        <div class="course-card">
            <h4>Course Name: Data Structures and Algorithms</h4>
            <p><strong>Instructor:</strong> Dr. John Smith</p>
            <p><strong>Duration:</strong> January 2024 - May 2024</p>
            <p><strong>Credits:</strong> 4</p>
            <a href="courseDetails.jsp?courseId=1" class="button">View Details</a>
        </div>

        <div class="course-card">
            <h4>Course Name: Database Management Systems</h4>
            <p><strong>Instructor:</strong> Prof. Emily Davis</p>
            <p><strong>Duration:</strong> January 2024 - May 2024</p>
            <p><strong>Credits:</strong> 3</p>
            <a href="courseDetails.jsp?courseId=2" class="button">View Details</a>
        </div>

        <div class="course-card">
            <h4>Course Name: Web Development</h4>
            <p><strong>Instructor:</strong> Mr. Alex Johnson</p>
            <p><strong>Duration:</strong> January 2024 - May 2024</p>
            <p><strong>Credits:</strong> 3</p>
            <a href="courseDetails.jsp?courseId=3" class="button">View Details</a>
        </div>
    </div>
</body>
</html>
