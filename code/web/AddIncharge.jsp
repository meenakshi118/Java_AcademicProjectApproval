<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Add Project Incharge</title>
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
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 20px;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-size: 1rem;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="email"],
        input[type="password"],
        input[type="text"] {
            font-size: 1rem;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
            transition: border 0.3s ease;
        }

        input[type="email"]:focus,
        input[type="password"]:focus,
        input[type="text"]:focus {
            border-color: #4CAF50;
            outline: none;
        }

        input[type="submit"] {
            font-size: 1.1rem;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .form-footer {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        
          .account-option {
    text-align: center;
    margin-top: 20px;
    font-size: 16px;
}

.account-option a {
    color: #007BFF; /* Adjust the color as per your theme */
    text-decoration: none;
    font-weight: bold;
}

.account-option a:hover {
    text-decoration: underline;
}
.note {
            font-size: 12px;
            color: #777;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Add Project Incharge</h2>
        <form action="AddInchargeServlet" method="post">
        
           <label for="name">Incharge Name:</label>
            <input type="text" id="name" name="name" required>
        
            <label for="gmail">Email:</label>
            <input type="email" id="gmail" name="gmail" required>
            
            
            <label for="department">Department:</label>
            <input type="text" id="department" name="department" required>

        
            <label for="phoneNumber">Phone Number:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

          <div class="note">All fields are mandatory.</div>

            <div class="form-footer">
                <input type="submit" value="Add Incharge">
            </div>
        </form>
   

    
            <div class="account-option">
            
            <a href="admin-dashboard.jsp">Back to Dashboard</a> <!-- Added link below sign in -->
            
        </div>
        
         </div>
</body>
</html>
