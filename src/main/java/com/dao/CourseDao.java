package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.entity.Course;

public class CourseDao {
    private Connection conn;

    public CourseDao(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean addCourse(Course c) {
        boolean f = false;
        try {
            String sql = "insert into courses(department, course_code, course_title) values(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, c.getDepartment());
            ps.setString(2, c.getCourseCode());
            ps.setString(3, c.getCourseTitle());

            int i = ps.executeUpdate();
            if (i == 1) { f = true; }
        } catch (Exception e) { e.printStackTrace(); }
        return f;
    }

    public List<Course> getAllCourses() {
        List<Course> list = new ArrayList<Course>();
        Course c = null;
        try {
            // Join with teacher table to get the teacher's name if assigned
            String sql = "select c.*, t.full_name from courses c left join teacher t on c.teacher_id = t.id order by c.id desc";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Course();
                c.setId(rs.getInt("id"));
                c.setDepartment(rs.getString("department"));
                c.setCourseCode(rs.getString("course_code"));
                c.setCourseTitle(rs.getString("course_title"));
                c.setTeacherId(rs.getInt("teacher_id"));
                c.setTeacherName(rs.getString("full_name")); // Will be null if no teacher assigned
                list.add(c);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
    
    public Course getCourseById(int id) {
        Course c = null;
        try {
            String sql = "select * from courses where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Course();
                c.setId(rs.getInt("id"));
                c.setDepartment(rs.getString("department"));
                c.setCourseCode(rs.getString("course_code"));
                c.setCourseTitle(rs.getString("course_title"));
                c.setTeacherId(rs.getInt("teacher_id"));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return c;
    }

    public boolean updateCourseTeacher(int courseId, int teacherId) {
        boolean f = false;
        try {
            String sql = "update courses set teacher_id=? where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, teacherId);
            ps.setInt(2, courseId);
            int i = ps.executeUpdate();
            if (i == 1) { f = true; }
        } catch (Exception e) { e.printStackTrace(); }
        return f;
    }
    
 // ... existing methods ...

    public boolean deleteCourse(int id) {
        boolean f = false;
        try {
            // STEP 1: Get the Course Name first (We need it to delete student registrations)
            String courseName = "";
            String sqlGet = "SELECT course_title FROM courses WHERE id=?";
            PreparedStatement psGet = conn.prepareStatement(sqlGet);
            psGet.setInt(1, id);
            ResultSet rs = psGet.executeQuery();
            if (rs.next()) {
                courseName = rs.getString("course_title");
            }

            // STEP 2: Delete all student registrations for this course
            if (!courseName.isEmpty()) {
                String sqlReg = "DELETE FROM course_reg WHERE courseName=?";
                PreparedStatement psReg = conn.prepareStatement(sqlReg);
                psReg.setString(1, courseName);
                psReg.executeUpdate();
            }

            // STEP 3: Delete the actual course
            String sqlDel = "DELETE FROM courses WHERE id=?";
            PreparedStatement psDel = conn.prepareStatement(sqlDel);
            psDel.setInt(1, id);

            int i = psDel.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
}