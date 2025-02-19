package com.project.model;
import java.sql.Timestamp;

public class Project {
    private int id;
    private String rollNo; // Added roll number field
    private String studentName;
    private String projectTitle;
    private String documentPath; // Added document path field
    private String status;
    private int inchargeId;
    private Timestamp date;
    private String inchargeName;
    private String feedback; 
    
    // Getters and setters
    public int getprojectId() {
        return id;
    }

    public void setprojectId(int id) {
        this.id = id;
    }

    public String getRollNo() {
        return rollNo;
    }

    public void setRollNo(String rollNo) {
        this.rollNo = rollNo;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getProjectTitle() {
        return projectTitle;
    }

    public void setProjectTitle(String projectTitle) {
        this.projectTitle = projectTitle;
    }

    public String getDocumentPath() {
        return documentPath;
    }

    public void setDocumentPath(String documentPath) {
        this.documentPath = documentPath;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    public int getInchargeId() {
        return inchargeId;
    }

    
    public void setInchargeId(int inchargeId) {
        this.inchargeId = inchargeId;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
    
    public String getInchargeName() {
        return inchargeName;
    }

    public void setInchargeName(String inchargeName) {
        this.inchargeName =  inchargeName;
    }
 // Getters and setters for feedback
    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }
}
