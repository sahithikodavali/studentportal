<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        input, button {
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        button {
            background-color: #ff4c4c;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #d43c3c;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Delete Student</h1>
        <form action="deleteStudent.jsp" method="post">
            <label for="studentId">Enter Student ID to Delete:</label>
            <input type="number" id="studentId" name="studentId" required placeholder="Enter Student ID">
            <button type="submit">Delete Student</button>
        </form>
        <%
            if (request.getMethod().equalsIgnoreCase("post")) {
                String studentId = request.getParameter("studentId");

                // Database connection details
                String jdbcURL = "jdbc:mysql://localhost:3306/student";
                String dbUser = "root";
                String dbPassword = "Sahiminnu@2";

                Connection connection = null;
                PreparedStatement preparedStatement = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                    // SQL query to delete the student by ID
                    String sql = "DELETE FROM students WHERE student_id = ?";
                    preparedStatement = connection.prepareStatement(sql);
                    preparedStatement.setInt(1, Integer.parseInt(studentId));

                    int rowsAffected = preparedStatement.executeUpdate();
                    if (rowsAffected > 0) {
                        // Redirect to viewstudent.jsp after successful deletion
                        response.sendRedirect("viewStudents.jsp");
                    } else {
                        out.println("<p style='color: red; text-align: center;'>No student found with the given ID.</p>");
                    }
                } catch (Exception e) {
                    out.println("<p style='color: red; text-align: center;'>An error occurred: " + e.getMessage() + "</p>");
                } finally {
                    try { if (preparedStatement != null) preparedStatement.close(); } catch (SQLException ignored) {}
                    try { if (connection != null) connection.close(); } catch (SQLException ignored) {}
                }
            }
        %>
    </div>
</body>
</html>
