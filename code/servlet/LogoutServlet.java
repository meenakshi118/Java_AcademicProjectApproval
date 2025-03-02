package com.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;


public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the current session, if it exists
        HttpSession Ssession = request.getSession(false);

        // Check if the session exists and is not already invalidated
        if (Ssession != null) {
            try {
                if (!Ssession.isNew()) { // Ensure the session is valid and not newly created
                    Ssession.invalidate(); // Invalidate the session
                }
            } catch (IllegalStateException e) {
                // If the session is already invalidated, log a message (optional)
                System.err.println("Session was already invalidated: " + e.getMessage());
            }
        }

        // Redirect the user to the index.jsp or login page
        response.sendRedirect("index.jsp");
    }
}
