package com.admin.servlet;

import java.io.IOException;

import com.entity.Student; 

// FIX: Changed from 'jakarta' to 'javax' for Tomcat 9
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            HttpSession session = req.getSession();

            // Hardcoded Admin Credentials
            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
            	session.removeAttribute("teacherObj");
                session.removeAttribute("studentObj");
                
                session.setAttribute("adminObj", new Student()); // Placeholder object
                resp.sendRedirect("admin/index.jsp");
            } else {
                session.setAttribute("errorMsg", "Invalid Email or Password");
                resp.sendRedirect("admin_login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}