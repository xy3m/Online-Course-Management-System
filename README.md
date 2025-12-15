# Online Course Management System (OCMS)

A web-based application built with **Java (JSP & Servlets)** and **MySQL** to streamline course registration and management for university students, teachers, and administrators.

## 🚀 Features

### 👨‍🎓 Student Module
* **Secure Registration & Login:** Students can create accounts with validation (checks for duplicate Email or Registration Number).
* **Course Enrollment:** Browse available courses and enroll instantly.
* **My Courses:** View a dashboard of registered courses, including Course Codes and Assigned Teachers.
* **Duplicate Check:** Prevents students from enrolling in the same course twice.

### 👩‍🏫 Teacher Module
* **Login:** Secure access for faculty members.
* **Dashboard:** View courses assigned to them.
* **Student List:** View students enrolled in their specific courses.

### 🛡️ Admin Module
* **Dashboard:** Overview of system stats (Total Students, Courses, Teachers).
* **Manage Teachers:** Add new teachers and assign them credentials.
* **Manage Courses:** Add new courses, assign course codes, and link them to teachers.
* **Session Management:** "Ghost Session" handling ensures secure switching between Admin/Teacher accounts.

---

## 🛠️ Tech Stack

* **Frontend:** HTML5, Tailwind CSS (for styling and glass-morphism effects), FontAwesome Icons.
* **Backend:** Java Servlets, JSP (JavaServer Pages).
* **Database:** MySQL.
* **Server:** Apache Tomcat 9.0.
* **IDE:** Eclipse Enterprise Edition.
* **Build Tool:** standard Dynamic Web Project.

---

## 🗄️ Database Schema

The project uses a MySQL database named `ocms`. Key tables include:

1.  **`student_dtls`**: Stores student info (ID, Full Name, Reg No, Email, Password).
2.  **`teacher`**: Stores teacher credentials and details.
3.  **`courses`**: Stores course info (Title, Code, Assigned Teacher ID).
4.  **`course_reg`**: Links students to courses (Many-to-Many relationship).

---

## ⚙️ Setup & Installation

### 1. Database Setup
1.  Open MySQL Workbench or Command Line.
2.  Create the database:
    ```sql
    CREATE DATABASE ocms;
    ```
3.  Import the SQL tables (or create them manually according to the Entity classes).

### 2. Project Configuration
1.  Open **Eclipse IDE**.
2.  Go to `File > Open Projects from File System` and select this project folder.
3.  Right-click Project > `Build Path` > `Configure Build Path` > **Libraries**.
    * Ensure **Apache Tomcat v9.0** is added to the Classpath.
    * Ensure `servlet-api.jar` is linked if needed.

### 3. Database Connection
1.  Open `src/main/java/com/db/DBConnect.java`.
2.  Update the username and password to match your local MySQL installation:
    ```java
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ocms", "root", "YOUR_PASSWORD");
    ```

### 4. Running the App
1.  Right-click on the project in Eclipse.
2.  Select `Run As > Run on Server`.
3.  Choose **Tomcat v9.0** and click Finish.
4.  Access the app at: `http://localhost:8080/OnlineCourseManagement/`

---

## 📝 License
This project is for educational purposes.
