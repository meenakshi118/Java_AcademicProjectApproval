<%@ page import="java.util.List" %>
<%@ page import="com.project.dao.InChargeDao" %>
<%@ page import="com.project.db.DBConnection" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.project.model.InchargeInfo" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Incharges </title>
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
   
   
        InChargeDao iDao = new InChargeDao(DBConnection.getConnection());
        List<InchargeInfo> incharges = iDao.getInchargeDetails();
%>
<h1> In-Charge</h1>
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Department</th>
            <th>Email</th>
             <th>Phone No.</th>
        </tr>
    </thead>
    <tbody>
        <% if (incharges != null && !incharges.isEmpty()) { 
            for (InchargeInfo hod : incharges) { %>
        <tr>
            <td><%= hod.getName() %></td>
            <td><%= hod.getDepartment() %></td>
            <td><%= hod.getGmail() %></td>
            <td><%= hod.getPhoneNumber() %></td>
        </tr>
        <% } } else { %>
        <tr>
            <td colspan="3" style="text-align: center;">No hod found</td>
        </tr>
        <% } %>
    </tbody>
</table>


</body>
</html>
