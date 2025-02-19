package com.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import com.project.dao.AdminDAO;
import com.project.db.DBConnection;
import com.project.model.InchargeInfo;

import java.io.IOException;

@WebServlet("/AddInchargeServlet")
public class AddInchargeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String gmail = request.getParameter("gmail");
        String password = request.getParameter("password");
        String department = request.getParameter("department");
        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("phoneNumber");

        // Create ProjectInchargeInfo object and set its properties
        InchargeInfo incharge = new InchargeInfo();
        incharge.setName(name);
        incharge.setGmail(gmail);
        incharge.setDepartment(department);
        incharge.setPhoneNumber(phoneNumber);
        incharge.setPassword(password);

        // Initialize AdminDAO and add the incharge
        AdminDAO admin = new AdminDAO(DBConnection.getConnection());
        
        // Check if the project is already assigned to someone
        if (!admin.isInchargeExists(gmail)) {
            admin.addIncharge(incharge);
            response.sendRedirect("RegisterSuccess.jsp"); // Redirect to a success page
        } else {
        	request.setAttribute("errorMessage", " Gmail already registerd");
            response.sendRedirect("AlreadyExist.jsp"); // Redirect to a failure page
        }
    }
}
