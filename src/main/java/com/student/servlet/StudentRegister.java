package com.student.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.StudentDao;
import com.db.DBConnect;
import com.entity.Student;

@WebServlet("/student_register")
public class StudentRegister extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String fullName = req.getParameter("fullname");
            String regNo = req.getParameter("regno"); // NEW INPUT
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            Student u = new Student(fullName, regNo, email, password);
            StudentDao dao = new StudentDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            boolean f = dao.register(u);

            if (f) {
                session.setAttribute("sucMsg", "Registration Successful! Please Login.");
                resp.sendRedirect("signup.jsp");
            } else {
                session.setAttribute("errorMsg", "Something went wrong on server!");
                resp.sendRedirect("signup.jsp");
            }
        } catch (Exception e) { e.printStackTrace(); }
    }
}