package com.project.model;

import java.sql.Timestamp;

public class HodNotification {

    private int id;
    private String message;
    private java.sql.Date reminderDate;
    private Timestamp createdAt;

   
    // Getter and Setter for id
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    // Getter and Setter for message
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    // Getter and Setter for reminderDate
    public java.sql.Date getReminderDate() {
        return reminderDate;
    }

    public void setReminderDate(java.sql.Date reminderDate) {
        this.reminderDate = reminderDate;
    }

    // Getter and Setter for createdAt
    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

   
}
