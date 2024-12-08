<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<html>
<head>
    <title>Reset Password</title>
</head>
<body>
    <h2>Reset Password</h2>
    
    <!-- Reset password form -->
    <form action="resetpassword.jsp" method="post">
        <label for="newpassword">New Password:</label>
        <input type="password" id="newpassword" name="newpassword" required>
        <br><br>
        <label for="confirmpassword">Confirm New Password:</label>
        <input type="password" id="confirmpassword" name="confirmpassword" required>
        <br><br>
        <input type="submit" value="Reset Password">
    </form>

    <%
        String message = "";
        String newpassword = request.getParameter("newpassword");
        String confirmpassword = request.getParameter("confirmpassword");
        String username = request.getParameter("username"); // You can pass username as a hidden field or session

        if (newpassword != null && confirmpassword != null && newpassword.equals(confirmpassword)) {
            Connection con = null;
            PreparedStatement pst = null;

            try {
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/student"; // Update with your database details
                String dbUsername = "root";  // Your MySQL username
                String dbPassword = "Sahiminnu@2";  // Your MySQL password
                con = DriverManager.getConnection(url, dbUsername, dbPassword);

                // Query to update the password
                String sql = "UPDATE students SET password=? WHERE name=?";
                pst = con.prepareStatement(sql);
                pst.setString(1, newpassword);
                pst.setString(2, username);

                int rowsUpdated = pst.executeUpdate();

                if (rowsUpdated > 0) {
                    message = "Password successfully updated.";
                } else {
                    message = "Error updating password.";
                }

            } catch (Exception e) {
                message = "Database error: " + e.getMessage();
            } finally {
                try {
                    if (pst != null) pst.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else if (newpassword != null && !newpassword.equals(confirmpassword)) {
            message = "Passwords do not match.";
        }

        // Display any error message
        if (!message.isEmpty()) {
            out.println("<p style='color: red;'>" + message + "</p>");
        }
    %>
</body>
</html>
