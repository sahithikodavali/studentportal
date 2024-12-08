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
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            background-color: #f9f9f9;
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
            margin-left: 260px; /* Adjust to create space for the sidebar */
            padding: 20px;
            width: 100%;
        }

        h2 {
            font-size: 28px;
            color: #004080;
            margin-bottom: 20px;
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 8px; /* Reduced padding */
            text-align: left;
            border-bottom: 1px solid #ddd;
            font-size: 14px; /* Reduced font size */
        }

        th {
            background-color: #004080;
            color: #fff;
        }

        /* Responsive Design for smaller screens */
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }

            .content {
                margin-left: 0;
                width: 100%;
            }

            table {
                font-size: 12px; /* Reduce table text size on small screens */
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
        <h2>Student Timetable</h2>
        <table>
            <thead>
                <tr>
                    <th>Day</th>
                    <th>9:00-10:00</th>
                    <th>10:00-11:00</th>
                    <th>11:00-12:00</th>
                    <th>12:00-1:00</th>
                    <th>2:00-3:00</th>
                    <th>3:00-4:00</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Monday</td>
                    <td>Calculus</td>
                    <td>Physics</td>
                    <td>Data Structures</td>
                    <td>Lunch Break</td>
                    <td>Thermodynamics</td>
                    <td>Engineering Mechanics</td>
                </tr>
                <tr>
                    <td>Tuesday</td>
                    <td>Electronics</td>
                    <td>Chemistry</td>
                    <td>Computer Networks</td>
                    <td>Lunch Break</td>
                    <td>Linear Algebra</td>
                    <td>Technical Drawing</td>
                </tr>
                <tr>
                    <td>Wednesday</td>
                    <td>Programming in C</td>
                    <td>Calculus</td>
                    <td>Mechanical Workshop</td>
                    <td>Lunch Break</td>
                    <td>Physics Lab</td>
                    <td>Engineering Ethics</td>
                </tr>
                <tr>
                    <td>Thursday</td>
                    <td>Signals and Systems</td>
                    <td>Thermodynamics</td>
                    <td>Calculus</td>
                    <td>Lunch Break</td>
                    <td>Computer Lab</td>
                    <td>Soft Skills</td>
                </tr>
                <tr>
                    <td>Friday</td>
                    <td>Linear Algebra</td>
                    <td>Chemistry</td>
                    <td>Programming in Java</td>
                    <td>Lunch Break</td>
                    <td>Microprocessors</td>
                    <td>Project Work</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
