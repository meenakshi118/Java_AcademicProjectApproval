package com.project.servlet;

import com.project.dao.StudentDao;
import com.project.db.DBConnection;
import com.project.model.Project;
import com.project.model.StudentInfo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet("/UploadServlet")
@MultipartConfig(
    maxFileSize = 1024 * 1024 * 10,  // Max file size 10MB
    maxRequestSize = 1024 * 1024 * 20,  // Max request size 20MB
    fileSizeThreshold = 1024 * 1024 * 2  // Files above 2MB are written to disk
)
public class UploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 System.out.println("Student UploadServlet doPost triggered");
        // Retrieve roll number from session
        String rollNo = (String) request.getSession().getAttribute("rollNo");
      
        if (rollNo == null) {
            response.sendRedirect("Student-dashboard.jsp");
            return;
        }

        // Retrieve project title
        String projectTitle = request.getParameter("docTitle");

        // Retrieve student details from database
        StudentDao studentDao = new StudentDao(DBConnection.getConnection());
        StudentInfo studentInfo = studentDao.getStudentDetails(rollNo);

        if (studentInfo == null) {
            response.getWriter().println("Invalid Roll Number!");
            return;
        }

        if (studentInfo.getInchargeId() == null) {
            response.getWriter().println("Project cannot be submitted as no project incharge is assigned.");
            return;
        }

        // Handle file upload
        Part filePart = request.getPart("document");
        if (filePart == null || filePart.getSize() == 0) {
            response.getWriter().println("No file uploaded!");
            return;
        }

        if (filePart.getSize() > 1024 * 1024 * 10) {
            response.getWriter().println("File size exceeds the maximum allowed limit of 10MB.");
            return;
        }

        // Get original file name
        String originalFileName = filePart.getSubmittedFileName();
      

        // Generate unique file name
        String uniqueFileName = rollNo + "_" + System.currentTimeMillis() + "_" + originalFileName;

        // Determine upload directory path
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists() && !uploadDir.mkdir()) {
            throw new IOException("Failed to create upload directory: " + uploadPath);
        }

        System.out.println("Upload Directory: " + uploadPath);

        // Save the file to the upload directory
        String filePath = uploadPath + File.separator + uniqueFileName;
        try {
            filePart.write(filePath);
            
        } catch (IOException e) {
            e.printStackTrace();
            response.getWriter().println("Error saving file!");
            return;
        }

        // Save project details to the database
        Project project = new Project();
        project.setRollNo(rollNo);
        project.setProjectTitle(projectTitle);
        project.setDocumentPath(UPLOAD_DIR + "/" + uniqueFileName);  // Relative path for database
        project.setStatus("Submitted");
        project.setInchargeId(studentInfo.getInchargeId());
        project.setDate(new Timestamp(System.currentTimeMillis()));

        boolean isSaved = studentDao.saveProject(project);

        if (isSaved) {
            response.getWriter().println("Project Uploaded Successfully!");
            response.sendRedirect("Student-dashboard.jsp?uploadSuccess=true");
        } else {
            response.getWriter().println("Failed to upload project!");
            response.sendRedirect("Student-dashboard.jsp?uploadSuccess=false");
        }
    }
}
