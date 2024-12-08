<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.*" %>
<html>
<head>
    <title>View Questions</title>
</head>
<body>
    <h1>View Questions for Test</h1>

    <%
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            out.println("<h3>Test ID is missing. Please provide a valid Test ID.</h3>");
        } else {
            try {
                int testId = Integer.parseInt(idParam);
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "password");

                String sql = "SELECT * FROM questions WHERE test_id = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setInt(1, testId);

                ResultSet resultSet = preparedStatement.executeQuery();

                if (!resultSet.next()) {
                    out.println("<h3>No questions found for this Test ID.</h3>");
                } else {
                    out.println("<table border='1'>");
                    out.println("<tr><th>Question</th><th>Option 1</th><th>Option 2</th><th>Option 3</th><th>Option A</th><th>Correct Option</th></tr>");
                    do {
                        String question = resultSet.getString("question");
                        String option1 = resultSet.getString("option1");
                        String option2 = resultSet.getString("option2");
                        String option3 = resultSet.getString("option3");
                        String optionA = resultSet.getString("optionA");
                        String correctOption = resultSet.getString("correct_option");

                        out.println("<tr>");
                        out.println("<td>" + question + "</td>");
                        out.println("<td>" + option1 + "</td>");
                        out.println("<td>" + option2 + "</td>");
                        out.println("<td>" + option3 + "</td>");
                        out.println("<td>" + optionA + "</td>");
                        out.println("<td>" + correctOption + "</td>");
                        out.println("</tr>");
                    } while (resultSet.next());
                    out.println("</table>");
                }

                resultSet.close();
                preparedStatement.close();
                connection.close();

            } catch (Exception e) {
                out.println("<h3>Error occurred: " + e.getMessage() + "</h3>");
                e.printStackTrace(out);
            }
        }
    %>
</body>
</html>
