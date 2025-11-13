package com.student.servlet;

import java.io.IOException;

import com.dao.courseRegDAO;
import com.db.DBConnect;
import com.entity.courseRegistration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/course_enroll")
public class courseRegServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int studentID = Integer.parseInt(req.getParameter("studentID"));
            String fullname = req.getParameter("fullName");
            String registrationNO = req.getParameter("registrationNo");
            String courseName = req.getParameter("course");

            courseRegistration cr = new courseRegistration(studentID, fullname, registrationNO, courseName);
            courseRegDAO dao = new courseRegDAO(DBConnect.getConn());
            HttpSession session = req.getSession();

            if (dao.addCourse(cr)) {
                session.setAttribute("succMsg", "Course Enrolled Successfully!");
                resp.sendRedirect("studentCourseEnroll.jsp");
            } else {
                session.setAttribute("errorMsg", "Something wrong on server!");
                resp.sendRedirect("studentCourseEnroll.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}