package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CourseDao;
import com.db.DBConnect;

@WebServlet("/updateCourse")
public class UpdateCourse extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int courseId = Integer.parseInt(req.getParameter("courseId"));
            int teacherId = Integer.parseInt(req.getParameter("teacherId"));

            CourseDao dao = new CourseDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            if (dao.updateCourseTeacher(courseId, teacherId)) {
                session.setAttribute("succMsg", "Teacher Assigned Successfully");
                resp.sendRedirect("admin/courses.jsp");
            } else {
                session.setAttribute("errorMsg", "Failed to assign");
                resp.sendRedirect("admin/courses.jsp");
            }
        } catch (Exception e) { e.printStackTrace(); }
    }
}