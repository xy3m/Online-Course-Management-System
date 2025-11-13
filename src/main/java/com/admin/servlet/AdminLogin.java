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

            // 1. DESTROY OLD SESSION (The "Nuclear" Option)
            // This ensures any ghost Teacher or Student data is 100% deleted.
            HttpSession oldSession = req.getSession(false);
            if (oldSession != null) {
                oldSession.invalidate();
            }

            // 2. Create a FRESH Session
            HttpSession session = req.getSession(true);

            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                session.setAttribute("adminObj", new Student()); // Reuse Student entity for Admin placeholder
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
