<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Process Add Results</title>
    <style>
        /* General reset */
        body, ul, li {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            display: flex;
            background-color: #f5f7fa;
        }

        /* Sidebar styling */
        .sidebar {
            width: 200px;
            background-color: #2d3e50;
            color: #ffffff;
            height: 100vh;
            padding: 20px;
        }

        .sidebar ul {
            list-style: none;
        }

        .sidebar li {
            padding: 15px 0;
            cursor: pointer;
            border-bottom: 1px solid #394b59;
            transition: background 0.3s;
        }

        .sidebar li:hover, .sidebar .active {
            background-color: #1f2b38;
        }

        /* Content styling */
        .content {
            flex: 1;
            padding: 20px;
            background-color: #ffffff;
        }

        h2 {
            color: #333;
            text-align: center;
        }

        p {
            text-align: center;
            color: #555;
        }

        /* Button styles */
        .action-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #ffffff;
            background-color: #4CAF50;
            padding: 10px 20px;
            border-radius: 5px;
        }

        .action-link:hover {
            background-color: #45a049;
        }

        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <ul>
            <li class="active">Home</li>
            <li><a href="tests.jsp" style="color: inherit; text-decoration: none;">Tests</a></li>
            <li><a href="viewStudents.jsp" style="color: inherit; text-decoration: none;">Student</a></li>
            <li><a href="results.jsp" style="color: inherit; text-decoration: none;">Results</a></li>
            <li><a href="viewProfile.jsp" style="color: inherit; text-decoration: none;">Profile</a></li>
            <li><a href="login.jsp" style="color: inherit; text-decoration: none;">Logout</a></li>
        </ul>
    </div>

    <!-- Main Content Area -->
    <div class="content">
        <h2>Result Submission Status</h2>
        <%
            // Retrieve form data
            String studentId = request.getParameter("studentId");
            String subject = request.getParameter("subject");
            String marks = request.getParameter("marks");

            if (studentId == null || subject == null || marks == null) {
                out.println("<p class='error'>Missing form data. Please go back and fill all fields.</p>");
            } else {
                String url = "jdbc:mysql://localhost:3306/student"; // Replace with your DB name
                String user = "root"; // Replace with your MySQL username
                String password = "Sahiminnu@2"; // Replace with your MySQL password

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection(url, user, password);

                    String query = "INSERT INTO results (student_id, subject, marks) VALUES (?, ?, ?)";
                    PreparedStatement ps = con.prepareStatement(query);
                    ps.setInt(1, Integer.parseInt(studentId));
                    ps.setString(2, subject);
                    ps.setInt(3, Integer.parseInt(marks));

                    int rowsAffected = ps.executeUpdate();

                    if (rowsAffected > 0) {
                        out.println("<p>Result added successfully for Student ID: " + studentId + "</p>");
                    } else {
                        out.println("<p class='error'>Failed to add result. Please try again.</p>");
                    }

                    ps.close();
                    con.close();
                } catch (Exception e) {
                    out.println("<p class='error'>Error while adding result. Please try again later.</p>");
                    e.printStackTrace();
                }
            }
        %>
        <a href="addResults.jsp" class="action-link">Add Another Result</a>
    </div>
</body>
</html>
