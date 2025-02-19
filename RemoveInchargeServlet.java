package com.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import com.project.dao.AdminDAO;
import com.project.db.DBConnection;

import java.io.IOException;

@WebServlet("/RemoveInchargeServlet")
public class RemoveInchargeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String name = request.getParameter("name");
        String email = request.getParameter("gmail");

        // Make sure DBConnection is properly initialized and connected
        AdminDAO adminDAO = new AdminDAO(DBConnection.getConnection());

        // Call removeIncharge method
        boolean isRemoved = adminDAO.removeIncharge(name, email);

        // Redirect to success or error page based on result
        if (isRemoved) {
            response.sendRedirect("RemoveIncharge.jsp");  // Redirect to success page
        } else {
            response.sendRedirect("NotRemoved.jsp");  // Redirect to error page
        }
    }
}
