<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Retrieve form data
    String testName = request.getParameter("test_name");
    String question = request.getParameter("question");
    String option1 = request.getParameter("option1");
    String option2 = request.getParameter("option2");
    String option3 = request.getParameter("option3");
    String option4 = request.getParameter("option4");
    int correctOption = Integer.parseInt(request.getParameter("correct_option"));

    // Database connection details
    String jdbcURL = "jdbc:mysql://localhost:3306/student";
    String dbUser = "root";
    String dbPassword = "Sahiminnu@2";

    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // Insert question into the database
        String sql = "INSERT INTO questions (test_name, question, option1, option2, option3, option4, correct_option) VALUES (?, ?, ?, ?, ?, ?, ?)";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, testName);
        preparedStatement.setString(2, question);
        preparedStatement.setString(3, option1);
        preparedStatement.setString(4, option2);
        preparedStatement.setString(5, option3);
        preparedStatement.setString(6, option4);
        preparedStatement.setInt(7, correctOption);

        int rows = preparedStatement.executeUpdate();
        if (rows > 0) {
%>
            <script>
                alert("Question added successfully!");
                window.location.href = "tests.jsp"; // Redirect back to the tests page
            </script>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
%>
        <script>
            alert("Failed to add question. Please try again.");
            window.location.href = "addquestion.jsp?test_name=<%= testName %>";
        </script>
<%
    } finally {
        try {
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>
