package com.project.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    
    private static Connection connection = null;

    // Method to establish connection
    public static Connection getConnection()  {
        if (connection == null) {
            try {
                // Load the JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Create the connection
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ApprovalProjects", "root", "bias@123");
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        }
        System.out.println("connection");
        return connection;
    }

    // Method to close connection
    public static void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
