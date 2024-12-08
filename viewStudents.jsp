<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Students</title>
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

        h1 {
            text-align: center;
            color: #333;
        }

        /* Table and container styles */
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            text-align: left;
            padding: 10px;
        }

        th {
            background-color: #f4f4f4;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .no-data {
            text-align: center;
            color: #666;
        }

        /* Button styles */
        .buttons {
            text-align: center;
            margin-top: 20px;
        }
        .buttons button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 5px;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
        }
        .buttons button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <ul>
           
           <li><a href="adminhome.jsp" style="color: inherit; text-decoration: none;">Admin Dashboard</a></li>
            <li><a href="tests.jsp" style="color: inherit; text-decoration: none;">Tests</a></li>
            <li><a href="viewStudents.jsp" style="color: inherit; text-decoration: none;">Students</a></li>
            <li><a href="results.jsp" style="color: inherit; text-decoration: none;">Results</a></li>
            
            <li><a href="login.jsp" style="color: inherit; text-decoration: none;">Logout</a></li>
        </ul>
    </div>

    <!-- Main Content Area -->
    <div class="content">
        <div class="container">
            <h1>Student Records</h1>
            <%
                // Database connection details
                String jdbcURL = "jdbc:mysql://localhost:3306/student";
                String dbUser = "root";
                String dbPassword = "Sahiminnu@2";

                Connection connection = null;
                PreparedStatement preparedStatement = null;
                ResultSet resultSet = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                    // SQL query to fetch all student records
                    String sql = "SELECT student_id, name, email, age, password FROM students";
                    preparedStatement = connection.prepareStatement(sql);
                    resultSet = preparedStatement.executeQuery();

                    if (!resultSet.isBeforeFirst()) {
                        out.println("<p class='no-data'>No student records found.</p>");
                    } else {
            %>
            <table>
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Age</th>
                        <th>Password</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        while (resultSet.next()) {
                            int studentId = resultSet.getInt("student_id");
                            String name = resultSet.getString("name");
                            String email = resultSet.getString("email");
                            int age = resultSet.getInt("age");
                            String password = resultSet.getString("password");
                    %>
                    <tr>
                        <td><%= studentId %></td>
                        <td><%= name %></td>
                        <td><%= email %></td>
                        <td><%= age %></td>
                        <td><%= password %></td>
                    </tr>
                    <%
                        }
                    }
                    %>
                </tbody>
            </table>
            <%
                } catch (Exception e) {
                    out.println("<p style='color: red; text-align: center;'>An error occurred: " + e.getMessage() + "</p>");
                } finally {
                    try { if (resultSet != null) resultSet.close(); } catch (SQLException ignored) {}
                    try { if (preparedStatement != null) preparedStatement.close(); } catch (SQLException ignored) {}
                    try { if (connection != null) connection.close(); } catch (SQLException ignored) {}
                }
            %>

            <!-- Buttons for adding, updating, and deleting students -->
            <div class="buttons">
                <button onclick="window.location.href='addStudent.jsp'">Add Student</button>
                <button onclick="window.location.href='updateStudent.jsp'">Update Student</button>
                <button onclick="window.location.href='deleteStudent.jsp'">Delete Student</button>
            </div>
        </div>
    </div>
</body>
</html>
