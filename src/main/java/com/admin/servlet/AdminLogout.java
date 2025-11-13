package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/adminLogout")
public class AdminLogout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.removeAttribute("adminObj");
        session.invalidate(); // Destroys the session completely for security
        
        // Create a new session just to hold the success message
        HttpSession newSession = req.getSession();
        newSession.setAttribute("succMsg", "Admin Logout Successful");
        
        resp.sendRedirect("admin_login.jsp");
    }
}