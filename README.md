# Java_AcademicProjectApproval
Academic Project Management System 🎓

📌 Overview
The Academic Project Management System is a web-based application built using JSP and Servlets to streamline the academic project approval process. It allows students to submit project synopses and reports, which are reviewed and approved by designated incharges and HODs. The system ensures transparency, role-based access, and structured workflow for project evaluation.

🔹 Key Features

## 👨‍🎓 Student Module---------------------------------------------

 **📤 Upload project synopsis and final report. **
 **👨‍🏫 View assigned incharge and project details. **
 **✅ Check approval status (Approved/Rejected). **
 **📌 See rejection reasons and re-submit projects if required. **
 **🔔 Receive notifications from HOD. **

## 🧑‍🏫 Incharge Module----------------------------------------------

 **👀 View students assigned under them. **
 **📝 Approve or reject student projects. **
**📊 Track project statuses and feedback. **

## 🎓 HOD Module----------------------------------------------------

 **🎯 Assign incharges to students. **
 **📝 Approve or reject projects. **
 **🔍 View all student project statuses. **
 **⏰ Send reminders and notifications. **

## 🛠️ Tech Stack-----------------------------------------------------

 **Frontend: HTML, CSS **
 **Backend: JSP, Servlets **
 **Database: MySQL **
 **Server: Apache Tomcat **


# Project Approval Dummy Database -------------------------------------

This contains a dummy version of the `projectapproval` database used in our project.  
It includes all necessary tables with dummy data for testing purposes.

## 📌 Database Name: `projectapproval`

### 📂 Tables Included:
1. **admininfo**  
   - `id` (INT, Primary Key, Auto-increment)  
   - `gmail` (VARCHAR(100), NOT NULL)  
   - `password` (VARCHAR(255), NOT NULL)  

2. **hod_documents**  
   - `document_id` (INT, Primary Key, Auto-increment)  
   - `hod_id` (INT, Foreign Key)  
   - `title` (VARCHAR(100))  
   - `document_path` (VARCHAR(255))  

3. **hodinfo**  
   - `id` (INT, Primary Key, Auto-increment)  
   - `gmail` (VARCHAR(100), NOT NULL)  
   - `password` (VARCHAR(255), NOT NULL)  
   - `course` (VARCHAR(255))  

4. **inchargeinfo**  
   - `id` (INT, Primary Key, Auto-increment)  
   - `name` (VARCHAR(100), NOT NULL)  
   - `gmail` (VARCHAR(100), UNIQUE, NOT NULL)  
   - `password` (VARCHAR(255), NOT NULL)  
   - `department` (VARCHAR(100))  
   - `phone_number` (VARCHAR(15))  

5. **studentinfo**  
   - `rollNo` (VARCHAR(20), Primary Key, NOT NULL)  
   - `name` (VARCHAR(100), NOT NULL)  
   - `email` (VARCHAR(100), UNIQUE, NOT NULL)  
   - `course` (VARCHAR(100), NOT NULL)  
   - `department` (VARCHAR(255))  
   - `semester` (VARCHAR(10), NOT NULL)  
   - `password` (VARCHAR(255), NOT NULL)  
   - `incharge_id` (INT, Foreign Key)  

6. **projects**  
   - `project_id` (INT, Primary Key, Auto-increment)  
   - `s_rollno` (VARCHAR(20), Foreign Key)  
   - `project_name` (VARCHAR(255), NOT NULL)  
   - `document_path` (VARCHAR(255), NOT NULL)  
   - `status` (ENUM: `submitted`, `inchargeApproved`, `HodApproved`, `reject`)  
   - `incharge_id` (INT, Foreign Key)  
   - `date` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)  

---

## 📥 Importing the Database  
To import this dummy database into MySQL, run:

```sh
mysql -u your_username -p projectapproval < projectapproval_dummy.sql
