package com.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import com.project.dao.AdminDAO;
import com.project.db.DBConnection;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/RemoveHodServlet")
public class RemoveHodServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data (name or email of HOD to remove)
        String name = request.getParameter("name");
        String email = request.getParameter("email");

       
        AdminDAO adminDAO = new AdminDAO(DBConnection.getConnection());
        boolean isRemoved = adminDAO.removeHod(name, email);

        if (isRemoved) {
            response.sendRedirect("RemoveHod.jsp");  // Redirect to success page
        } else {
            response.sendRedirect("NotRemoved.jsp");  // Redirect to error page
        }
    }
}
