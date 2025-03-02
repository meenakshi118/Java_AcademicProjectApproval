package com.project.dao;

import java.util.List;

import com.project.model.InchargeInfo;
import com.project.model.Project;
import com.project.model.StudentInfo;

public interface InChargeDaoInterface {
	public boolean authenticate(String email, String password) ;
	public int getInChargeIdByEmail(String email);
	public List<Project> getProjectsPendingApproval(int id);
	 public List<Project> getProjects(int id) ;
	 public boolean updateProjectStatus(int projectId, String status);
	 public List<StudentInfo> getStudentsByInCharge(int id) ;
	 public List<InchargeInfo> getInchargeDetails();
}
