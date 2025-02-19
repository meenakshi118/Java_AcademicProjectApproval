package com.project.servlet;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.RequestDispatcher;

import com.project.dao.HODDao;
import com.project.db.DBConnection;
import com.project.model.Project;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;


@WebServlet("/ApprovalWorkflowServlet")
public class ApprovalWorkflowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 System.out.println("HODAppprovalServlet doPost triggered");
    	 try {// Get the HOD's course from session
        HttpSession sessionhod = request.getSession();
        String hodCourse = (String) sessionhod.getAttribute("hodCourse");

        if (hodCourse != null) {
            // Fetch the list of projects pending approval
            HODDao hodDao = new HODDao(DBConnection.getConnection());
            List<Project> projects = hodDao.getProjectsPendingApproval(hodCourse);

            // Set the projects attribute to pass it to the JSP
            request.setAttribute("projects", projects);
            // Forward the request to the JSP page
            RequestDispatcher dispatcher = request.getRequestDispatcher("/HOD-dashboard.jsp");
            dispatcher.forward(request, response);
        } else {
            // Handle error if the course is not set in the session
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Course information is missing in session.");
        }
    
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }

  
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            // Ensure that projectId is being parsed correctly as an integer
            int projectId = Integer.parseInt(request.getParameter("id"));
            System.out.println("projectID : "+ projectId);
            String action = request.getParameter("action");
            String feedback = request.getParameter("feedback"); 

            // Initialize the connection and DAO
            Connection conn = DBConnection.getConnection();
            HODDao hodDao = new HODDao(conn);

            boolean isUpdated = false;
            if ("approve".equals(action)) {
                // Pass projectId as an integer, not a String
                isUpdated = hodDao.updateProjectStatus(projectId, "HodApproved");
            } else if ("reject".equals(action)) {
            	if (feedback == null || feedback.trim().isEmpty()) {
                    // Feedback is not provided; show an error message
                    System.out.println("Feedback is null");
                    response.sendRedirect("HOD-dashboard.jsp?error=FeedbackRequired");
                    
                    return;
                }

                // Update project status after feedback is handled
            	isUpdated = hodDao.updateProjectFeedbackAndStatus(projectId, feedback, "HodReject");
            
            }
            

            if (isUpdated) {
                response.sendRedirect("HOD-dashboard.jsp"); // Redirect to HOD panel on success
            } else {
                response.getWriter().write("Error updating project status.");
            }
        }
    }


