package com.project.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.project.dao.AdminDAO;
import com.project.dao.StudentDao;
import com.project.model.StudentInfo;
import com.project.db.DBConnection;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
	  private static final long serialVersionUID = 1L; // Declare serialVersionUID
	  
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rollNo = request.getParameter("rollNo");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");
        String department = request.getParameter("department");
        String semester = request.getParameter("semester");
        String password = request.getParameter("password");
       
        // Create an instance of StudentDao
        StudentDao studentDao = new StudentDao(DBConnection.getConnection());
        
        if (studentDao.studentExists(rollNo)) {
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
        

        AdminDAO admin = new AdminDAO( DBConnection.getConnection());
        admin.addStudent(student);
        response.sendRedirect("RegisterSuccess.jsp");
        }
         
        }
    }

