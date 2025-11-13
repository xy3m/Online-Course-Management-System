package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.entity.courseRegistration;

public class courseRegDAO {
	private Connection conn;

	public courseRegDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addCourse(courseRegistration cr) {
		boolean f = false;
		try {
			String sql = "INSERT INTO course_reg (studentID, fullName, regNO, courseName) VALUES (?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cr.getStudentID());
			ps.setString(2, cr.getFullName());
			ps.setString(3, cr.getRegNO());
			ps.setString(4, cr.getCourseName());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

    // Check if student is already enrolled to prevent duplicates
    public boolean checkDoubleEnrollment(int studentID, String courseName) {
        boolean f = false;
        try {
            String sql = "select * from course_reg where studentID=? and courseName=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, studentID);
            ps.setString(2, courseName);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()) {
                f = true; // Found a match
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

	public List<courseRegistration> getAllCourseByLoginStudent(int studentID) {
		List<courseRegistration> list = new ArrayList<courseRegistration>();
		courseRegistration cr = null;
		try {
			// NEW QUERY: Joins course_reg -> courses -> teacher to get full details
			String sql = "SELECT cr.id, cr.studentID, cr.fullName, cr.regNO, cr.courseName, " +
			             "c.course_code, t.full_name AS teacher_name " +
			             "FROM course_reg cr " +
			             "JOIN courses c ON cr.courseName = c.course_title " +
			             "LEFT JOIN teacher t ON c.teacher_id = t.id " +
			             "WHERE cr.studentID=?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, studentID);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cr = new courseRegistration();
				cr.setId(rs.getInt("id"));
				cr.setStudentID(rs.getInt("studentID"));
				cr.setFullName(rs.getString("fullName"));
				cr.setRegNO(rs.getString("regNO"));
				cr.setCourseName(rs.getString("courseName"));
				
				// Set the new extra details from the JOIN
				cr.setCourseCode(rs.getString("course_code"));
				String tName = rs.getString("teacher_name");
				cr.setTeacherName(tName != null ? tName : "Unassigned");
				
				list.add(cr);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<courseRegistration> getAllStudentByCourseName(String courseName) {
		List<courseRegistration> list = new ArrayList<courseRegistration>();
		courseRegistration cr = null;
		try {
			String sql = "select * from course_reg where courseName=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, courseName);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cr = new courseRegistration();
				cr.setId(rs.getInt(1));
				cr.setStudentID(rs.getInt(2));
				cr.setFullName(rs.getString(3));
				cr.setRegNO(rs.getString(4));
				cr.setCourseName(rs.getString(5));
				list.add(cr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}