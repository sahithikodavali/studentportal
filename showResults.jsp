<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Show Results</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        /* General reset */
        body, ul, li {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            display: flex;
            background-color: #f9f9f9;
        }

        /* Sidebar styling */
        .sidebar {
            width: 200px;
            background-color: #2d3e50;
            color: #ffffff;
            height: 100vh;
            padding: 20px;
        }

        .sidebar ul {
            list-style: none;
        }

        .sidebar li {
            padding: 15px 0;
            cursor: pointer;
            border-bottom: 1px solid #394b59;
            transition: background 0.3s;
        }

        .sidebar li:hover, .sidebar .active {
            background-color: #1f2b38;
        }

        .sidebar a {
            color: inherit;
            text-decoration: none;
        }

        /* Content styling */
        .content {
            flex: 1;
            padding: 20px;
            background-color: #ffffff;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background: #ffffff;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            text-align: left;
            padding: 12px;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        canvas {
            display: block;
            margin: 0 auto;
        }

        a {
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
            display: inline-block;
            margin-top: 20px;
        }

        a:hover {
            color: #45a049;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="tests.jsp">Tests</a></li>
            <li><a href="viewStudents.jsp">Student</a></li>
            <li class="active"><a href="results.jsp">Results</a></li>
            <li><a href="viewProfile.jsp">Profile</a></li>
            <li><a href="login.jsp">Logout</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="content">
        <h2>Student Results</h2>
        <form method="get" action="">
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
                        ResultSet rs = stmt.executeQuery("SELECT DISTINCT student_id FROM results");

                        while (rs.next()) {
                            int studentId = rs.getInt("student_id");
                            out.println("<option value='" + studentId + "'>" + studentId + "</option>");
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
            <button type="submit">Show Results</button>
        </form>

        <%
            String studentIdParam = request.getParameter("studentId");
            if (studentIdParam != null && !studentIdParam.isEmpty()) {
                int studentId = Integer.parseInt(studentIdParam);

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection(url, user, password);
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT subject, marks FROM results WHERE student_id = " + studentId);

                    StringBuilder subjects = new StringBuilder();
                    StringBuilder marks = new StringBuilder();

                    while (rs.next()) {
                        String subject = rs.getString("subject");
                        int mark = rs.getInt("marks");

                        subjects.append("'").append(subject).append("',");
                        marks.append(mark).append(",");
                    }

                    rs.close();
                    stmt.close();
                    con.close();

                    // Remove trailing commas
                    if (subjects.length() > 0 && marks.length() > 0) {
                        subjects.setLength(subjects.length() - 1);
                        marks.setLength(marks.length() - 1);
                    }
        %>
        <h3>Results for Student ID: <%= studentId %></h3>
        <canvas id="resultsChart" width="400" height="400"></canvas>
        <script>
            const ctx = document.getElementById('resultsChart').getContext('2d');
            const resultsChart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: [<%= subjects.toString() %>],
                    datasets: [{
                        label: 'Marks',
                        data: [<%= marks.toString() %>],
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        tooltip: {
                            callbacks: {
                                label: function(tooltipItem) {
                                    return tooltipItem.label + ': ' + tooltipItem.raw + ' marks';
                                }
                            }
                        }
                    }
                }
            });
        </script>
        <%
                } catch (Exception e) {
                    out.println("<p>Error fetching data for student ID: " + studentId + "</p>");
                    e.printStackTrace();
                }
            }
        %>
        <a href="addResults.jsp">Back to Add Results</a>
    </div>
</body>
</html>
