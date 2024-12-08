<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
            text-align: center;
        }
        .details {
            margin-top: 20px;
        }
        .details table {
            width: 100%;
            border-collapse: collapse;
        }
        .details th, .details td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        .details th {
            background-color: #f4f4f4;
        }
                .sidebar {
    width: 250px;
    background-color: #333; /* Match navbar color from welcome.jsp */
    color: white;
    padding: 20px;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
}

.sidebar h2 {
    font-size: 24px;
    margin-bottom: 20px;
}

.sidebar a {
    color: white;
    text-decoration: none;
    padding: 12px 20px;
    border-radius: 5px;
    margin-bottom: 10px;
    transition: background-color 0.3s ease;
    font-size: 16px;
}

.sidebar a:hover {
    background-color: #575757; /* Match hover color from welcome.jsp */
}

.sidebar a.active {
    background-color: #575757; /* Match active color from welcome.jsp */
}
     
    </style>
</head>
<body>
<div class="sidebar">
        <a href="welcome.jsp" class="active">Dashboard</a>
        <a href="timetable.jsp">Schedule</a>
        <a href="examboard.jsp">Exam Board</a>
        <a href="displayMarks.jsp">Grade Report</a>
        <a href="enrolledcoures.jsp">Enrolled Courses</a>
        <a href="announcements.jsp">Announcements</a>
        <a href="account.jsp">Account </a>
        <a href="login.jsp">Logout</a>
    </div>
    <div class="container">
        <h2>Account Details</h2>
        <div class="details">
            <table>
                <tr>
                    <th>Student ID</th>
                    <td>
                        <%
                            // Retrieve student ID from session
                            Integer studentId = (Integer) session.getAttribute("student_id");
                            if (studentId == null) {
                                response.sendRedirect("login.jsp");
                                return;
                            }
                            out.print(studentId); // Display student ID
                        %>
                    </td>
                </tr>
                <%
                    // Initialize variables for student details
                    String name = "", email = "";
                    int age = 0;

                    Connection con = null;
                    PreparedStatement pst = null;
                    ResultSet rs = null;

                    try {
                        // Database connection
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        String url = "jdbc:mysql://localhost:3306/student";
                        String dbUsername = "root";
                        String dbPassword = "Sahiminnu@2";
                        con = DriverManager.getConnection(url, dbUsername, dbPassword);

                        // Query to get student details
                        String sql = "SELECT name, email, age FROM students WHERE student_id = ?";
                        pst = con.prepareStatement(sql);
                        pst.setInt(1, studentId);
                        rs = pst.executeQuery();

                        // Fetch student details
                        if (rs.next()) {
                            name = rs.getString("name");
                            email = rs.getString("email");
                            age = rs.getInt("age");
                        }
                    } catch (Exception e) {
                        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (pst != null) pst.close();
                            if (con != null) con.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
                <tr>
                    <th>Name</th>
                    <td><%= name %></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><%= email %></td>
                </tr>
                <tr>
                    <th>Age</th>
                    <td><%= age %></td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
