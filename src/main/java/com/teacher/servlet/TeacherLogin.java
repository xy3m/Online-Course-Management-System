package com.teacher.servlet;

import java.io.IOException;

import com.dao.TeacherDao;
import com.db.DBConnect;
import com.entity.Teacher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/teacherLogin")
public class TeacherLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        HttpSession session = req.getSession();
        TeacherDao dao = new TeacherDao(DBConnect.getConn());
        Teacher teacher = dao.login(email, password);

        if (teacher != null) {
        	session.removeAttribute("adminObj");
            session.removeAttribute("studentObj");
            
            session.setAttribute("teacherObj", teacher);
            resp.sendRedirect("teacher/index.jsp");
        } else {
            session.setAttribute("errorMsg", "Invalid Email or Password");
            resp.sendRedirect("teacher_login.jsp");
        }
    }
}