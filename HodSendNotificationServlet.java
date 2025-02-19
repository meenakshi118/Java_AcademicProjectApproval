package com.project.servlet;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.text.*;
import com.project.dao.HODDao;
import com.project.dao.StudentDao;
import com.project.db.DBConnection;
import com.project.model.HodNotification;
import java.util.List;
import jakarta.servlet.annotation.WebServlet;

import java.util.Date;


public class HodSendNotificationServlet extends HttpServlet {
	 private static final long serialVersionUID = 1L;
	 
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message = request.getParameter("message");
        String reminderDateStr = request.getParameter("reminderDate");
        HODDao hodDao = new HODDao(DBConnection.getConnection());

        // Convert the date string (DD-MM-YYYY) to java.util.Date object
        java.util.Date reminderDateUtil = null;
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        try {
            reminderDateUtil = dateFormat.parse(reminderDateStr);
        } catch (ParseException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid date format. Please use DD-MM-YYYY.");
            return;
        }

        // Convert java.util.Date to java.sql.Date
        java.sql.Date reminderDateSql = new java.sql.Date(reminderDateUtil.getTime());

        // Call the sendNotification method with java.sql.Date
        boolean success = hodDao.sendNotification(message, reminderDateSql);

        // Redirect to a success/failure page based on the outcome
        if (success) {
            response.sendRedirect("HOD-dashboard.jsp"); // Redirect to success page
            
        } else {
            response.sendRedirect("HOD-dashboard.jsp"); // Redirect to failure page
        }
    }
	
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StudentDao studentDao = new StudentDao(DBConnection.getConnection());
        List<HodNotification> notifications = studentDao.getNotifications();

        // Set the notifications in request scope to be accessed by the JSP
        request.setAttribute("notifications", notifications);

        // Forward the request to the JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("Student-dashboard.jsp");
        dispatcher.forward(request, response);
    }
}