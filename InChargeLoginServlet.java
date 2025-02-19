package com.project.servlet;

import com.project.dao.InChargeDao;
import com.project.db.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/InChargeLoginServlet")
public class InChargeLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	 System.out.println("InchargeLoginServlet doPost triggered");
        String email = request.getParameter("email"); // Retrieve email
        String password = request.getParameter("password"); // Retrieve password
        InChargeDao inChargeDao = new InChargeDao(DBConnection.getConnection());
        boolean isAuthenticated = inChargeDao.authenticate(email, password);

        if (isAuthenticated) {
            int id = inChargeDao.getInChargeIdByEmail(email);
            HttpSession session = request.getSession();
            session.setAttribute("id", id);
            response.sendRedirect("InCharge-dashboard.jsp");
        } else {
            response.sendRedirect("NotFound.jsp");
        }
    }
}
