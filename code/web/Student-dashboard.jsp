<%@ page import="com.project.dao.StudentDao,com.project.model.StudentInfo,com.project.model.InchargeInfo,com.project.model.HodNotification,com.project.model.Project,com.project.db.DBConnection" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Panel</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

         /* Header */
        .header {
            background: linear-gradient(90deg, #34495e, #2c3e50);
            color: white;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 4px solid #1abc9c;
        }

       .header h1 {
            margin: 0;
            font-size: 24px;
            font-weight: bold;
        }

        .header nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
            margin: 0;
        }

        .header nav ul li a {
            font-size: 16px;
            color: white;
            font-weight: 500;
        }

        .header nav ul li a:hover {
            color: #1abc9c;
        }

        

        .container {
            padding: 40px;
            max-width: 1200px;
            margin: auto;
        }

        h1 {
            font-size: 28px;
           color: #ffffff;
            margin-bottom: 15px;
            text-align: center;
        }


        .card {
            background: #fff;
            padding: 25px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
        }

        .card:hover {
            transform: scale(1.02);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .card h2 {
            margin-top: 0;
            font-size: 24px;
            color: #2C3E50;
        }

        .status-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #34495E;
            color: #fff;
            padding: 15px 25px;
            border-radius: 8px;
            margin-bottom: 30px;
        }

        .status-bar span {
            font-weight: 600;
        }

        .btn {
            display: inline-block;
            padding: 12px 20px;
            background-color: #e67e22;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            text-align: center;
            font-size: 16px;
            transition: 0.3s;
        }

        .btn:hover {
            background-color: #d35400;
        }

        .upload-section input {
            display: block;
            margin: 15px 0;
            padding: 12px;
            width: 100%;
            border: 2px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
        }

        .notification {
            background-color: #fff3cd;
            color: #856404;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 25px;
            font-weight: 600;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .feedback {
            margin-top: 25px;
            padding: 20px;
            background: #f9d6d6;
            border: 2px solid #f2a1a1;
            border-radius: 8px;
            color: #c0392b;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        table th, table td {
            padding: 12px;
            text-align: left;
            border-bottom: 2px solid #ddd;
        }

        table th {
            background-color: #2C3E50;
            color: #fff;
        }

        table tr:hover {
            background-color: #f4f4f4;
        }

					/* Styling for the Incharge Info card */
.card h2 {
    color: #444;
    margin-bottom: 15px;
}

.card p {
    color: #555;
    font-size: 16px;
    margin: 5px 0;
}

.card p strong {
    color: #333;
}

/* Adding a subtle hover effect on the card */
.card:hover {
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    transition: 0.3s ease;
}
					
    </style>
</head>
<body>
    <header class="header">
        <h1>Student Panel</h1>
        <nav>
            <ul>
                <li><a href="#profile">Profile</a></li>
                <li><a href="#incharge">Incharge</a></li>
                <li><a href="#project">Project</a></li>
                <li><a href="#upload">Upload</a></li>
                <li><a href="#notification">Notification</a></li>
                <li><a href="#feedback">Feedback</a></li>
                <li><a href="Logout">Logout</a></li>
            </ul>
        </nav>
    </header>
    
    
    
    <%
    // Retrieve the session and roll number
    HttpSession Ssession = request.getSession();
    String rollNo = (String) Ssession.getAttribute("rollNo");

    if (rollNo == null) {
        response.sendRedirect("StudentLogin.jsp"); // Redirect to login if session is null
        return;
    }

    // Initialize DAO to fetch details
    StudentDao studentDao = new StudentDao(DBConnection.getConnection());
    StudentInfo studentDetails = studentDao.getStudentDetails(rollNo);
    List<Project> projectDetails = studentDao.getAllProjects(rollNo);
    InchargeInfo inchargeInfo = studentDao.getInchargeDetails(rollNo);
    request.setAttribute("incharge", inchargeInfo);
    request.setAttribute("projects", projectDetails);
    %>   

    <div class="container">
        

        <!-- Profile Section -->
        <div section id="profile"class="card">
            <h2>Profile</h2>
            <p><strong>Name:</strong> <%= studentDetails.getName() %></p>
            <p><strong>Roll No:</strong> <%= studentDetails.getRollNo() %></p>
            <p><strong>Email:</strong> <%= studentDetails.getEmail() %></p>
            <p><strong>Course:</strong> <%= studentDetails.getCourse() %></p>
            <p><strong>Department:</strong> <%= studentDetails.getDepartment() %></p>
            <p><strong>Semester:</strong> <%= studentDetails.getSemester() %></p>
        </div>
        
       

<!-- Current Incharge Section -->
<div section id="incharge" class="card">
    <h2>Current Incharge</h2>
    <% 
        if (inchargeInfo != null) {
    %>
        <p><strong>Name:</strong> <%= inchargeInfo.getName() %></p>
        <p><strong>Email:</strong> <%= inchargeInfo.getGmail() %></p>
        <p><strong>Phone Number:</strong> <%= inchargeInfo.getPhoneNumber() %></p>
       <% } else { %>
                <p>No Incharge details found.</p>
            <% } %>
    
</div>
        
        
        
        
        <!-- Project Status Section -->
        <div section id="project" class="card">
            <h2>Project Details</h2>
            <% 
                // Retrieve the projects list from the request attributes
                List<Project> projectList = (List<Project>) request.getAttribute("projects");
                if (projectList != null && !projectList.isEmpty()) { 
            %>
                <table>
                    <thead>
                        <tr>
                            <th>Project Title</th>
                            <th>Status</th>
                            <th>Incharge Name</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            for (Project project : projectList) {
                        %>
                            <tr>
                                <td><%= project.getProjectTitle() %></td>
                                <td><%= project.getStatus() %></td>
                                <td><%= project.getInchargeName() %></td>
                                <td><%= project.getDate() %></td>
                            </tr>
                        <% 
                            }
                        %>
                    </tbody>
                </table>
            <% } else { %>
                <p>No project details found.</p>
            <% } %>
        </div>

        <!-- Document Upload Section -->
        <div section id="upload" class="card upload-section">
            <h2>Upload Documents</h2>
            <form action="UploadServlet" method="post" enctype="multipart/form-data">
                <label for="docTitle">Document Title:</label>
                <input type="text" id="docTitle" name="docTitle" placeholder="Enter document title" required />

                <label for="document">Select File:</label>
                <input type="file" id="document" name="document" placeholder="Enter the Title" required />

                <button type="submit" class="btn">Upload</button>
            </form>
        </div>

        <!-- Notifications Section -->
		<div id="notification" class="notification">
   		  <% 
        List<HodNotification> notificationDetails = studentDao.getNotifications();
        if (notificationDetails != null && !notificationDetails.isEmpty()) {
            for (HodNotification notification : notificationDetails) {
    %>
                <div>
                    <p><%= notification.getMessage() %></p>
                </div>
                <hr>
    <% 
            }
        } else { 
    %>
        <p>No reminders available.</p>
    <% 
        } 
    %>
</div>
        <!-- Feedback Section -->
        <div section id="fee" class="card feedback">
        <h2>Projects with Feedback</h2>
        <% 
           
            if (projectList != null && !projectList.isEmpty()) {
                for (Project project : projectList) {
                	// Check if the project has feedback
                    if (project.getFeedback() != null) {
        %>
            <div class="project-details">
                <p><strong>Project Title:</strong> <%= project.getProjectTitle() %></p>
                <p><strong>Feedback:</strong> <%= project.getFeedback() %></p>
                <p><strong>Project Date:</strong> <%= project.getDate() %></p>
            </div>
            <hr>
        <% 
                    } }
            } else {
        %>
            <p>No projects with feedback available.</p>
        <% 
            }
        %>
    </div>
       
    </div>
</body>
</html>
