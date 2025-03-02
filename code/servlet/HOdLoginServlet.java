package com.project.servlet;
import com.project.dao.HODDao;

import com.project.db.DBConnection;

import jakarta.servlet.ServletException; // Import HttpSession
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/HOdLoginServlet")
public class HOdLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 System.out.println("HODLoginServlet doPost triggered");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Debugging the input values
        System.out.println("Received Email: " + email);
        System.out.println("Received Password: " + password);

        HODDao h = new HODDao(DBConnection.getConnection());

        boolean isAuthenticated = h.authenticate(email, password);

        if (isAuthenticated) {
        	 // Retrieve the course of the logged-in HOD
            String hodCourse = h.getCourseByEmail(email);  // Fetch HOD course

            if (hodCourse != null) {
                // Store the course in session
                HttpSession session = request.getSession();
                session.setAttribute("hodCourse", hodCourse);

            // Redirect to admin dashboard or home page on successful login
            response.sendRedirect("HOD-dashboard.jsp");
        } else {
        	
            // Redirect to login page with error message on failure
            response.sendRedirect("NotFound.jsp");
        }
    }
}
}

