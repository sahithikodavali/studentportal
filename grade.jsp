<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Grade Report</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Grade Report</h1>
    <%
        // Retrieve username from session
        String username = (String) session.getAttribute("username");

        if (username == null) {
            // Redirect to login page if username is not found in the session
            response.sendRedirect("login.jsp");
            return;
        }

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Database connection details
            String jdbcURL = "jdbc:mysql://localhost:3306/student";
            String dbUser = "root";
            String dbPassword = "Sahiminnu@2";

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Query to retrieve grades for the logged-in user
            String sql = "SELECT subject, marks FROM results WHERE student_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, student_id);

            rs = pstmt.executeQuery();

            if (rs.isBeforeFirst()) {
                // If there are results, display them
    %>
                <table>
                    <thead>
                        <tr>
                            <th>Subject</th>
                            <th>Marks</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            while (rs.next()) {
                                String subject = rs.getString("subject");
                                int marks = rs.getInt("marks");
                        %>
                        <tr>
                            <td><%= subject %></td>
                            <td><%= marks %></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
    <%
            } else {
                // No grades found for the user
                out.println("<p>No grades found for the logged-in user.</p>");
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
            e.printStackTrace(new java.io.PrintWriter(out));
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
            try { if (pstmt != null) pstmt.close(); } catch (SQLException ignored) {}
            try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
        }
    %>
</body>
</html>
