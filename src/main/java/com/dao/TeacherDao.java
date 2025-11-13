package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.entity.Teacher;

public class TeacherDao {
    private Connection conn;

    public TeacherDao(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean registerTeacher(Teacher d) {
        boolean f = false;
        try {
            // We insert 'Unassigned' into the old column just to satisfy the database rules
            // The actual course assignment happens in the Courses page now.
            String sql = "insert into teacher(full_name,course,email,password) values(?,'Unassigned',?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, d.getFullName());
            ps.setString(2, d.getEmail());
            ps.setString(3, d.getPassword());

            int i = ps.executeUpdate();
            if (i == 1) { f = true; }
        } catch (Exception e) { e.printStackTrace(); }
        return f;
    }

    public boolean deleteTeacher(int id) {
        boolean f = false;
        try {
            String sql = "delete from teacher where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int i = ps.executeUpdate();
            if (i == 1) { f = true; }
        } catch (Exception e) { e.printStackTrace(); }
        return f;
    }

    public Teacher login(String email, String psw) {
        Teacher d = null;
        try {
            // FIX: We now JOIN with the 'courses' table to get the real assigned courses
            String sql = "SELECT t.*, GROUP_CONCAT(c.course_title SEPARATOR ', ') as assigned_courses " +
                         "FROM teacher t " +
                         "LEFT JOIN courses c ON t.id = c.teacher_id " +
                         "WHERE t.email=? AND t.password=? " +
                         "GROUP BY t.id";
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, psw);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                d = new Teacher();
                d.setId(rs.getInt("id"));
                d.setFullName(rs.getString("full_name"));
                d.setEmail(rs.getString("email"));
                d.setPassword(rs.getString("password"));
                
                // If the teacher has courses in the new table, show them. Otherwise "Unassigned"
                String courses = rs.getString("assigned_courses");
                if(courses == null) d.setCourse("Unassigned");
                else d.setCourse(courses);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return d;
    }

    public List<Teacher> getAllTeacher() {
        List<Teacher> list = new ArrayList<Teacher>();
        Teacher d = null;
        try {
            // FIX: This query fetches the teacher AND looks up their courses in the new table
            String sql = "SELECT t.*, GROUP_CONCAT(c.course_title SEPARATOR ', ') as assigned_courses " +
                         "FROM teacher t " +
                         "LEFT JOIN courses c ON t.id = c.teacher_id " +
                         "GROUP BY t.id " +
                         "ORDER BY t.id DESC";

            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                d = new Teacher();
                d.setId(rs.getInt("id"));
                d.setFullName(rs.getString("full_name"));
                d.setEmail(rs.getString("email"));
                d.setPassword(rs.getString("password"));
                
                // Check if any courses were found in the join
                String courses = rs.getString("assigned_courses");
                if(courses == null) d.setCourse("Unassigned");
                else d.setCourse(courses);
                
                list.add(d);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
    
    public List<String> getAllCourse() {
        List<String> list = new ArrayList<String>();
        try {
            String sql = "select course_title from courses order by id desc";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
}