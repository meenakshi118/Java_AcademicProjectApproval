<%@ page import="java.sql.*" %>
<%@ page import="com.project.dao.StudentDao" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Remove Student</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        label {
            font-size: 16px;
            color: #555;
            margin-bottom: 8px;
            display: block;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            background-color: #fafafa;
        }

        input[type="text"]:focus {
            outline: none;
            border-color: #4CAF50;
        }

        .btn {
            display: inline-block;
            padding: 12px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #4CAF50;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
            text-align: center;
            width: 100%;
        }

        .btn:hover {
            background-color: #45a049;
        }

        .account-option {
            text-align: center;
            margin-top: 20px;
        }

        .account-option a {
            font-size: 16px;
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }

        .account-option a:hover {
            text-decoration: underline;
        }

        .footer {
            text-align: center;
            margin-top: 50px;
            font-size: 14px;
            color: #777;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Remove Student</h2>
        <form action="RemoveStudentServlet" method="POST">
            <label for="rollNo">Roll Number:</label>
            <input type="text" name="rollNo" id="rollNo" placeholder="Enter Roll Number" required>

            <button type="submit" class="btn">Remove Student</button>
        </form>
		<div class="note">Please ensure the details are accurate before removing.</div>
        <div class="account-option">
            <a href="admin-dashboard.jsp">Back to dashboard</a>
        </div>
    </div>

    <
</body>
</html>
