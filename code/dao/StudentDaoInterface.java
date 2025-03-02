package com.project.dao;

import java.util.List;

import com.project.model.InchargeInfo;
import com.project.model.Project;
import com.project.model.StudentInfo;

public interface StudentDaoInterface {

	public boolean authenticateStudent(String email, String password) ;
	public boolean registerStudent(String rollNo, String name, String email, String course, String branch, String semester, String password);
	public boolean studentExists(String rollNo, String email);
	public StudentInfo getStudentDetails(String rollNo);
	public List<Project> getAllProjects(String rollNo) ;
	public InchargeInfo getInchargeDetails(String rollNo);
	public boolean saveProject(Project project);
	public String getFilePath(String rollNo, String projectTitle);
	public List<StudentInfo> getStudentDetails();
}
