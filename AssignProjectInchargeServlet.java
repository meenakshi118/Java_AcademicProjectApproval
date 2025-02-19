package com.project.servlet;

import com.project.dao.HODDao;
import com.project.db.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/AssignProjectInchargeServlet")
public class AssignProjectInchargeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 System.out.println("HOD ASsignStudentToIncharge servlet doPost triggered");
    	String studentRollNo = request.getParameter("studentRollNo");
        String inchargeName = request.getParameter("inchargeName");

        HODDao hodDao = new HODDao(DBConnection.getConnection());

        // Assuming there is a method to assign the incharge in the database
        boolean isAssigned = hodDao.assignProjectIncharge(studentRollNo, inchargeName); 

       
        if (isAssigned) {
        	
            response.sendRedirect("HOD-dashboard.jsp");  // Redirect back to HOD Panel after assignment
        } else {
       	
            response.sendRedirect("error.jsp");  // Redirect to error page if assignment fails
        }
    }}