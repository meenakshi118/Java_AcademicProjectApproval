<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #212529;
        }
        .header {
            background: linear-gradient(45deg, #ff6f61, #ff9472);
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            letter-spacing: 1px;
        }
        .sidebar {
            width: 260px;
            background: #343a40;
            color: white;
            position: fixed;
            height: 100%;
            padding: 30px 15px;
              top: 0;
            left: 0;
            padding-top: 30px;
            box-shadow: 3px 0 6px rgba(0, 0, 0, 0.2);
             justify-content: center;

        }
        .sidebar a {
            display: block;
            color: #ffffff;
            text-decoration: none;
            padding: 15px;
            margin: 12px 0;
            border-radius: 6px;
            font-size: 16px;
            text-align: center;
            background: #495057;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        .sidebar a:hover {
            background-color: #6c757d;
            transform: translateY(-2px);
        }
        .content {
            margin-left: 280px;
            padding: 40px;
            font-size: 18px;
        }
        .card {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            transition: box-shadow 0.3s ease;
        }
        .card:hover {
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            transform: scale(1.02);
        }
        }
         .card h2 {
            margin: 0 0 20px;
            color: #f08c42; /* Vibrant orange for headings */
            font-size: 24px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .btn {
            display: inline-block;
            padding: 12px 25px;
            color: white;
            background-color: #ff6f61;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
            font-size: 16px;
        }
        .btn:hover {
            background-color: #e95b50;
            transform: scale(1.05);
        }
        .notification {
            padding: 20px;
            background-color: #fff3cd;
            border-left: 6px solid #ffa000;
            border-radius: 8px;
            margin-bottom: 20px;
            color: #856404;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="header">Admin Panel</div>

    <div class="sidebar">
        <a href="#dashboard">Dashboard</a>
        <a href="#change-password">Change Password</a>
        <a href="#change-email">Change Email</a>
        <a href="#manage-students">Manage Students</a>
        <a href="#manage-hods">Manage HODs</a>
        <a href="#manage-incharge">Manage Project Incharges</a>
        <li><a href="Logout">Logout</a></li>
    </div>


    
    <div class="content" id="dashboard">
        <div class="card">
            <h2>Welcome Admin</h2>
            
            <p>Welcome to the Admin Panel, where you can seamlessly manage the platform's administrative functions. With the tools at your disposal, you can ensure smooth operations, increase efficiency, and maintain control over key tasks.</p>
        
        <p>As an Admin, you have access to the following features:</p>
            <p>Manage users, view reports, and handle administrative tasks efficiently.</p>
        </div>
    </div>

    <div class="content" id="change-password">
        <div class="card">
            <h2>Change Your Password</h2>
            <form action="ChangePassword" method="post">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email"  name="email" placeholder="Enter your email">
                </div>
                <div class="form-group">
                    <label for="current-password">Current Password</label>
                    <input type="password" id="current-password"  name="current-password" placeholder="Enter current password">
                </div>
                <div class="form-group">
                    <label for="new-password">New Password</label>
                    <input type="password" id="new-password" name="new-password" placeholder="Enter new password">
                </div>
                <button type="submit" class="btn">Change Password</button>
            </form>
        </div>
    </div>

    <div class="content" id="change-email">
        <div class="card">
        <h2>Change Your Email</h2>
            <form action="ChangeEmail" method="post">
                 <div class="form-group">
                    <label for="current-email">Current Email</label>
                    <input type="email" id="current-email"  name="current-email" placeholder="Enter current email">
                </div>
                <div class="form-group">
                    <label for="new-email">New Email</label>
                    <input type="email" id="new-email"  name="new-email" placeholder="Enter new email">
                </div>
                <button type="submit" class="btn">Change Email</button>
            </form>
        </div>
    </div>

    <div class="content" id="manage-students">
    <div class="card">
        <h2>Manage Students</h2>
        <button class="btn" onclick="window.location.href='AddStudent.jsp'">Add Student</button>
        <button class="btn" onclick="window.location.href='RemoveStudent.jsp'">Remove Student</button>
          <p>
        <a href="ViewStudent.jsp" style="color: #1abc9c; text-decoration: underline; font-size: 14px;">
            View Students
        </a>
    </p>
    </div>
</div>
    <div class="content" id="manage-hods">
        <div class="card">
            <h2>Manage HODs</h2>
            <button class="btn" onclick="window.location.href='AddHod.jsp'">Add HOD</button>
            <button class="btn" onclick="window.location.href='RemoveHod.jsp'">Remove HOD</button>
              <p>
        <a href="ViewHod.jsp" style="color: #1abc9c; text-decoration: underline; font-size: 14px;">
            View HOD
        </a>
    </p>
        </div>
    </div>

    <div class="content" id="manage-incharge">
        <div class="card">
            <h2>Manage Project Incharges</h2>
            <button class="btn"onclick="window.location.href='AddIncharge.jsp'">Add Incharge</button>
            <button class="btn" onclick="window.location.href='RemoveIncharge.jsp'">Remove Incharge</button>
              <p>
        <a href="ViewIncharge.jsp" style="color: #1abc9c; text-decoration: underline; font-size: 14px;">
            View Incharge
        </a>
    </p>
        </div>
    </div>

   

</body>
</html>