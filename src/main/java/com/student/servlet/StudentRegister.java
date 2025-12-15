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
   // @Override
 // Inside com.student.servlet.StudentRegister.java

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String fullName = req.getParameter("fullname");
            String regNo = req.getParameter("regno");
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            Student student = new Student(fullName, regNo, email, password);
            StudentDao dao = new StudentDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            // 1. PERFORM DUPLICATE CHECK
            if (dao.checkStudentExists(email, regNo)) {
                // A. DUPLICATE EXISTS: Set a specific error message
                session.setAttribute("errorMsg", "Registration failed! Email or Registration No. is already in use.");
                resp.sendRedirect("signup.jsp");
                
            } else {
                // B. NO DUPLICATE: Proceed with registration
                boolean success = dao.register(student);

                if (success) {
                    session.setAttribute("sucMsg", "Registration successful! Please log in.");
                    resp.sendRedirect("student_login.jsp"); // Redirect to login page after success
                } else {
                    session.setAttribute("errorMsg", "Something went wrong on server (DB insertion failed).");
                    resp.sendRedirect("signup.jsp");
                }
            }
        } catch (Exception e) { 
            e.printStackTrace();
            req.getSession().setAttribute("errorMsg", "An unexpected error occurred.");
            resp.sendRedirect("signup.jsp");
        }
    }
}