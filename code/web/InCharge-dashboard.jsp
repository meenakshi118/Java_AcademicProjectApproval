<%@ page import="java.util.*" %>
<%@ page import="com.project.dao.InChargeDao" %>
<%@ page import="com.project.db.DBConnection" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.project.model.Project" %>
<%@ page import="com.project.model.StudentInfo" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HOD Panel</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fc;
            color: #333;
        }

        a {
            text-decoration: none;
            color: #007bff;
        }

        a:hover {
            text-decoration: underline;
        }

        h1, h2, h3 {
            margin: 0;
            font-weight: 600;
        }

        /* Header */
        .header {
            background-color: #333;
            color: #fff;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 4px solid #007bff;
        }

        .header .logo h1 {
            font-size: 26px;
            font-weight: bold;
        }

        .header nav ul {
            list-style: none;
            display: flex;
            gap: 30px;
            margin: 0;
        }

        .header nav ul li a {
            font-size: 16px;
            color: #fff;
            font-weight: 500;
        }

        .header nav ul li a:hover {
            color: #ff6600;
        }

        /* Panels */
        .panel {
            background: white;
            margin: 20px auto;
            padding: 20px;
            max-width: 1000px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            border: 1px solid #f0f0f0;
        }

		.panel:hover {
            transform: scale(1.02);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .panel h2 {
            margin-bottom: 20px;
            color: #444;
            font-size: 24px;
        }

        /* Tables */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table th, table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #f0f0f0;
        }

        table th {
            background-color: #f8f8f8;
            color: #555;
        }

        table td {
            color: #555;
        }

        /* Buttons */
        button.btn {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button.btn:hover {
            background-color: #0056b3;
        }

        button.approve {
            background-color: #28a745;
            border-color: #28a745;
        }

        button.approve:hover {
            background-color: #218838;
        }

        button.reject {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        button.reject:hover {
            background-color: #c82333;
        }

        /* Forms */
        form label {
            display: block;
            margin: 15px 0 5px;
            font-size: 16px;
            color: #444;
        }

        form input, form select, form button, textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: 1px solid #ddd;
            font-size: 16px;
            color: #555;
        }

        form button {
            background-color: #007bff;
            color: white;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
        }

        form button:hover {
            background-color: #0056b3;
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

        /* Footer */
        .footer {
            background-color: #333;
            color: #bbb;
            text-align: center;
            padding: 15px;
            border-top: 4px solid #007bff;
            margin-top: 30px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                text-align: center;
            }

            .header nav ul {
                flex-direction: column;
                gap: 15px;
            }

            .panel {
                padding: 15px;
                margin: 10px;
            }
        }
    </style>
</head>
<body>
    <header class="header">
        
            <h1>Incharge Panel</h1>
        
        <nav>
            <ul>
               
                <li><a href="#approval-workflow">Project Approval</a></li>
                <li><a href="#document-management">Document Management</a></li>
              	 <li><a href="#assigned-students">Students Assigned</a></li>
              	 <li><a href="#chexkStudent">Student Status</a></li>
              	 <li><a href="Logout">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
    
    
    <%
    HttpSession isession = request.getSession();
    Integer id= (Integer) isession.getAttribute("id"); // Get HOD's course from session
%>



<% 
    if (id != null && id != 0) { 
    	
        InChargeDao iDao = new InChargeDao(DBConnection.getConnection());
        List<Project> projects = iDao.getProjectsPendingApproval(id);
        
     // Debugging: Print session ID and project details
       
       
%>
    
    
        <!-- Approval Workflow Section -->
        <section id="approval-workflow" class="panel">
        <form action="ApprovalServlet" method="POST">
            <h2>Student Report Review & Action</h2>
            <table>
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
<%  
   } else {
       System.out.println("No session found or invalid session ID.");
   }
%>      
 

        





 <!-- students under incharge -->


	<%

    if (id != null && id != 0) { 
    	
        InChargeDao iDao = new InChargeDao(DBConnection.getConnection());
        
        List<StudentInfo> assignedStudents = iDao.getStudentsByInCharge(id);
        

%>
<section id="assigned-students" class="panel">
    <h3>Students Under Supervision</h3>

    <% if (assignedStudents != null && !assignedStudents.isEmpty()) { %>
    <table>
        <thead>
            <tr>
                <th style="padding: 10px; border: 1px solid #ddd;">Roll No.</th>
                <th style="padding: 10px; border: 1px solid #ddd;">Name</th>
                <th style="padding: 10px; border: 1px solid #ddd;">Email</th>
                <th style="padding: 10px; border: 1px solid #ddd;">Course</th>
                <th style="padding: 10px; border: 1px solid #ddd;">Semester</th>
            </tr>
        </thead>
        <tbody>
            <% for (StudentInfo student : assignedStudents) { %>
            <tr>
                <td style="padding: 10px; border: 1px solid #ddd;"><%= student.getRollNo() %></td>
                <td style="padding: 10px; border: 1px solid #ddd;"><%= student.getName() %></td>
                <td style="padding: 10px; border: 1px solid #ddd;"><%= student.getEmail() %></td>
                <td style="padding: 10px; border: 1px solid #ddd;"><%= student.getCourse() %></td>
                <td style="padding: 10px; border: 1px solid #ddd;"><%= student.getSemester() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <% } else { %>
    <p>No students assigned yet.</p>
    <% } %>
</section>
<%
    } else {
%>
<p style="color: red; text-align: center;">Invalid session or user not authorized.</p>
<%
    }
%>




         <!-- see student status  -->
        <% 
    if (id != null && id != 0) { 
    	
        InChargeDao iDao = new InChargeDao(DBConnection.getConnection());
        List<Project> projects = iDao.getProjects(id);
        
     
%>
         
        <section id="chexkStudent" class="panel">
            <h2>Supervised Project Progress </h2>
            <table>
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
                    if (projects != null && !projects.isEmpty()) {
                        for (Project project : projects) {
                  %>
                    <tr style="background-color: #fff; border-bottom: 1px solid #ddd;">
                        <td style="padding: 10px; border: 1px solid #ddd;"><%= project.getRollNo() %></td>
                        <td style="padding: 10px; border: 1px solid #ddd;"><%= project.getStudentName() %></td>
                        <td style="padding: 10px; border: 1px solid #ddd;"><%= project.getProjectTitle() %></td>
                        <td style="padding: 10px; border: 1px solid #ddd;">
                            <a href="<%= project.getDocumentPath() %>" target="_blank" style="color: #007bff; text-decoration: none;">View Document</a>
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
            
        </section>
<%  
   } else {
       System.out.println("No session found or invalid session ID.");
   }
%>       
    </main>

    <footer class="footer">
        <p>© 2024 Incharge Panel</p>
    </footer>
</body>
</html>
