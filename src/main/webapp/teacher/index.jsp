<%@page import="com.entity.Teacher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher Dashboard</title>
<%@ include file="../component/allcss.jsp"%>
</head>
<body class="bg-gray-50">
    <%@ include file="../component/navbar.jsp"%>

    <c:if test="${empty teacherObj}">
        <c:redirect url="../teacher_login.jsp"></c:redirect>
    </c:if>

    <div class="container mx-auto p-6 max-w-5xl">
        <div class="mb-8">
            <h2 class="text-3xl font-bold text-gray-800">Hello, <span class="text-brand">${teacherObj.fullName}</span>! 👋</h2>
            <p class="text-gray-500">Select a course to view enrolled students.</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <%
            Teacher teacher = (Teacher) session.getAttribute("teacherObj");
            if (teacher != null && teacher.getCourse() != null && !teacher.getCourse().equals("Unassigned")) {
                // Split the comma-separated string into individual course names
                String[] courses = teacher.getCourse().split(",\\s*"); 
                
                for (String c : courses) {
            %>
            
            <a href="course_students.jsp?course=<%=c.trim()%>" class="block group">
                <div class="glass-card p-6 hover:shadow-xl transition duration-300 border-t-4 border-brand h-full">
                    <div class="flex justify-between items-start mb-4">
                        <div class="bg-green-100 p-3 rounded-full text-brand group-hover:bg-brand group-hover:text-white transition">
                            <i class="fa-solid fa-book-open text-xl"></i>
                        </div>
                        <span class="text-gray-400 text-sm"><i class="fa-solid fa-chevron-right"></i></span>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-2 group-hover:text-brand transition"><%=c.trim()%></h3>
                    <p class="text-gray-500 text-sm">Click to view student list</p>
                </div>
            </a>

            <% 
                }
            } else { 
            %>
                <div class="col-span-full text-center py-10 text-gray-500">
                    <i class="fa-regular fa-folder-open text-4xl mb-3"></i>
                    <p>You have not been assigned any courses yet.</p>
                </div>
            <% } %>
        </div>
    </div>
    <%@ include file="../component/alljs.jsp"%>
</body>
</html>