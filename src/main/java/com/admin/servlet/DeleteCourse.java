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

@WebServlet("/deleteCourse")
public class DeleteCourse extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            CourseDao dao = new CourseDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            if (dao.deleteCourse(id)) {
                session.setAttribute("succMsg", "Course Deleted Successfully");
                resp.sendRedirect("admin/courses.jsp");
            } else {
                session.setAttribute("errorMsg", "Something went wrong on server");
                resp.sendRedirect("admin/courses.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}