<%@ page import="java.util.List" %>
<%@ page import="com.project.dao.StudentDao" %>
<%@ page import="com.project.db.DBConnection" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.project.model.StudentInfo" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Students</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #1abc9c;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <%
    
  
        StudentDao sDao = new StudentDao(DBConnection.getConnection());
        List<StudentInfo> students = sDao.getStudentDetails();
%>
<h1>Students </h1>
<table>
    <thead>
        <tr>
            <th>Roll No.</th>
            <th>Name</th>
            <th>Department</th>
            <th>Course</th>
            <th>Semester</th>
            <th>Email</th>
             <th>Phone No.</th>
        </tr>
    </thead>
    <tbody>
        <% if (students != null && !students.isEmpty()) { 
            for (StudentInfo s : students) { %>
        <tr>
            <td><%= s.getRollNo() %></td>
            <td><%= s.getName() %></td>
            <td><%= s.getDepartment() %></td>
            <td><%= s.getCourse() %></td>
            <td><%= s.getSemester() %></td>
            <td><%= s.getEmail() %></td>
            
        </tr>
        <% } } else { %>
        <tr>
            <td colspan="3" style="text-align: center;">No student found</td>
        </tr>
        <% } %>
    </tbody>
</table>


</body>
</html>
