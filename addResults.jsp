<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            padding: 20px;
        }
        form {
            max-width: 600px;
            margin: 0 auto;
            background: #ffffff;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        select, input[type="text"], input[type="number"], button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Add Student Results</h2>
    <form method="post" action="processAddResults.jsp">
        <label for="studentId">Select Student ID:</label>
        <select name="studentId" id="studentId" required>
            <option value="">--Select Student--</option>
            <%
                String url = "jdbc:mysql://localhost:3306/student"; // Replace with your DB name
                String user = "root"; // Replace with your MySQL username
                String password = "Sahiminnu@2"; // Replace with your MySQL password

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection(url, user, password);
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT student_id, name FROM students");

                    while (rs.next()) {
                        int studentId = rs.getInt("student_id");
                        String studentName = rs.getString("name");
                        out.println("<option value='" + studentId + "'>" + studentId + " - " + studentName + "</option>");
                    }

                    rs.close();
                    stmt.close();
                    con.close();
                } catch (Exception e) {
                    out.println("<option value=''>Error fetching data</option>");
                    e.printStackTrace();
                }
            %>
        </select>

        <label for="subject">Subject:</label>
        <input type="text" name="subject" id="subject" placeholder="Enter Subject" required />

        <label for="marks">Marks:</label>
        <input type="number" name="marks" id="marks" placeholder="Enter Marks" required min="0" max="100" />

        <button type="submit">Add Result</button>
    </form>
</body>
</html>
