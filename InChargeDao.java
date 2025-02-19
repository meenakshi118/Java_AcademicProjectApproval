package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.project.db.DBConnection;
import com.project.model.Project;
import com.project.model.StudentInfo;
import com.project.model.InchargeInfo;
import java.util.*;

public class InChargeDao implements InChargeDaoInterface {
    private Connection conn;

    public InChargeDao(Connection conn) {
        this.conn = conn;
    }

    // Authenticate the In-Charge user based on their email and password
    public boolean authenticate(String email, String password) {
        String query = "SELECT * FROM inchargeinfo WHERE gmail = ? AND password = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return true;  // Authentication successful
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;  // Authentication failed
    }

    // Get the In-Charge ID based on the email
    public int getInChargeIdByEmail(String email) {
        String query = "SELECT id FROM inchargeinfo WHERE gmail = ?";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;  // Return -1 if no matching record found
    }

    // Fetch the list of projects pending approval for a particular In-Charge
    public List<Project> getProjectsPendingApproval(int id) {
        List<Project> projects = new ArrayList<>();
        String query = "SELECT p.project_id, p.s_rollno, p.project_name, p.document_path, p.status, " +
                "s.name FROM projects p " +
                "JOIN studentinfo s ON p.s_rollno = s.rollNo " +
                "WHERE p.incharge_id = ? AND p.status= 'submitted'";

        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Project project = new Project();
                project.setRollNo(rs.getString("s_rollno"));
                project.setStudentName(rs.getString("name"));
                project.setProjectTitle(rs.getString("project_name"));
                project.setDocumentPath(rs.getString("document_path"));
                project.setStatus(rs.getString("status"));
                project.setprojectId(rs.getInt("p.project_id"));
                projects.add(project);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return projects;
    }

    //method to list all projects of students 
    public List<Project> getProjects(int id) {
        List<Project> projects = new ArrayList<>();
        String query = "SELECT p.project_id, p.s_rollno, p.project_name, p.document_path, p.status, " +
                "s.name FROM projects p " +
                "JOIN studentinfo s ON p.s_rollno = s.rollNo " +
                "WHERE p.incharge_id = ?";

        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Project project = new Project();
                project.setRollNo(rs.getString("s_rollno"));
                project.setStudentName(rs.getString("name"));
                project.setProjectTitle(rs.getString("project_name"));
                project.setDocumentPath(rs.getString("document_path"));
                project.setStatus(rs.getString("status"));
                project.setprojectId(rs.getInt("p.project_id"));
                projects.add(project);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return projects;
    }

    // Method to update the status of a project (approve or reject)
    public boolean updateProjectStatus(int projectId, String status) {
        String query = "UPDATE projects SET status = ? WHERE project_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, status);
            stmt.setInt(2, projectId);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;  // Return true if status was successfully updated
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    
 // Method to update the status of a project (approve or reject) and feedback
    public boolean updateProjectFeedbackAndStatus(int projectId, String feedback, String status) {
        String query = "UPDATE projects SET feedback = ?, status = ? WHERE project_id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            // Set the parameters for the query
            pstmt.setString(1, feedback);
            pstmt.setString(2, status);
            pstmt.setInt(3, projectId);
            
            // Execute the update and check if any rows were affected
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;  // Return true if both feedback and status were updated
        } catch (SQLException e) {
            e.printStackTrace();
            return false;  // Return false in case of an error
        }
    }
    
    //fetch student assigned to incharge
    public List<StudentInfo> getStudentsByInCharge(int id) {
        List<StudentInfo> students = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT rollno , name, course, email, semester FROM studentinfo WHERE incharge_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                StudentInfo student = new StudentInfo();
                student.setRollNo(rs.getString("rollno"));  // Column name corrected to 'rollno'
                student.setName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                student.setCourse(rs.getString("course"));
                student.setSemester(rs.getString("semester"));
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    // Method to get all Incharge details
    public List<InchargeInfo> getInchargeDetails() {
        List<InchargeInfo> inchargeList = new ArrayList<>();
        
        // SQL query to fetch all Incharge details
        String query = "SELECT id, name, gmail, department, phone_number FROM inchargeInfo";
        
        try (PreparedStatement statement = conn.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery(query)) {
            
            // Loop through the result set and map data to InchargeInfo objects
            while (resultSet.next()) {
                InchargeInfo incharge = new InchargeInfo();
                incharge.setId(resultSet.getInt("id"));
                incharge.setName(resultSet.getString("name"));
                incharge.setGmail(resultSet.getString("gmail"));
                incharge.setDepartment(resultSet.getString("department"));
                incharge.setPhoneNumber(resultSet.getString("phone_number"));
                
                // Add the InchargeInfo object to the list
                inchargeList.add(incharge);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return inchargeList;
    }
}