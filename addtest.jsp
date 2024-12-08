<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String testName = request.getParameter("test_name");
    String testDate = request.getParameter("test_date");
    String description = request.getParameter("description");

    if (testName != null && testDate != null && description != null) {
        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/student";
        String dbUser = "root";
        String dbPassword = "Sahiminnu@2";

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Query to insert the test into the tests table
            String sql = "INSERT INTO tests (test_name, test_date, description) VALUES (?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, testName);
            preparedStatement.setDate(2, Date.valueOf(testDate));  // Assuming testDate is in YYYY-MM-DD format
            preparedStatement.setString(3, description);

            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                out.println("<script>alert('Test added successfully!'); window.location.href='tests.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace(new java.io.PrintWriter(out)); // Corrected exception handling
        } finally {
            try { if (preparedStatement != null) preparedStatement.close(); } catch (SQLException ignored) {}
            try { if (connection != null) connection.close(); } catch (SQLException ignored) {}
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Test</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        input, textarea {
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        button {
            padding: 10px;
            background-color: #a259ff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #8f47e0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add New Test</h2>
        <form action="addtest.jsp" method="post">
            <input type="text" name="test_name" placeholder="Test Name" required>
            <input type="date" name="test_date" required>
            <textarea name="description" placeholder="Test Description" rows="5" required></textarea>
            <button type="submit">Add Test</button>
        </form>
    </div>
</body>
</html>
