package com.project.dao;

import com.project.db.DBConnection;
import com.project.model.StudentInfo;
import com.project.model.InchargeInfo;
import com.project.model.HodNotification;
import com.project.model.Project;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDao {
	  private Connection conn;

	    public StudentDao(Connection conn) {
	        this.conn = conn;
	    }

    // Register a new student
	public boolean registerStudent(StudentInfo student) {
	    String query = "INSERT INTO StudentInfo (rollNo, name, email, course, department, semester, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
	    try (PreparedStatement pstmt = conn.prepareStatement(query)) {
	        
	        if (conn == null || conn.isClosed()) {
	            System.out.println("Connection is closed or not established.");
	            return false;  // Handle the case where connection fails
	        }
	        
	        pstmt.setString(1, student.getRollNo());
	        pstmt.setString(2, student.getName());
	        pstmt.setString(3, student.getEmail());
	        pstmt.setString(4, student.getCourse());
	        pstmt.setString(5, student.getDepartment());
	        pstmt.setString(6, student.getSemester());
	        pstmt.setString(7, student.getPassword());

	        int rowsAffected = pstmt.executeUpdate();
	        return rowsAffected > 0;

	    } catch (SQLException e) {
	        e.printStackTrace(); // Log the exception
	        return false;
	    }
	}



    public boolean authenticateStudent(String rollNo, String password) {
        String query = "SELECT * FROM StudentInfo WHERE rollNo = ? AND password = ?";
        try ( PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setString(1, rollNo);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
            		
            	if (rs.next()) {
                    // Authentication successful
                    return true;
                }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    // Check if a student already exists by roll number or email
    public boolean studentExists(String rollNo) {
        String query = "SELECT * FROM StudentInfo WHERE rollNo = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, rollNo);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next(); // True if a record is found
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    
    public StudentInfo getStudentDetails(String rollNo) {
        String query = "SELECT rollNo, name, email, course, department, semester, incharge_id, feedback " +
                       "FROM studentinfo WHERE rollNo = ?";
        System.out.println("Fetching student details for rollNo: " + rollNo); // Debugging line

        try {
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, rollNo); // Set the roll number parameter

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    // Create the StudentInfo object and set values
                    StudentInfo student = new StudentInfo();
                    student.setRollNo(rs.getString("rollNo"));
                    student.setName(rs.getString("name"));
                    student.setEmail(rs.getString("email"));
                    student.setCourse(rs.getString("course"));
                    student.setDepartment(rs.getString("department"));
                    student.setSemester(rs.getString("semester"));
                    student.setInchargeId(rs.getInt("incharge_id")); // Set incharge_id
                    student.setFeedback(rs.getString("feedback")); // Set feedback
                    return student;
                } else {
                    System.out.println("No student found for rollNo: " + rollNo); // Debugging line
                }
            }
        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
            e.printStackTrace(); // Replace with logger
        }
        return null; // Return null if no details are found
    }



 // Method to get all projects for a student based on rollNo
    public List<Project> getAllProjects(String rollNo) {
        List<Project> projects = new ArrayList<>();
        String query = "SELECT p.project_name, p.status, p.date, p.feedback,i.name " +
                       "FROM Projects p " +
                       "JOIN inchargeinfo i ON p.incharge_id = i.id " +  // Join with InchargeInfo table
                       "WHERE p.s_rollno = ?";

        try (PreparedStatement pstmt = conn.prepareStatement(query)) {

            // Bind the roll number to the query
            pstmt.setString(1, rollNo);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    // Map each row in the result set to a Project object
                    Project project = new Project();
                    project.setProjectTitle(rs.getString("p.project_name"));
                    project.setStatus(rs.getString("p.status"));
                    project.setDate(rs.getTimestamp("p.date"));
                    project.setInchargeName(rs.getString("i.name")); // Setting the incharge name
                    project.setFeedback(rs.getString("p.feedback"));
                    projects.add(project);
                 
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return projects; // Return the list of projects
    }

//method to fetch current incharge
    public InchargeInfo getInchargeDetails(String rollNo) {
        String query = "SELECT i.name, i.phone_number, i.gmail FROM inchargeinfo i JOIN studentinfo s ON s.incharge_id = i.id WHERE s.rollNo = ?";
        
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, rollNo); // Bind the rollNo parameter
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                InchargeInfo inchargeInfo = new InchargeInfo(); // Create the object only if data is found
                inchargeInfo.setName(rs.getString("name")); // Use column alias without table prefix
                inchargeInfo.setGmail(rs.getString("gmail"));
                inchargeInfo.setPhoneNumber(rs.getString("phone_number"));
                return inchargeInfo;
            }
        } catch (SQLException e) {
            System.err.println("Error fetching incharge info: " + e.getMessage());
        }
        return null;
    }

   
    
    public boolean saveProject(Project project) {
        String query = "INSERT INTO Projects (s_rollno, project_name, document_path, status, incharge_id, date) " +
                       "VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, project.getRollNo());
            pstmt.setString(2, project.getProjectTitle());
            pstmt.setString(3, project.getDocumentPath());
            pstmt.setString(4, project.getStatus());
            pstmt.setInt(5, project.getInchargeId());
            pstmt.setTimestamp(6, project.getDate());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to get the file path for a project based on rollNo and projectTitle
    public String getFilePath(String rollNo, String projectTitle) {
        String filePath = null;
        String sql = "SELECT document_path FROM Projects WHERE s_rollno = ? AND project_name = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Set the parameters for the query
            stmt.setString(1, rollNo);
            stmt.setString(2, projectTitle);

            // Execute the query and retrieve the result
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    filePath = rs.getString("document_path"); // Fetch the file path from the result set
                }
            }
        } catch (SQLException e) {
            // Log the exception for debugging
            e.printStackTrace();
        }
        return filePath; // Return the file path or null if not found
    }

    
    public List<HodNotification> getNotifications() {
        List<HodNotification> notifications = new ArrayList<>();
        String query = "SELECT * FROM HodNotification WHERE reminder_date >= CURDATE() ORDER BY reminder_date ASC";
        
        try (PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                HodNotification notification = new HodNotification();
                notification.setId(rs.getInt("id"));
                notification.setMessage(rs.getString("message"));
                notification.setReminderDate(rs.getDate("reminder_date"));
                notification.setCreatedAt(rs.getTimestamp("created_at"));
                // Debugging: Log each notification fetched
                System.out.println("Notification fetched: " + notification.getMessage() + " - " + notification.getReminderDate());
                notifications.add(notification);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return notifications;
    }

 // Method to get all student details
    public List<StudentInfo> getStudentDetails() {
        List<StudentInfo> studentList = new ArrayList<>();
        
        // SQL query to fetch all student details along with incharge details
        String query = "SELECT s.rollNo, s.name, s.email, s.course, s.department, s.semester FROM studentInfo s";
        
        try (PreparedStatement statement = conn.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery(query)) {
            
            // Loop through the result set and map data to StudentInfo objects
            while (resultSet.next()) {
                StudentInfo student = new StudentInfo();
                student.setRollNo(resultSet.getString("rollNo"));
                student.setName(resultSet.getString("name"));
                student.setEmail(resultSet.getString("email"));
                student.setCourse(resultSet.getString("course"));
                student.setDepartment(resultSet.getString("department"));
                student.setSemester(resultSet.getString("semester"));
                
                // Add the StudentInfo object to the list
                studentList.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return studentList;
    }
}
