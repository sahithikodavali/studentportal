<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home Page</title>
    <style>
        /* General reset */
        body, ul, li {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            display: flex;
            background-color: #f5f7fa;
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

        /* Content styling */
        .content {
            flex: 1;
            padding: 20px;
            background-color: #ffffff;
        }

        h2 {
            margin-bottom: 20px;
            color: #2d3e50;
        }

        /* Main section styling */
        .main-section {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        /* Chart container */
        .chart-container {
            width: 300px; /* Fixed width */
            height: 300px; /* Fixed height */
            background-color: #eaf0f6;
            border-radius: 10px;
            padding: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .summary {
            font-size: 18px;
            margin-bottom: 5px;
            color: #333;
        }

        /* Legend */
        .legend {
            font-size: 14px;
            color: #555;
        }

        .legend p {
            margin: 5px 0;
        }

        .color-box {
            display: inline-block;
            width: 12px;
            height: 12px;
            margin-right: 5px;
            border-radius: 2px;
        }

        /* Side panel styling */
        .side-panel {
            width: 30%;
            background-color: #f7f9fc;
            border-left: 2px solid #e0e0e0;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .create-section button {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-bottom: 20px;
            transition: background 0.3s;
        }

        .create-section button:hover {
            background-color: #0056b3;
        }

        /* Scheduled section */
        .scheduled-section h3 {
            color: #2d3e50;
            margin-bottom: 10px;
        }

        .timer {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }

        .scheduled-section p {
            margin-bottom: 5px;
            color: #555;
        }

        .scheduled-section button {
            background-color: #28a745;
            color: #fff;
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .scheduled-section button:hover {
            background-color: #218838;
        }
    </style>
    <!-- Include Chart.js library -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="sidebar">
        <ul>
            <li class="active">Home</li>
            <li><a href="tests.jsp" style="color: inherit; text-decoration: none;">Tests</li>
            <li><a href="viewStudents.jsp" style="color: inherit; text-decoration: none;">Student</a></li>
            <li><a href="results.jsp" style="color: inherit; text-decoration: none;">Results</li>
            
             
            <li><a href="login.jsp" style="color: inherit; text-decoration: none;">Logout</a></li>
        </ul>
    </div>
    <div class="content">
        <h2>Recent test results</h2>
        <div class="main-section">
            <div class="chart-container">
                <canvas id="testResultsChart"></canvas>
            </div>
            <div class="legend">
                <p><span class="color-box" style="background-color: #d72638;"></span> 220 students - 39% Students passing with A grade</p>
                <p><span class="color-box" style="background-color: #3eb489;"></span> 60 students - 49% Students passing with B grade</p>
                <p><span class="color-box" style="background-color: #ff5700;"></span> 76 students - 11% Students passing with C grade</p>
                <p><span class="color-box" style="background-color: #f0e130;"></span> 49 students - 2% Students passing with D grade</p>
                <p><span class="color-box" style="background-color: #800080;"></span> 23 students - 18% Students failing the test</p>
            </div>
        </div>
        <div class="side-panel">
            <div class="create-section">
                <li><a href="tests.jsp" style="color: inherit; text-decoration: none;">Create Test</li>

            </div>
            <div class="scheduled-section">
                <h3>Scheduled test</h3>
                <div class="timer">
                    <span>00</span>:<span>42</span>:<span>10</span>
                </div>
                <p>Geography quiz</p>
                <p>Created on: 12 May, 2023</p>
                <button>Set another</button>
            </div>
        </div>
    </div>

    <script>
        // Data for the chart
        const ctx = document.getElementById('testResultsChart').getContext('2d');
        const testResultsChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: ['A Grade', 'B Grade', 'C Grade', 'D Grade', 'Failed'],
                datasets: [{
                    data: [220, 220, 220, 220, 220],
                    backgroundColor: ['#d72638', '#3eb489', '#ff5700', '#f0e130', '#800080']
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: true,
                plugins: {
                    legend: {
                        display: false
                    }
                }
            }
        });
    </script>
</body>
</html>
