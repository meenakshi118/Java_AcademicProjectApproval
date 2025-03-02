<%@ page import="java.util.List" %>
<%@ page import="com.project.dao.HODDao" %>
<%@ page import="com.project.db.DBConnection" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.project.model.StudentInfo" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assigned Projects</title>
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
    // Get the session and fetch the HOD's course
    HttpSession sessionhod = request.getSession();
    String hodCourse = (String) sessionhod.getAttribute("hodCourse"); // Get HOD's course from session

    if (hodCourse != null) {
        HODDao hodDao = new HODDao(DBConnection.getConnection());
        List<StudentInfo> students = hodDao.getStudentsWithInchargeByCourse(hodCourse);
%>
<h1>Students and Assigned In-Charge</h1>
<table>
    <thead>
        <tr>
            <th>Roll Number</th>
            <th>Student Name</th>
            <th>In-Charge Name</th>
        </tr>
    </thead>
    <tbody>
        <% if (students != null && !students.isEmpty()) { 
            for (StudentInfo student : students) { %>
        <tr>
            <td><%= student.getRollNo() %></td>
            <td><%= student.getName() %></td>
            <td><%= student.getInchargeName() != null ? student.getInchargeName() : "Not Assigned" %></td>
        </tr>
        <% } } else { %>
        <tr>
            <td colspan="3" style="text-align: center;">No students found</td>
        </tr>
        <% } %>
    </tbody>
</table>
<% } %>

</body>
</html>
