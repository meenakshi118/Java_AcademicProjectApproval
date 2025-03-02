package com.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.project.dao.AdminDAO;
import com.project.db.DBConnection;

@WebServlet("/RemoveStudentServlet")
public class RemoveStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rollNo = request.getParameter("rollNo");

        AdminDAO studentDao = new AdminDAO(DBConnection.getConnection());
      
     // Call removeIncharge method
        boolean isRemoved =studentDao.removeStudent(rollNo);

        // Redirect to success or error page based on result
        if (isRemoved) {
        	 response.sendRedirect("RemoveStudent.jsp");  // Redirect to success page
        } else {
            response.sendRedirect("NotRemoved.jsp");  // Redirect to error page
        }
      
    }
}
