package com.project.servlet;

import com.project.dao.AdminDAO;
import com.project.db.DBConnection;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class ChangeEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 System.out.println("AdminChangeEmailServlet doPost triggered");
        String currentEmail = request.getParameter("current-email");
        String newEmail = request.getParameter("new-email");

        try {
            AdminDAO adminDAO = new AdminDAO(DBConnection.getConnection());
            boolean isUpdated = adminDAO.updateEmail(currentEmail, newEmail);
            if (isUpdated) {
            	 
                response.sendRedirect("admin-dashboard.jsp?message=Email changed successfully!");
            } else {
            	
                response.sendRedirect("admin-dashboard.jsp?error=Unable to change email. Please try again.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin-dashboard.jsp?error=An error occurred.");
        }
    }
}
