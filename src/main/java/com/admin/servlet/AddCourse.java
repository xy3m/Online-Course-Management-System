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
import com.entity.Course;

@WebServlet("/addCourse")
public class AddCourse extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String dept = req.getParameter("department");
            String code = req.getParameter("courseCode");
            String title = req.getParameter("courseTitle");

            Course c = new Course(dept, code, title, 0); // 0 means no teacher yet
            CourseDao dao = new CourseDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            if (dao.addCourse(c)) {
                session.setAttribute("succMsg", "Course Added Successfully");
                resp.sendRedirect("admin/courses.jsp");
            } else {
                session.setAttribute("errorMsg", "Server Error");
                resp.sendRedirect("admin/courses.jsp");
            }
        } catch (Exception e) { e.printStackTrace(); }
    }
}