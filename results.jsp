<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Student</title>
    <style>
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
            margin-bottom: 20px;
            color: #2d3e50;
        }

        select {
            width: 300px;
            padding: 10px;
            margin: 20px 0;
            font-size: 16px;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <ul>
           <li><a href="adminHome.jsp" style="color: inherit; text-decoration: none;">Admin Dashboard</a></li>
            <li><a href="tests.jsp" style="color: inherit; text-decoration: none;">Tests</a></li>
            <li><a href="viewStudents.jsp" style="color: inherit; text-decoration: none;">Students</a></li>
            <li><a href="results.jsp" style="color: inherit; text-decoration: none;">Results</a></li>
            
            <li><a href="login.jsp" style="color: inherit; text-decoration: none;">Logout</a></li>
        </ul>
    </div>

    <div class="content">
        <h2>Select a Student</h2>
        <form method="post" action="addResults.jsp">
            <label for="studentId">Student ID:</label>
            <select name="studentId" id="studentId" required>
                <option value="">--Select Student--</option>
                <%
                    String url = "jdbc:mysql://localhost:3306/student"; // Replace 'your_database_name' with your DB name
                    String user = "root"; // Replace with your MySQL username
                    String password = "Sahiminnu@2"; // Replace with your MySQL password

                    try {
                        // Load MySQL JDBC Driver
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        // Establish Connection
                        Connection con = DriverManager.getConnection(url, user, password);

                        // Execute Query
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT student_id FROM students");

                        // Populate Dropdown
                        while (rs.next()) {
                            int studentId = rs.getInt("student_id");
                            out.println("<option value='" + studentId + "'>" + studentId + "</option>");
                        }

                        // Close resources
                        rs.close();
                        stmt.close();
                        con.close();
                    } catch (Exception e) {
                        out.println("<option value=''>Error fetching data</option>");
                        e.printStackTrace();
                    }
                %>
            </select>
            <br>

            <div class="button-container">
                <button type="submit">Add Result</button>
                <button type="button" onclick="window.location.href='showResults.jsp'">Show Results</button>
            </div>
        </form>
    </div>
</body>
</html>
