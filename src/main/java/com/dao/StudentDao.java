package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.entity.Student;

public class StudentDao {
    private Connection conn;

    public StudentDao(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean register(Student u) {
        boolean f = false;
        try {
            // MODIFIED: Added reg_no
            String sql = "insert into student_dtls(full_name, reg_no, email, password) values(?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getFullName());
            ps.setString(2, u.getRegNo()); // Save Reg No
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getPassword());

            int i = ps.executeUpdate();
            if (i == 1) { f = true; }
        } catch (Exception e) { e.printStackTrace(); }
        return f;
    }

    public Student login(String em, String psw) {
        Student u = null;
        try {
            String sql = "select * from student_dtls where email=? and password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, em);
            ps.setString(2, psw);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u = new Student();
                u.setId(rs.getInt("id"));
                u.setFullName(rs.getString("full_name"));
                u.setRegNo(rs.getString("reg_no")); // Retrieve Reg No
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return u;
    }

 // Inside com.dao.StudentDao.java

    public boolean checkStudentExists(String email, String regNo) {
        boolean exists = false;
        try {
            // FIX: Change 'student' to 'student_dtls' (or whatever your correct table name is)
            String sql = "SELECT * FROM student_dtls WHERE email=? OR reg_no=?"; 
            
            // Also ensure column names match the database (changed regNo to reg_no for standard practice)
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, regNo); // regNo here is the Java variable

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                exists = true; 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exists;
    }
}
