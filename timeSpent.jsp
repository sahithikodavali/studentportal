<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<%
    // Retrieve the start time from the session
    HttpSession session = request.getSession();
    Long startTime = (Long) session.getAttribute("startTime");

    if (startTime == null) {
        // If no start time is found, set it to the current time
        startTime = System.currentTimeMillis();
        session.setAttribute("startTime", startTime);
    }

    long endTime = System.currentTimeMillis();
    long timeSpent = (endTime - startTime) / 1000; // Time in seconds

    // Get username from session
    String username = (String) session.getAttribute("username");

    if (username != null) {
        // Database connection details
        String dbUrl = "jdbc:mysql://localhost:3306/student";
        String dbUser = "root";
        String dbPassword = "Sahiminnu@2";

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection
            Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            
            // SQL query to insert time spent data
            String query = "INSERT INTO TimeSpent (username, time_spent) VALUES (?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setLong(2, timeSpent);
            ps.executeUpdate(); // Execute the query

            // Clean up
            ps.close();
            conn.close();
            
            // Optionally, you can reset the session start time for the next session
            session.setAttribute("startTime", System.currentTimeMillis());

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Time Spent</title>
</head>
<body>
    <h1>Time Spent Successfully Recorded!</h1>
</body>
</html>
