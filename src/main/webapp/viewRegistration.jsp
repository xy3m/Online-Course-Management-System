<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.courseRegDAO"%>
<%@page import="com.entity.courseRegistration"%>
<%@page import="com.entity.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Courses</title>
<%@include file="component/allcss.jsp"%>
</head>
<body class="bg-gray-50">
    <%@ include file="component/navbar.jsp"%>
    
    <c:if test="${empty studentObj}"><c:redirect url="student_login.jsp"></c:redirect></c:if>

    <div class="container mx-auto p-6 max-w-5xl">
        
        <div class="mb-4">
            <a href="index.jsp" class="inline-flex items-center text-gray-600 hover:text-brand font-medium transition">
                <i class="fa-solid fa-arrow-left mr-2"></i> Back to Dashboard
            </a>
        </div>

        <div class="flex items-center gap-3 mb-6">
            <i class="fa-solid fa-list-check text-3xl text-brand"></i>
            <h2 class="text-2xl font-bold text-gray-800">My Registered Courses</h2>
        </div>

        <div class="glass-card overflow-hidden min-h-[300px]">
            <table class="min-w-full leading-normal">
                <thead>
                    <tr>
                        <th class="table-header px-5 py-3 border-b-2 border-gray-200 text-left">Code</th>
                        <th class="table-header px-5 py-3 border-b-2 border-gray-200 text-left">Course Name</th>
                        <th class="table-header px-5 py-3 border-b-2 border-gray-200 text-left">Assigned Teacher</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    Student student = (Student) session.getAttribute("studentObj");
                    if(student != null) {
                        courseRegDAO dao = new courseRegDAO(DBConnect.getConn());
                        List<courseRegistration> list = dao.getAllCourseByLoginStudent(student.getId());
                        if(list.isEmpty()) {
                    %>
                        <tr><td colspan="3" class="text-center py-10 text-gray-500">You have not enrolled in any courses yet.</td></tr>
                    <%  } else {
                            for (courseRegistration cr : list) {
                    %>
                    <tr class="hover:bg-gray-50 border-b border-gray-200 transition">
                        <td class="px-5 py-4 bg-white text-sm font-bold text-gray-700"><%=cr.getCourseCode()%></td>
                        <td class="px-5 py-4 bg-white text-sm text-gray-800"><%=cr.getCourseName()%></td>
                        <td class="px-5 py-4 bg-white text-sm text-gray-600">
                            <i class="fa-solid fa-chalkboard-user mr-1 text-brand"></i> <%=cr.getTeacherName()%>
                        </td>
                    </tr>
                    <%      }
                        }
                    } 
                    %>
                </tbody>
            </table>
        </div>
    </div>
    <%@ include file="component/alljs.jsp"%>
</body>
</html>