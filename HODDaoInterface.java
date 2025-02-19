package com.project.dao;

import java.sql.Date;
import java.util.List;

import com.project.model.HodInfo;
import com.project.model.Project;
import com.project.model.StudentInfo;

public interface HODDaoInterface {

	public boolean authenticate(String email, String password) ;
	 public String getCourseByEmail(String email);
	 public List<String> getStudentsByCourse(String course);
	 public boolean assignProjectIncharge(String studentRollNo, String inchargeName);
	 public List<String> getProjectIncharges() ;
	 public List<Project> getProjectsPendingApproval(String course);
	 public List<Project> getProjects(String course);
	 public boolean updateProjectStatus(int projectId, String status);
	 public List<StudentInfo> getStudentsWithInchargeByCourse(String course);
	 public boolean updateProjectFeedbackAndStatus(int projectId, String feedback, String status);
	 public boolean sendNotification(String message, java.sql.Date reminderDate);
	 public List<HodInfo> getHodDetails();
	 
}
