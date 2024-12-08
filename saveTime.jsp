<%@ page import="java.sql.*, javax.servlet.http.*" %>
<%
    int timeSpent = Integer.parseInt(request.getParameter("timeSpent"));
    int studentId = (Integer) session.getAttribute("student_id"); // Assuming student_id is stored in the session

    Connection con = null;
    PreparedStatement pst = null;

    // Database connection details
    String dbUsername = "root";
    String dbPassword = "Sahiminnu@2";
    String url = "jdbc:mysql://localhost:3306/student";

    try {
        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, dbUsername, dbPassword);

        // SQL query to update time spent
        String sql = "UPDATE students SET total_time_spent = total_time_spent + ? WHERE student_id = ?";
        pst = con.prepareStatement(sql);
        pst.setInt(1, timeSpent);
        pst.setInt(2, studentId);

        pst.executeUpdate();
        
        response.sendRedirect("timeSpentSuccess.jsp");
    } catch (Exception e) {
        out.println("<p class='error-message'>Error: " + e.getMessage() + "</p>");
    } finally {
        // Close resources
        try {
            if (pst != null) pst.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
