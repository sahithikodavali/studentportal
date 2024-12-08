<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Exam Board</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9ff;
            display: flex;
        }

        /* Sidebar styling */
        .sidebar {
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

        .sidebar h2 {
            margin-top: 0;
            font-size: 24px;
            margin-bottom: 20px;
            color: #fff;
        }

        .sidebar a {
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            margin-bottom: 10px;
            display: block;
            transition: background 0.3s;
        }

        .sidebar a:hover {
            background-color: #575757;
        }

        .sidebar a.active {
            background-color: #575757;
        }

        /* Main content area */
        .content {
            margin-left: 270px;
            padding: 20px;
            width: calc(100% - 270px);
        }

        h2 {
            margin-bottom: 20px;
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #004080;
            color: #fff;
        }

        .status-upcoming {
            background-color: #d1e7ff;
            padding: 5px 10px;
            border-radius: 5px;
            color: #004080;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>ACADEMIC</h2>
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
        <h2>Exam Board</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Test Name</th>
                    <th>Date</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Database connection
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "Sahiminnu@2");
                        stmt = conn.createStatement();
                        String sql = "SELECT id, test_name, test_date, description FROM tests";
                        rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String testName = rs.getString("test_name");
                            Date testDate = rs.getDate("test_date");
                            String description = rs.getString("description");
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= testName %></td>
                    <td><%= testDate %></td>
                    <td><%= description %></td>
                </tr>
                <% 
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
