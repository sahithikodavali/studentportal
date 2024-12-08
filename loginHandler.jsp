loginhandler.jsp
<%@ page import="java.sql.*, javax.servlet.http.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    Integer studentId = null;

    // Database connection details
    String dbUsername = "root";
    String dbPassword = "Sahiminnu@2";
    String url = "jdbc:mysql://localhost:3306/student";

    try {
        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, dbUsername, dbPassword);

        // SQL query to validate user
        String sql = "SELECT student_id FROM students WHERE name = ? AND password = ?";
        pst = con.prepareStatement(sql);
        pst.setString(1, username);
        pst.setString(2, password);
        rs = pst.executeQuery();

        // Check if credentials match
        if (rs.next()) {
            studentId = rs.getInt("student_id");

            // Avoid conflict with implicit session object
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("student_id", studentId);
            httpSession.setAttribute("username", username);

            response.sendRedirect("welcome.jsp?username=" + username);
        } else {
            out.println("<p class='error-message'>Invalid username or password!</p>");
        }
    } catch (Exception e) {
        out.println("<p class='error-message'>Error: " + e.getMessage() + "</p>");
    } finally {
        // Close resources
        try {
            if (rs != null) rs.close();
            if (pst != null) pst.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
