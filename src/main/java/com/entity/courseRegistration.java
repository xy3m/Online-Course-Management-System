package com.entity;

public class courseRegistration {
    private int id;
    private int studentID;
    private String fullName;
    private String regNO;
    private String courseName;

    public courseRegistration() {
        super();
    }

    public courseRegistration(int studentID, String fullName, String regNO, String courseName) {
        super();
        this.studentID = studentID;
        this.fullName = fullName;
        this.regNO = regNO;
        this.courseName = courseName;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getStudentID() { return studentID; }
    public void setStudentID(int studentID) { this.studentID = studentID; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getRegNO() { return regNO; }
    public void setRegNO(String regNO) { this.regNO = regNO; }

    public String getCourseName() { return courseName; }
    public void setCourseName(String courseName) { this.courseName = courseName; }
}