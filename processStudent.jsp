<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Process Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
        }
        table {
            width: 50%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 18px;
            text-align: left;
        }
        table th, table td {
            padding: 12px;
            border: 1px solid #ddd;
        }
        table th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Student Details</h2>
    <%
        // Get the student ID from the request
        String studentId = request.getParameter("studentId");

        if (studentId == null || studentId.isEmpty()) {
            out.println("<p>No student selected. Please go back and choose a student.</p>");
        } else {
            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/your_database_name"; // Replace with your DB name
            String user = "root"; // Replace with your MySQL username
            String password = "password"; // Replace with your MySQL password

            try {
                // Load MySQL JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish Connection
                Connection con = DriverManager.getConnection(url, user, password);

                // Fetch student details
                String query = "SELECT * FROM students WHERE student_id = ?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1, Integer.parseInt(studentId));
                ResultSet rs = ps.executeQuery();

                // Display student details
                if (rs.next()) {
                    out.println("<table>");
                    out.println("<tr><th>Field</th><th>Value</th></tr>");
                    out.println("<tr><td>Student ID</td><td>" + rs.getInt("student_id") + "</td></tr>");
                    out.println("<tr><td>Name</td><td>" + rs.getString("name") + "</td></tr>");
                    out.println("<tr><td>Email</td><td>" + rs.getString("email") + "</td></tr>");
                    out.println("<tr><td>Age</td><td>" + rs.getInt("age") + "</td></tr>");
                    out.println("</table>");
                } else {
                    out.println("<p>No details found for the selected student.</p>");
                }

                // Close resources
                rs.close();
                ps.close();
                con.close();
            } catch (Exception e) {
                out.println("<p>Error fetching student details. Please try again later.</p>");
                e.printStackTrace();
            }
        }
    %>
    <a href="your_previous_jsp_file.jsp">Go Back</a>
</body>
</html>
