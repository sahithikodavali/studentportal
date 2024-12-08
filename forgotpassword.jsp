<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<html>
<head>
    <title>Forgot Password</title>
</head>
<body>
    <h2>Forgot Password</h2>
    <form action="forgotpassword.jsp" method="post">
        <label for="username">Enter Username or Email:</label>
        <input type="text" id="username" name="username" required>
        <br><br>
        <input type="submit" value="Reset Password">
    </form>

    <%
        String message = "";
        String username = request.getParameter("username");

        if (username != null) {
            Connection con = null;
            PreparedStatement pst = null;
            ResultSet rs = null;

            try {
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/student"; // Update with your database details
                String dbUsername = "root";  // Your MySQL username
                String dbPassword = "Sahiminnu@2";  // Your MySQL password
                con = DriverManager.getConnection(url, dbUsername, dbPassword);

                // Query to check if the user exists
                String sql = "SELECT * FROM students WHERE name=? OR email=?";
                pst = con.prepareStatement(sql);
                pst.setString(1, username);
                pst.setString(2, username);

                rs = pst.executeQuery();

                if (rs.next()) {
                    // You can implement an email service to send a password reset link here
                    message = "A password reset link has been sent to your email.";  // Replace with email logic
                } else {
                    message = "Username or email not found.";
                }

            } catch (Exception e) {
                message = "Database error: " + e.getMessage();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (pst != null) pst.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        // Display any error message
        if (!message.isEmpty()) {
            out.println("<p style='color: red;'>" + message + "</p>");
        }
    %>
</body>
</html>
