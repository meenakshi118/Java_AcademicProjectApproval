package com.project.servlet;

import jakarta.servlet.http.HttpSession;
import jakarta.servlet.RequestDispatcher;  // Change to jakarta.servlet.RequestDispatcher
import com.project.dao.InChargeDao;
import com.project.db.DBConnection;
import com.project.model.Project;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/ApprovalServlet")
public class InchargeApproval extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get the In-Charge's ID from session
            HttpSession session = request.getSession();
            int id = (Integer) session.getAttribute("id");
            System.out.println("projec id in approve incharge"+ id);

            if (id != 0) {
                // Fetch the list of projects pending approval
                InChargeDao inChargeDao = new InChargeDao(DBConnection.getConnection());
                List<Project> projects = inChargeDao.getProjectsPendingApproval(id);
                // Set the projects attribute to pass it to the JSP
                request.setAttribute("projects", projects);

                // Forward the request to the In-Charge Dashboard JSP
                RequestDispatcher dispatcher = request.getRequestDispatcher("/InCharge-dashboard.jsp");
                dispatcher.forward(request, response);
            } else {
                // Handle error if ID is not set in the session
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "In-Charge information is missing in session.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 System.out.println("InchargeApprovalServlet doPost triggered");
        // Ensure that projectId is being parsed correctly as an integer
        int projectId = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");
        String feedback = request.getParameter("feedback"); 
        System.out.println("Action : "+ action);
        System.out.println("Feedback : "+ feedback);
        // Initialize the connection and DAO
        Connection conn = DBConnection.getConnection();
        InChargeDao inChargeDao = new InChargeDao(conn);

        boolean isUpdated = false;

        // Handle the action of approving or rejecting the project
        if ("approve".equals(action)) {
            // Update the project status to "InchargeApproved"
            isUpdated = inChargeDao.updateProjectStatus(projectId, "InchargeApproved");
        } else if ("reject".equals(action)) {
        	if (feedback == null || feedback.trim().isEmpty()) {
                // Feedback is not provided; show an error message
                System.out.println("Feedback is null");
                response.sendRedirect("InCharge-dashboard.jsp?error=FeedbackRequired");
                
                return;
            }

            // Update project status after feedback is handled
        	isUpdated = inChargeDao.updateProjectFeedbackAndStatus(projectId, feedback, "InchargeReject");
        
        }

        if (isUpdated) {
            // Redirect to the In-Charge Panel page after update
            response.sendRedirect("InCharge-dashboard.jsp"); // Ensure correct JSP page name here
        } else {
            // Display error if status update fails
            response.getWriter().write("Error updating project status.");
        }
    }
}
