
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Remove HOD</title>
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

        .form-container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px 30px;
            width: 400px;
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
        }

        label {
            display: block;
            font-weight: bold;
            color: #555;
            margin-bottom: 5px;
            text-align: left;
        }

        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        input[type="text"]:focus,
        input[type="email"]:focus {
            border-color: #ff4b4b;
            outline: none;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #ff4b4b;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #d13838;
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
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Remove Incharge</h1>
        <form action="RemoveInchargeServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter Incharge name" required>

            <label for="gmail">Gmail:</label>
            <input type="email" id="gmail" name="gmail" placeholder="Enter Incharge email" required>

            <button type="submit">Remove Incharge</button>
        </form>
        <div class="note">Please ensure the details are accurate before removing.</div>
        <div class="account-option">
            <a href="admin-dashboard.jsp">Back to dashboard</a>
        </div>
    </div>
</body>
</html>

