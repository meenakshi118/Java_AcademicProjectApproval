package com.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import com.project.dao.AdminDAO;
import com.project.db.DBConnection;
import com.project.model.HodInfo;
import java.io.IOException;


@WebServlet("/AddHodServlet")
public class AddHodServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String gmail = request.getParameter("gmail");
        String password = request.getParameter("password");
        String course = request.getParameter("course");
        String department = request.getParameter("department");
        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("phone_number");

        HodInfo student = new HodInfo();
   
        student.setName(name);
        student.setGmail(gmail);
        student.setCourse(course);
        student.setDepartment(department);
        student.setPhoneNumber(phoneNumber);
        student.setPassword(password);
        

       
        
        AdminDAO admin = new AdminDAO( DBConnection.getConnection());
        if (!admin.isHodExistsWithSameCourse(course)) {
            admin.addHod(student);
            response.sendRedirect("RegisterSuccess.jsp"); // Redirect to a success page or list page
        } else {
        	request.setAttribute("errorMessage", "Courses are same");
            response.sendRedirect("AlreadyExist.jsp"); // Redirect to a failure page
        }
    }
}

