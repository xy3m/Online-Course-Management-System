<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.courseRegDAO"%>
<%@page import="com.entity.courseRegistration"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student List</title>
<%@ include file="../component/allcss.jsp"%>
</head>
<body class="bg-gray-50">
    <%@ include file="../component/navbar.jsp"%>

    <c:if test="${empty teacherObj}">
        <c:redirect url="../teacher_login.jsp"></c:redirect>
    </c:if>

    <%
        String courseName = request.getParameter("course");
    %>

    <div class="container mx-auto p-6 max-w-6xl">
        <div class="flex items-center justify-between mb-6">
            <div>
                <a href="index.jsp" class="text-gray-500 hover:text-brand font-medium text-sm mb-2 inline-block">
                    <i class="fa-solid fa-arrow-left mr-1"></i> Back to Dashboard
                </a>
                <h2 class="text-2xl font-bold text-gray-800">
                    Students in <span class="text-brand"><%=courseName%></span>
                </h2>
            </div>
        </div>

        <div class="glass-card overflow-hidden min-h-[300px]">
            <table class="min-w-full leading-normal">
                <thead>
                    <tr>
                        <th class="table-header px-5 py-3 border-b-2 border-gray-200 text-left">Student Name</th>
                        <th class="table-header px-5 py-3 border-b-2 border-gray-200 text-left">Registration No</th>
                        <th class="table-header px-5 py-3 border-b-2 border-gray-200 text-center">Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    if(courseName != null){
                        courseRegDAO dao = new courseRegDAO(DBConnect.getConn());
                        // We query for the SINGLE course name clicked by the user
                        List<courseRegistration> list = dao.getAllStudentByCourseName(courseName);
                        
                        if(list.isEmpty()) {
                    %>
                        <tr><td colspan="3" class="text-center py-10 text-gray-500">No students enrolled in this course yet.</td></tr>
                    <%  } else {
                            for (courseRegistration cr : list) {
                    %>
                    <tr class="hover:bg-gray-50 transition border-b border-gray-200">
                        <td class="px-5 py-4 bg-white text-sm font-bold text-gray-700"><%=cr.getFullName()%></td>
                        <td class="px-5 py-4 bg-white text-sm text-gray-600"><%=cr.getRegNO()%></td>
                        <td class="px-5 py-4 bg-white text-center">
                            <span class="bg-green-100 text-green-800 text-xs font-bold px-3 py-1 rounded-full">Enrolled</span>
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
    <%@ include file="../component/alljs.jsp"%>
</body>
</html>