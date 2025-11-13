package com.entity;

public class Course {
    private int id;
    private String department;
    private String courseCode;
    private String courseTitle;
    private int teacherId;
    private String teacherName; // Helper for display

    public Course() { super(); }

    public Course(String department, String courseCode, String courseTitle, int teacherId) {
        super();
        this.department = department;
        this.courseCode = courseCode;
        this.courseTitle = courseTitle;
        this.teacherId = teacherId;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public String getCourseCode() { return courseCode; }
    public void setCourseCode(String courseCode) { this.courseCode = courseCode; }

    public String getCourseTitle() { return courseTitle; }
    public void setCourseTitle(String courseTitle) { this.courseTitle = courseTitle; }

    public int getTeacherId() { return teacherId; }
    public void setTeacherId(int teacherId) { this.teacherId = teacherId; }
    
    public String getTeacherName() { return teacherName; }
    public void setTeacherName(String teacherName) { this.teacherName = teacherName; }
}