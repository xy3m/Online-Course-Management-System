package com.entity;

public class Student {
    private int id;
    private String fullName;
    private String regNo; // NEW FIELD
    private String email;
    private String password;

    public Student() { super(); }

    public Student(String fullName, String regNo, String email, String password) {
        super();
        this.fullName = fullName;
        this.regNo = regNo;
        this.email = email;
        this.password = password;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    
    // NEW GETTER/SETTER
    public String getRegNo() { return regNo; }
    public void setRegNo(String regNo) { this.regNo = regNo; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}