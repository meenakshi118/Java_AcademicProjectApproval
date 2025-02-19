<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add HOD</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px 30px;
            width: 400px;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            color: #555;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: #007bff;
            outline: none;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        .form-container {
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        .note {
            font-size: 12px;
            color: #777;
            margin-top: 10px;
            text-align: center;
        }
         .account-option {
            text-align: center;
            margin-top: 20px;
            font-size: 16px;
        }

        .account-option a {
            color: #FFFFFF;
            text-decoration: none;
            font-weight: bold;
        }

        .account-option a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Add HOD</h1>
        <form action="AddHodServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter full name" required>

            <label for="gmail">Gmail:</label>
            <input type="email" id="gmail" name="gmail" placeholder="Enter email address" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter a secure password" required>

            <label for="course">Course:</label>
            <input type="text" id="course" name="course" placeholder="Enter course name" required>

            <label for="department">Department:</label>
            <input type="text" id="department" name="department" placeholder="Enter department name" required>

            <label for="phone_number">Phone Number:</label>
            <input type="text" id="phone_number" name="phone_number" placeholder="Enter phone number">

            <button type="submit">Add HOD</button>
            
        </form>
        <div class="note">All fields are mandatory except Phone Number.</div>
        <div class="account-option">
            
            <a href="admin-dashboard.jsp">Back to Dashboard</a> <!-- Added link below sign in -->
            
        </div>
    </div>
</body>
</html>
