package com.project.servlet;

import com.project.dao.AdminDAO;
import com.project.db.DBConnection;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 System.out.println("AdminChangePasswordServlet doPost triggered");
        String email = request.getParameter("email");
        String currentPassword = request.getParameter("current-password");
        String newPassword = request.getParameter("new-password");
       
        try {
            AdminDAO adminDAO = new AdminDAO(DBConnection.getConnection());
            if (adminDAO.authenticate(email, currentPassword)) {
            	
                boolean isUpdated = adminDAO.updatePassword(email,newPassword);
                if (isUpdated) {
                    response.sendRedirect("admin-dashboard.jsp?message=Password changed successfully!");
                   
                } else {
                    response.sendRedirect("admin-dashboard.jsp?error=Unable to change password. Please try again.");
                   
                }
            } else {
                response.sendRedirect("admin-dashboard.jsp?error=Incorrect current password or gmail.");
               
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("change-password.jsp?error=An error occurred.");
        }
    }
}
