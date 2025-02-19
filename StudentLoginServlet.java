package com.project.servlet;

import com.project.dao.StudentDao;
import com.project.model.HodNotification;
import com.project.db.DBConnection;
import com.project.model.StudentInfo;
import java.util.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/StudentLoginServlet") // Ensure this matches your HTML form action
public class StudentLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentDao studentDao;

    @Override
    public void init() throws ServletException {
    
        System.out.println("StudentLoginServlet initialized");
        studentDao = new StudentDao(DBConnection.getConnection());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("StudentLoginServlet doPost triggered");
        String action = request.getParameter("action");

        if ("signIn".equals(action)) {
            handleSignIn(request, response);
        } else if ("signUp".equals(action)) {
            handleSignUp(request, response);
        }
    }

    private void handleSignIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rollNo = request.getParameter("rollNo");
        String password = request.getParameter("password");

       
        if (studentDao.authenticateStudent(rollNo, password)) {
        	 if (rollNo != null) {
                 // Store the course in session
                 HttpSession session = request.getSession();
                 session.setAttribute("rollNo", rollNo);

             // Redirect to admin dashboard or home page on successful login
             response.sendRedirect("Student-dashboard.jsp");
         } else {
         	
             // Redirect to login page with error message on failure
             response.sendRedirect("NotFound.jsp");
         }
    }}

    private void handleSignUp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rollNo = request.getParameter("rollNo");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");
        String department = request.getParameter("department");
        String semester = request.getParameter("semester");
        String password = request.getParameter("password");

        if (studentDao.studentExists(rollNo)) {
        	 request.setAttribute("errorMessage", "Sign-Up failed. Please try again.");
             response.sendRedirect("AlreadyExist.jsp");
        } else {
            StudentInfo student = new StudentInfo();
            student.setRollNo(rollNo);
            student.setName(name);
            student.setEmail(email);
            student.setCourse(course);
            student.setDepartment(department);
            student.setSemester(semester);
            student.setPassword(password);

            if (studentDao.registerStudent(student)) {
                response.sendRedirect("RegisterSuccess.jsp");
            } else {
                request.setAttribute("errorMessage", "Sign-Up failed. Please try again.");
                response.sendRedirect("NotFound.jsp");
               
            }
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set content type for the response
        response.setContentType("text/html");

        // Create a StudentDao object to interact with the database
        StudentDao studentDao = new StudentDao(DBConnection.getConnection());

        // Fetch notifications from the DAO
        List<HodNotification> notificationDetails = studentDao.getNotifications();

        // Set the notifications as an attribute in the request so they can be accessed in the JSP
        request.setAttribute("notificationDetails", notificationDetails);

        // Forward the request to the JSP page for rendering
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Student-dashboard.jsp"); // your JSP file path
        dispatcher.forward(request, response);
    }
}
