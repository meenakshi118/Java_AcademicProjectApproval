package com.project.model;
public class StudentInfo {
    private String rollNo;
    private String name;
    private String email;
    private String course;
    private String department;
    private String semester;
    private String password;
    private Integer inchargeId;
    private String InchargeName;   // Added field for incharge name
    private String feedback;

    // Getter and Setter for rollNo
    public String getRollNo() {
        return rollNo;
    }

    public void setRollNo(String rollNo) {
        this.rollNo = rollNo;
    }

    // Getter and Setter for name
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // Getter and Setter for email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Getter and Setter for course
    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    // Getter and Setter for branch
    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    // Getter and Setter for semester
    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    // Getter and Setter for password
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    // Getter and Setter for inchargeId
    public Integer getInchargeId() {
        return inchargeId;
    }

    public void setInchargeId(Integer inchargeId) {
        this.inchargeId = inchargeId;
    }
 // Getter and Setter for password
    public String getInchargeName() {
        return InchargeName;
    }

    public void setInchargeName(String InchargeName) {
        this.InchargeName = InchargeName;
    }
}
