<%@ page import="java.util.List" %>
<%@ page import="com.project.dao.HODDao" %>
<%@ page import="com.project.db.DBConnection" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.project.model.Project" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HOD Panel</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9fafb;
            color: #2c3e50;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        h1, h2, h3 {
            margin: 0;
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

        

        .header .logo h1 {
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

        /* Panels */
        .panel {
            background: white;
            margin: 20px auto;
            padding: 20px;
            max-width: 900px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border: 1px solid #dcdcdc;
        }

		 .panel:hover {
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.4);
            transform: scale(1.02);
        }
        .panel h2 {
            margin-bottom: 20px;
            color: #1abc9c;
            font-size: 20px;
            font-weight: 600;
        }
		 /* Feedback Section */
.feedback-section {
    margin-top: 20px;
    background-color: #f9f9f9;
    padding: 20px;
    border-radius: 8px;
    border: 1px solid #ddd;
    max-width: 900px; /* Ensure it matches the other panels */
    margin-left: auto; /* Center the feedback section */
    margin-right: auto; /* Center the feedback section */
}

        .feedback-section textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            resize: vertical;
        }

        .feedback-section button {
            margin-top: 15px;
            background-color: #28a745;
            border: none;
        }
		
        /* Forms */
        form label {
            display: block;
            margin: 10px 0 5px;
            font-size: 14px;
            color: #34495e;
        }

        form input, form select, form button {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #bdc3c7;
            font-size: 14px;
        }

        form button {
            background-color: #1abc9c;
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
        }

        form button:hover {
            background-color: #16a085;
        }

        /* Buttons */
        button.btn {
            background-color: #ecf0f1;
            color: #2c3e50;
            border: 1px solid #bdc3c7;
            padding: 8px 12px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 4px;
        }

        button.btn:hover {
            background-color: #dcdde1;
        }

        button.approve {
            color: white;
            background-color: #1abc9c;
        }

        button.approve:hover {
            background-color: #16a085;
        }

        button.reject {
            color: white;
            background-color: #e74c3c;
        }

        button.reject:hover {
            background-color: #c0392b;
        }

        /* Footer */
        .footer {
            background: #34495e;
            color: white;
            text-align: center;
            padding: 10px 0;
            border-top: 4px solid #1abc9c;
            margin-top: 20px;
            font-size: 14px;
        }

        /* Images and Backgrounds */
        .header .logo img {
            border-radius: 50%;
        }

        .panel img {
            max-width: 100%;
            height: auto;
            margin-bottom: 20px;
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="logo">
            
            <h1>HOD Panel</h1>
        </div>
        <nav>
            <ul>
                <li><a href="#assign-project-incharge">Assign Supervisor</a></li>
                <li><a href="#approval-workflow">Approval Workflow</a></li>
                <li><a href="#checkStudent">Student Status</a></li>
                <li><a href="#notify"> Send Notification</a></li>
                <li><a href="Logout">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <%
            // Get the session and fetch the HOD's course
            HttpSession sessionhod = request.getSession();
            String hodCourse = (String) sessionhod.getAttribute("hodCourse"); // Get HOD's course from session

            if (hodCourse != null) {
                HODDao hodDao = new HODDao(DBConnection.getConnection());

                // Fetch students by the HOD's course
                List<String> students = hodDao.getStudentsByCourse(hodCourse);
                if (students != null && !students.isEmpty()) {
        %>
        <!-- Assign Project In-Charge Section -->
        <section id="assign-project-incharge" class="panel">
            <h2>Assign Project Supervisor</h2>
            <form action="<%= request.getContextPath() %>/AssignProjectInchargeServlet" method="POST">
                <div class="form-group">
                    <label for="studentRollNo">Select Student:</label>
                    <select name="studentRollNo" id="studentRollNo" class="form-control" required>
                        <%
                            for (String student : students) {
                        %>
                        <option value="<%= student %>"><%= student %></option>
                        <%
                            }
                        %>
                    </select>
                </div>
               <div class="form-group">
    <label for="inchargeId">Select Project Incharge:</label>
    <select name="inchargeName" id="inchargeId" class="form-control" required>
        <%
            // Fetch project in-charges from the database
            List<String> incharges = hodDao.getProjectIncharges();
            for (String incharge : incharges) {
        %>
        <option value="<%= incharge %>"><%= incharge %></option>
        <%
            }
        %>
    </select>
</div>

                <button type="submit" class="btn btn-primary">Assign</button>
            </form>
            
            <p>
        <a href="AssignedProjects.jsp" style="color: #1abc9c; text-decoration: underline; font-size: 14px;">
            View Assigned Incharge
        </a>
    </p>
        </section>
        <%
                } else {
        %>
        <p>No students found for this course.</p>
        <%
                }
            } else {
        %>
        <p>Error: HOD course not found. Please log in again.</p>
        <%
            }
        %>


<%-- Get the session and fetch the HOD's course --%>
<%-- Get the session and fetch the HOD's course --%>
<%
   
    String hCourse = (String) sessionhod.getAttribute("hodCourse"); // Get HOD's course from session
%>
<%
    if (hCourse != null) {
        HODDao hodDao = new HODDao(DBConnection.getConnection());
        List<Project> projects = hodDao.getProjectsPendingApproval(hCourse);
%>
        <!-- Approval Workflow Section -->
        <section id="approval-workflow" class="panel">
            <h2>Mentor-Approved Project Review</h2>
            <form action="ApprovalWorkflowServlet" method="POST">
            <table style="width: 100%; border-collapse: collapse; margin-top: 20px;">
                <thead>
                    <tr style="background-color: #f2f2f2; color: #333;">
                        <th style="padding: 10px; border: 1px solid #ddd;">Roll No.</th>
                        <th style="padding: 10px; border: 1px solid #ddd;">Student Name</th>
                        <th style="padding: 10px; border: 1px solid #ddd;">Title</th>
                        <th style="padding: 10px; border: 1px solid #ddd;">Document</th>
                        <th style="padding: 10px; border: 1px solid #ddd;">Current Status</th>
                        <th style="padding: 10px; border: 1px solid #ddd;">Action</th>
                    </tr>
                </thead>
                <tbody>
                  <%-- Dynamically populate data --%>
                  <%
                    if (projects != null && !projects.isEmpty()) {
                        for (Project project : projects) {
                  %>
                    <tr style="background-color: #fff; border-bottom: 1px solid #ddd;">
                        <td style="padding: 10px; border: 1px solid #ddd;"><%= project.getRollNo() %></td>
                        <td style="padding: 10px; border: 1px solid #ddd;"><%= project.getStudentName() %></td>
                        <td style="padding: 10px; border: 1px solid #ddd;"><%= project.getProjectTitle() %></td>
                        <td style="padding: 10px; border: 1px solid #ddd;">
                            <a href="<%= project.getDocumentPath() %>" target="_blank" style="color: #007bff; text-decoration: none;">View Document</a>
                        </td>
                        <td style="padding: 10px; border: 1px solid #ddd;"><%= project.getStatus() %></td>
                        <td style="padding: 10px; border: 1px solid #ddd;">
                          
                            <input type="hidden" name="id" value="<%= project.getprojectId() %>"/>
                                <button class="approve" type="submit" name="action" value="approve">Approve</button>
                                <button class="reject" type="submit" name="action" value="reject">Reject</button>
                            
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="6" style="text-align: center; padding: 20px;">No projects pending approval</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            
              <!-- Rejection Feedback Section -->
<section id="rejection-feedback" class="feedback-section">
    <h2>Provide Feedback on Rejection</h2>

    <!-- Display Error Messages -->
    <% if (request.getParameter("error") != null) { %>
        <% if (request.getParameter("error").equals("FeedbackRequired")) { %>
            <p style="color: red;">Feedback is required for rejection.</p>
        <% } else if (request.getParameter("error").equals("FeedbackSaveError")) { %>
            <p style="color: red;">An error occurred while saving feedback. Please try again.</p>
        <% } %>
    <% } %>

    <!-- Feedback Form -->
    
        <input type="hidden" name="action" value="reject">
        <input type="hidden" name="id" value="<%= request.getParameter("id") %>"> <!-- Pass project ID -->

        <label for="feedback">Feedback for Student</label>
        <textarea id="feedback" name="feedback" placeholder="Provide feedback to the student"></textarea>

        
   
</section>
   
    
            </form>
        </section>
<%  } %>

         
                
        

<%
    if (hCourse != null) {
        HODDao hodDao = new HODDao(DBConnection.getConnection());
        List<Project> project1 = hodDao.getProjects(hCourse);
%>
        <!-- Approval Workflow Section -->
        <section id="checkStudent" class="panel">
            <h2>Status Tracking </h2>
            <form action="ApprovalWorkflowServlet" method="POST">
            <table style="width: 100%; border-collapse: collapse; margin-top: 20px;">
                <thead>
                    <tr style="background-color: #f2f2f2; color: #333;">
                        <th style="padding: 10px; border: 1px solid #ddd;">Roll No.</th>
                        <th style="padding: 10px; border: 1px solid #ddd;">Student Name</th>
                        <th style="padding: 10px; border: 1px solid #ddd;">Title</th>
                        <th style="padding: 10px; border: 1px solid #ddd;">Document</th>
                        <th style="padding: 10px; border: 1px solid #ddd;">Current Status</th>
                     
                    </tr>
                </thead>
                <tbody>
                  <%-- Dynamically populate data --%>
                  <%
                    if (project1 != null && !project1.isEmpty()) {
                        for (Project project : project1) {
                  %>
                    <tr style="background-color: #fff; border-bottom: 1px solid #ddd;">
                        <td style="padding: 10px; border: 1px solid #ddd;"><%= project.getRollNo() %></td>
                        <td style="padding: 10px; border: 1px solid #ddd;"><%= project.getStudentName() %></td>
                        <td style="padding: 10px; border: 1px solid #ddd;"><%= project.getProjectTitle() %></td>
                        <td style="padding: 10px; border: 1px solid #ddd;">
                            <a href="<%= project.getDocumentPath() %>" target="_blank" style="color: #007bff; text-decoration: none;">View Document</a>
                        </td>
                        <td style="padding: 10px; border: 1px solid #ddd;"><%= project.getStatus() %></td>
                        
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="6" style="text-align: center; padding: 20px;">No projects pending approval</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            </form>
        </section>
<%  } %>

	<div section id="notify" class="panel">
        <h2>Notification Issuance</h2>

        <form action="SendNotificationServlet" method="POST">
            <label for="message">Message:</label>
           <textarea id="message" name="message" rows="3" cols="120" required placeholder="Please enter the notification message that will be sent to all students under your department."></textarea>

            
            <label for="reminderDate">Reminder Date (DD-MM-YYYY):</label>
            <input type="text" id="reminderDate" name="reminderDate" required placeholder="Enter the date (DD-MM-YYYY)">
            
            <button type="submit">Send Notification</button>
        </form>

        
    </div>

    <footer class="footer">
        <p>&copy; 2024 HOD Panel | All Rights Reserved</p>
    </footer>
   
</body>
</html>
