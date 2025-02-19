package com.project.dao;
import com.project.db.DBConnection;
import com.project.model.Project;
import com.project.model.StudentInfo;
import com.project.model.HodInfo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

public class HODDao implements HODDaoInterface {
    private Connection conn;

    public HODDao(Connection conn) {
        this.conn = conn;
    }

    // Method to authenticate HOD
    public boolean authenticate(String email, String password) {
        String query = "SELECT * FROM hodinfo WHERE gmail = ? AND password = ?";
        String hodCourse = null;
        try {
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                hodCourse = rs.getString("course");
                // Authentication successful
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to fetch course by HOD email
    public String getCourseByEmail(String email) {
        String course = null;
        try {
            String query = "SELECT course FROM hodinfo WHERE gmail = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                course = rs.getString("course");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return course;
    }

    // Method to fetch students by course
    public List<String> getStudentsByCourse(String course) {
        List<String> students = new ArrayList<>();
        try {
            String query = "SELECT rollNo FROM studentinfo WHERE LOWER(course) = LOWER(?)";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, course);
            ResultSet rs = pst.executeQuery();
            System.out.println();
            while (rs.next()) {
                students.add(rs.getString("rollNo"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }
 // Method to assign project incharge to a student
    public boolean assignProjectIncharge(String studentRollNo, String inchargeName) {
        try {
            // Step 1: Fetch the inchargeId based on the incharge name from the inchargeInfo table
            String inchargeId = null;
            String inchargeQuery = "SELECT id FROM inchargeInfo WHERE name = ?";
            PreparedStatement inchargeStmt = conn.prepareStatement(inchargeQuery);
            inchargeStmt.setString(1, inchargeName);
            ResultSet rs = inchargeStmt.executeQuery();
System.out.println("Incharge name"+inchargeName);

            if (rs.next()) {
                inchargeId = rs.getString("id");  // Get the incharge ID
                System.out.println("InchargeId"+inchargeId);
            }

            // Step 2: If inchargeId is found, update the student with the inchargeId
            if (inchargeId != null) {
                String updateQuery = "UPDATE studentinfo SET incharge_id = ? WHERE rollNo = ?";
                PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
                updateStmt.setString(1, inchargeId);  // Set the inchargeId
                updateStmt.setString(2, studentRollNo);  // Set the student roll number

                int rowsUpdated = updateStmt.executeUpdate();
                if (rowsUpdated > 0) {
                    System.out.println("id updated to studentInfo"); // Log after successful update
                    return true;  // Return true if update is successful
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    
 // Method to fetch project incharge names
    public List<String> getProjectIncharges() {
        List<String> incharges = new ArrayList<>();
        try {
            String query = "SELECT name FROM inchargeInfo"; // Assuming 'name' is the column for incharge names
            PreparedStatement pst = conn.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                incharges.add(rs.getString("name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return incharges;
    }

 // Fetch list of projects with status = 'submitted'
    public List<Project> getProjectsPendingApproval(String course) {
        List<Project> projects = new ArrayList<>();
        String query = "SELECT p.project_id, p.s_rollno, p.project_name, p.document_path, p.status, " +
                "s.name FROM projects p " +
                "JOIN studentinfo s ON p.s_rollno = s.rollNo " +
                "WHERE p.status = 'InchargeApproved' AND LOWER(s.course) = LOWER(?)";

      
        try (PreparedStatement pst= conn.prepareStatement(query)) {
        	 pst.setString(1, course);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Project project = new Project();
                project.setprojectId(rs.getInt("project_id"));
                project.setRollNo(rs.getString("s_rollno"));
                project.setStudentName(rs.getString("s.name"));
                project. setProjectTitle(rs.getString("project_name"));
                project.setDocumentPath(rs.getString("document_path"));
                project.setStatus(rs.getString("status"));
                projects.add(project);
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return projects;
    }
    
    public List<Project> getProjects(String course) {
        List<Project> projects = new ArrayList<>();
        String query = "SELECT p.project_id, p.s_rollno, p.project_name, p.document_path, p.status, " +
                "s.name FROM projects p " +
                "JOIN studentinfo s ON p.s_rollno = s.rollNo " +
                "WHERE  LOWER(s.course) = LOWER(?)";

      
        try (PreparedStatement pst= conn.prepareStatement(query)) {
        	 pst.setString(1, course);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Project project = new Project();
                project.setprojectId(rs.getInt("project_id"));
                project.setRollNo(rs.getString("s_rollno"));
                project.setStudentName(rs.getString("s.name"));
                project. setProjectTitle(rs.getString("project_name"));
                project.setDocumentPath(rs.getString("document_path"));
                project.setStatus(rs.getString("status"));
                projects.add(project);
                
                
                    System.out.println("Project ID: " + project.getprojectId());
                    System.out.println("Student Name: " + project.getStudentName());
                    System.out.println("Project Title: " + project.getProjectTitle());
                    System.out.println("Document Path: " + project.getDocumentPath());
                    System.out.println("Status: " + project.getStatus());
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return projects;
    }

 // Method to update the project status (approve/reject)
    public boolean updateProjectStatus(int projectId, String status) {
        String query = "UPDATE projects SET status = ? WHERE project_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, status);
            stmt.setInt(2, projectId);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0; // Return true if status was successfully updated
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
    
    
    public List<StudentInfo> getStudentsWithInchargeByCourse(String course) {
        List<StudentInfo> students = new ArrayList<>();
        String query = "SELECT s.rollNo, s.name AS student_name, i.name AS incharge_name " +
                       "FROM studentinfo s " +
                       "LEFT JOIN inchargeinfo i ON s.incharge_id = i.id " +
                       "WHERE LOWER(s.course) = LOWER(?)";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setString(1, course);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                StudentInfo student = new StudentInfo();
                student.setRollNo(rs.getString("rollNo"));
                student.setName(rs.getString("student_name"));
                student.setInchargeName(rs.getString("incharge_name"));
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

 // Method to send notification to students and in-charge
    public boolean sendNotification(String message, java.sql.Date reminderDate) {
        String query = "INSERT INTO HodNotification (message, reminder_date) VALUES (?, ?)";
        try ( 
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, message);
            stmt.setDate(2, reminderDate);  // Pass sql.Date here
            int result = stmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to get all HOD details
    public List<HodInfo> getHodDetails() {
        List<HodInfo> hodList = new ArrayList<>();
        
        // SQL query to fetch all HOD details
        String query = "SELECT id, name, gmail, course, department, phone_number FROM hodInfo";
        
        try (PreparedStatement statement = conn.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery(query)) {
            
            // Loop through the result set and map data to HodInfo objects
            while (resultSet.next()) {
                HodInfo hod = new HodInfo();
                hod.setId(resultSet.getInt("id"));
                hod.setName(resultSet.getString("name"));
                hod.setGmail(resultSet.getString("gmail"));
                hod.setCourse(resultSet.getString("course"));
                hod.setDepartment(resultSet.getString("department"));
                hod.setPhoneNumber(resultSet.getString("phone_number"));
                
                // Add the HodInfo object to the list
                hodList.add(hod);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hodList;
}
}