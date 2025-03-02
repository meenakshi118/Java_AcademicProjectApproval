package com.project.servlet;
import com.project.dao.AdminDAO;
import com.project.db.DBConnection;

import jakarta.servlet.ServletException; // Import HttpSession
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; // Declare serialVersionUID
  

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 System.out.println("AdminLoginServlet doPost triggered");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AdminDAO adminDao = new AdminDAO(DBConnection.getConnection());

        boolean isAuthenticated = adminDao.authenticate(email, password);

        if (isAuthenticated) {
            HttpSession session = request.getSession(); // Correct session creation
            session.setAttribute("email", email);
            // Redirect to admin dashboard or home page on successful login
            response.sendRedirect("admin-dashboard.jsp");
        } else {
            // Redirect to login page with error message on failure
            response.sendRedirect("NotFound.jsp");
        }
    }
}
