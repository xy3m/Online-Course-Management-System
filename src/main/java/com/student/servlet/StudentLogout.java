package com.student.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/studentLogout")
public class StudentLogout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.removeAttribute("studentObj");
        session.invalidate();
        
        HttpSession newSession = req.getSession();
        newSession.setAttribute("succMsg", "Student Logout Successful");
        resp.sendRedirect("student_login.jsp");
    }
}