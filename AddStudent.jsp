<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }
        .form-container {
            max-width: 500px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #495057;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn {
            width: 100%;
            padding: 10px;
            background-color: #ff6f61;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        .btn:hover {
            background-color: #e95b50;
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
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Add Student</h2>
        <form action="AddStudentServlet" method="post">
            <div class="form-group">
                <label for="rollNo">Roll Number</label>
                <input type="text" id="rollNo" name="rollNo" required>
            </div>
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="department">Department</label>
                <input type="text" id="department" name="department" required>
            </div>
            <div class="form-group">
                <label for="course">Course</label>
                <input type="text" id="course" name="course" required>
            </div>
            
            <div class="form-group">
                <label for="semester">Semester</label>
                <input type="text" id="semester" name="semester" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <button type="submit" class="btn">Add Student</button>
            </form>
            <div class="note">All fields are mandatory except Phone Number.</div>
            <div class="account-option">
            
            <a href="admin-dashboard.jsp">Back to Dashboard</a> <!-- Added link below sign in -->
            
        </div>
        
    </div>
</body>
</html>
