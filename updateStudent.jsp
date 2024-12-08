<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Student Details</title>
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
        <h1>Update Student Details</h1>
        
        <!-- Form to search for student details by ID -->
        <form method="get" action="">
            <label for="searchStudentId">Enter Student ID to Search</label>
            <input type="text" id="searchStudentId" name="searchStudentId" required>
            <input type="submit" value="Search">
        </form>
        
        <% 
            String searchStudentId = request.getParameter("searchStudentId");
            if (searchStudentId != null && !searchStudentId.trim().isEmpty()) {
                try {
                    // Database connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "Sahiminnu@2");
                    
                    // SQL query to fetch the student details
                    String selectQuery = "SELECT * FROM students WHERE student_id = ?";
                    PreparedStatement pstmt = conn.prepareStatement(selectQuery);
                    pstmt.setString(1, searchStudentId);
                    
                    ResultSet rs = pstmt.executeQuery();
                    
                    if (rs.next()) {
        %>
        <!-- Form to update student details -->
        <form method="post" action="">
            <label for="studentId">Student ID</label>
            <input type="text" id="studentId" name="studentId" value="<%= rs.getString("student_id") %>" readonly>

            <label for="name">Name</label>
            <input type="text" id="name" name="name" value="<%= rs.getString("name") %>" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="<%= rs.getString("email") %>" required>

            <label for="age">Age</label>
            <input type="number" id="age" name="age" value="<%= rs.getInt("age") %>" required>

            <!-- Password Update Field -->
            <label for="password">Password (Leave blank if not changing)</label>
            <input type="password" id="password" name="password">

            <input type="submit" value="Update">
        </form>
        <% 
                    } else {
                        out.println("<p class='error'>Student ID not found!</p>");
                    }
                    rs.close();
                    pstmt.close();
                    conn.close();
                } catch (Exception e) {
                    out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
                }
            }
        %>

        <% 
            // Handle the update logic when the form is submitted
            String studentId = request.getParameter("studentId");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String ageStr = request.getParameter("age");
            String password = request.getParameter("password");
            
            if (studentId != null && name != null && email != null && ageStr != null) {
                try {
                    int age = Integer.parseInt(ageStr);
                    
                    // Database connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "Sahiminnu@2");
                    
                    // If password is provided, include it in the update query
                    String updateQuery = "UPDATE students SET name = ?, email = ?, age = ?";
                    if (password != null && !password.trim().isEmpty()) {
                        updateQuery += ", password = ?";
                    }
                    updateQuery += " WHERE student_id = ?";
                    
                    PreparedStatement pstmt = conn.prepareStatement(updateQuery);
                    pstmt.setString(1, name);
                    pstmt.setString(2, email);
                    pstmt.setInt(3, age);
                    
                    if (password != null && !password.trim().isEmpty()) {
                        pstmt.setString(4, password);
                        pstmt.setString(5, studentId);
                    } else {
                        pstmt.setString(4, studentId);
                    }
                    
                    int rows = pstmt.executeUpdate();
                    
                    if (rows > 0) {
                        // Redirect to viewStudent.jsp after successful update
                        response.sendRedirect("viewStudents.jsp");
                    } else {
                        out.println("<p class='error'>Failed to update student details. Please try again.</p>");
                    }
                    
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
