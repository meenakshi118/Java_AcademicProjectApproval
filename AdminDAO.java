package com.project.dao;

import java.sql.Connection;
import com.project.model.HodInfo;
import com.project.model.StudentInfo;
import com.project.model.InchargeInfo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {
    private Connection conn;

    public AdminDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean authenticate(String email, String password) {
        String query = "SELECT * FROM admininfo WHERE gmail = ? AND password = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
            return rs.next(); // Returns true if admin exists
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean updatePassword(String email, String newPassword) {
        String query = "UPDATE admininfo SET password = ? WHERE gmail = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, newPassword);
            pstmt.setString(2, email);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    
    public boolean updateEmail(String currentEmail, String newEmail) {
        String query = "UPDATE admininfo SET gmail = ? WHERE gmail = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, newEmail);
            pstmt.setString(2, currentEmail);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public void addStudent(StudentInfo student) {
        String query = "INSERT INTO studentinfo (rollNo, name, email, course, department, semester, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
             
            pst.setString(1, student.getRollNo());
            pst.setString(2, student.getName());
            pst.setString(3, student.getEmail());
            pst.setString(4, student.getCourse());
            pst.setString(5, student.getDepartment());
            pst.setString(6, student.getSemester());
            pst.setString(7, student.getPassword());
           

            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public boolean removeStudent(String rollNo) {
        String query = "DELETE FROM studentinfo WHERE rollNo = ?";
        try ( PreparedStatement pst = conn.prepareStatement(query)) {
                 
            pst.setString(1, rollNo);
            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0;  // Returns true if deletion was successful
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
 // Method to check if an HOD already exists with the same course
    public boolean isHodExistsWithSameCourse(String course) {
        String query = "SELECT * FROM hodinfo WHERE course = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, course);
            ResultSet rs = pstmt.executeQuery();
            return rs.next(); // Returns true if HOD exists with the same course
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

 // Method to add a new HOD
    public void addHod(HodInfo hod) {
        // First, check if there is already an HOD with the same course
        if (isHodExistsWithSameCourse(hod.getCourse())) {
            System.out.println("HOD already exists with the same course.");
            return;
        }

        // If no existing HOD, proceed with adding the new HOD
        String query = "INSERT INTO hodinfo (gmail, password, course, department, name, phone_number) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, hod.getGmail());
            pstmt.setString(2, hod.getPassword());
            pstmt.setString(3, hod.getCourse());
            pstmt.setString(4, hod.getDepartment());
            pstmt.setString(5, hod.getName());
            pstmt.setString(6, hod.getPhoneNumber());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // Remove HOD by email or name
    public boolean removeHod(String name, String email) {
        String query = "DELETE FROM hodinfo WHERE gmail = ? OR name = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, email);
            pstmt.setString(2, name);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;  // Returns true if deletion was successful
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
 // Check if the project already has an incharge
    public boolean isInchargeExists(String email) {
        String query = "SELECT * FROM inchargeInfo WHERE gmail = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            return rs.next(); // Returns true if project has an incharge
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Add a new incharge
    public void addIncharge(InchargeInfo incharge) {
        String query = "INSERT INTO inchargeinfo (gmail, password,  department, name, phone_number) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, incharge.getGmail());
            pstmt.setString(2, incharge.getPassword());
            pstmt.setString(3, incharge.getDepartment());
            pstmt.setString(4, incharge.getName());
            pstmt.setString(5, incharge.getPhoneNumber());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Remove incharge by email
    public boolean removeIncharge(String name,String email) {
        String query = "DELETE FROM inchargeinfo WHERE gmail = ? OR name = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, email);
            pstmt.setString(2, name);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;  // Returns true if deletion was successful
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}