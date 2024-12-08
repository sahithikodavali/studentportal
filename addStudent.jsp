<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 50px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333333;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #555555;
        }
        input[type="text"], input[type="number"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #cccccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .success {
            color: green;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add Student Details</h1>
        <form method="post" action="">
            <label for="studentId">Student ID</label>
            <input type="text" id="studentId" name="studentId" required>

            <label for="name">Name</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>

            <label for="age">Age</label>
            <input type="number" id="age" name="age" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Add Student">
        </form>

        <% 
            String studentId = request.getParameter("studentId");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String ageStr = request.getParameter("age");
            String password = request.getParameter("password");

            if (studentId != null && name != null && email != null && ageStr != null && password != null) {
                try {
                    int age = Integer.parseInt(ageStr);

                    // Database connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "Sahiminnu@2");

                    // SQL query
                    String query = "INSERT INTO students (student_id, name, email, age, password) VALUES (?, ?, ?, ?, ?)";
                    PreparedStatement pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, studentId);
                    pstmt.setString(2, name);
                    pstmt.setString(3, email);
                    pstmt.setInt(4, age);
                    pstmt.setString(5, password);

                    int rows = pstmt.executeUpdate();

                    if (rows > 0) {
                        out.println("<p class='success'>Student details added successfully!</p>");
                        // Redirect to viewStudents.jsp page
                        response.sendRedirect("viewStudents.jsp");
                    } else {
                        out.println("<p class='error'>Failed to add student details. Please try again.</p>");
                    }

                    // Close resources
                    pstmt.close();
                    conn.close();
                } catch (Exception e) {
                    out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
                }
            }
        %>
    </div>
</body>
</html>
