package com.project.servlet;

import com.project.dao.StudentDao;
import com.project.db.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/DocumentServlet")
public class DocumentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the 'rollNo' and 'projectTitle' from the request parameters
        String rollNo = request.getParameter("rollNo");
        String projectTitle = request.getParameter("projectTitle");

        // Check if the parameters are missing
        if (rollNo == null || projectTitle == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid request parameters!");
            return;
        }

        // Access the ProjectDao to retrieve the file path for the specified project
        StudentDao projectDao = new StudentDao(DBConnection.getConnection());
        String filePath = projectDao.getFilePath(rollNo, projectTitle);

        // Check if file path is found
        if (filePath == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found for the specified project!");
            return;
        }

        // Create a File object with the file path
        File file = new File(filePath);

        // Check if the file exists on the server
        if (!file.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found on server!");
            return;
        }

        // Set the response content type based on the file's MIME type
        String mimeType = getServletContext().getMimeType(file.getName());
        if (mimeType == null) {
            mimeType = "application/octet-stream";  // Fallback to binary stream if MIME type is not found
        }
        response.setContentType(mimeType);
        
        // Set the header for inline display in the browser with the file name
        response.setHeader("Content-Disposition", "inline; filename=\"" + file.getName() + "\"");

        // Send the file content to the response output stream
        try (FileInputStream fis = new FileInputStream(file);
             OutputStream os = response.getOutputStream()) {

            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fis.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
        }
    }
}
