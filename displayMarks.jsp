<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Display Marks</title>
    <style>
        /* Body and general styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            display: flex;
        }

        /* Side navbar styles */
        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #333;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 20px;
        }

        .sidebar a {
            padding: 15px 25px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
            transition: background-color 0.3s;
        }

        .sidebar a:hover {
            background-color: #575757;
        }

        /* Main content area */
        .content {
            margin-left: 250px;
            padding: 20px;
            width: 100%;
        }

        /* Table and styling */
        table {
            width: 50%;
            border-collapse: collapse;
            margin: 20px auto;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f4f4f4;
        }

        .message {
            text-align: center;
            color: red;
        }

        /* Chart styles */
        canvas {
            display: block;
            margin: 20px auto;
        }

    </style>
    <!-- Include Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <!-- Side Navbar -->
    <div class="sidebar">
        <h2 style="color: white; text-align: center;">Student Portal</h2>
        <a href="welcome.jsp" class="active">Dashboard</a>
        <a href="timetable.jsp">Schedule</a>
        <a href="examboard.jsp">Exam Board</a>
        <a href="displayMarks.jsp">Grade Report</a>
        <a href="enrolledcoures.jsp">Enrolled Courses</a>
        <a href="announcements.jsp">Announcements</a>
        <a href="account.jsp">Account </a>
        <a href="login.jsp">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="content">
        <%
            // Retrieve student ID from the session
            Integer studentId = (Integer) session.getAttribute("student_id");

            if (studentId == null) {
                response.sendRedirect("login.jsp"); // Redirect to login if not logged in
                return;
            }
        %>

        <h2>Marks for Student ID: <%= studentId %></h2>

        <%
            Connection con = null;
            PreparedStatement pst = null;
            ResultSet rs = null;

            // Arrays to store subjects and marks for chart
            StringBuilder subjects = new StringBuilder();
            StringBuilder marks = new StringBuilder();

            try {
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/student"; // Update with your database name
                String dbUsername = "root";  // Your MySQL username
                String dbPassword = "Sahiminnu@2";  // Your MySQL password
                con = DriverManager.getConnection(url, dbUsername, dbPassword);

                // Query to fetch marks
                String sql = "SELECT subject, marks FROM results WHERE student_id = ?";
                pst = con.prepareStatement(sql);
                pst.setInt(1, studentId);
                rs = pst.executeQuery();

                // Check if marks are available
                if (!rs.isBeforeFirst()) {
        %>
                    <p class="message">No marks found for the given student ID.</p>
        <%
                } else {
        %>
                    <table>
                        <tr>
                            <th>Subject</th>
                            <th>Marks</th>
                        </tr>
        <%
                    // Populate the subjects and marks for chart
                    while (rs.next()) {
                        String subject = rs.getString("subject");
                        int mark = rs.getInt("marks");
                        subjects.append("'").append(subject).append("', ");
                        marks.append(mark).append(", ");
        %>
                        <tr>
                            <td><%= subject %></td>
                            <td><%= mark %></td>
                        </tr>
        <%
                    }
        %>
                    </table>
        <%
                }
            } catch (Exception e) {
        %>
                <p class="message">Error: <%= e.getMessage() %></p>
        <%
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

            // Clean up the subject and marks data (remove the last comma and space)
            if (subjects.length() > 0) subjects.setLength(subjects.length() - 2);
            if (marks.length() > 0) marks.setLength(marks.length() - 2);
        %>

        <!-- Canvas for Pie Chart -->
        <canvas id="marksChart" width="400" height="400"></canvas>

        <script>
            // Chart.js script to render the pie chart
            var ctx = document.getElementById('marksChart').getContext('2d');
            var marksChart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: [<%= subjects.toString() %>],
                    datasets: [{
                        label: 'Marks Distribution',
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
    </div>
</body>
</html>
