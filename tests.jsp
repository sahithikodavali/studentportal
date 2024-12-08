<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Database connection details
    String jdbcURL = "jdbc:mysql://localhost:3306/student";
    String dbUser = "root";
    String dbPassword = "Sahiminnu@2";

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // Query to fetch all tests
        String sql = "SELECT * FROM tests";
        statement = connection.createStatement();
        resultSet = statement.executeQuery(sql);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tests</title>
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
            margin-bottom: 20px;
            color: #2d3e50;
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f4f4f4;
        }

        .add-button {
            display: block;
            text-align: center;
            margin: 20px 0;
        }

        .add-button a {
            padding: 10px 20px;
            background-color: #a259ff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }

        .add-button a:hover {
            background-color: #8f47e0;
        }

        .action-button {
            padding: 5px 10px;
            background-color: #5cb85c;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }

        .action-button:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <ul>
            <li><a href="adminHome.jsp" style="color: inherit; text-decoration: none;">Admin Dashboard</a></li>
            <li><a href="tests.jsp" style="color: inherit; text-decoration: none;">Tests</a></li>
            <li><a href="viewStudents.jsp" style="color: inherit; text-decoration: none;">Students</a></li>
            <li><a href="results.jsp" style="color: inherit; text-decoration: none;">Results</a></li>
            
            <li><a href="login.jsp" style="color: inherit; text-decoration: none;">Logout</a></li>
        </ul>
    </div>

    <!-- Content area -->
    <div class="content">
        <h2>All Tests</h2>
        <table>
            <tr>
                <th>Test Name</th>
                <th>Test Date</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
            <%
                while (resultSet.next()) {
                    String testName = resultSet.getString("test_name");
                    Date testDate = resultSet.getDate("test_date");
                    String description = resultSet.getString("description");
            %>
            <tr>
                <td><%= testName %></td>
                <td><%= testDate %></td>
                <td><%= description %></td>
                <td>
                    <a href="addquestion.jsp?test_name=<%= testName %>" class="action-button">Add Questions</a>
                    <a href="viewquestions.jsp?test_name=<%= testName %>" class="action-button">View Questions</a>
                </td>
            </tr>
            <% 
                }
            %>
        </table>
        <div class="add-button">
            <a href="addtest.jsp">Add New Test</a>
        </div>
    </div>
</body>
</html>
<%
    } catch (Exception e) {
        e.printStackTrace(); // Handle exception
    } finally {
        try {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace(); // Handle SQL exception during cleanup
        }
    }
%>
