<%@page import="com.entity.Course"%>
<%@page import="com.dao.CourseDao"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Courses</title>
<%@ include file="../component/allcss.jsp"%>
</head>
<body class="bg-gray-50">
    <%@ include file="../component/navbar.jsp"%>
    <c:if test="${empty adminObj}"><c:redirect url="../admin_login.jsp"></c:redirect></c:if>

    <div class="container mx-auto p-6 max-w-6xl">
        <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-bold text-gray-800">Manage Courses</h2>
            <a href="teacher.jsp" class="bg-white border border-gray-300 text-gray-700 px-4 py-2 rounded hover:bg-gray-50 transition">&larr; Back to Teachers</a>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-12 gap-6">
            <div class="md:col-span-4">
                <div class="glass-card p-6 sticky top-6">
                    <h3 class="text-xl font-bold text-gray-800 mb-4">Add New Course</h3>
                    <c:if test="${not empty succMsg}"><div class="text-green-600 mb-2 text-sm">${succMsg}</div><c:remove var="succMsg" scope="session"/></c:if>
                    <c:if test="${not empty errorMsg}"><div class="text-red-600 mb-2 text-sm">${errorMsg}</div><c:remove var="errorMsg" scope="session"/></c:if>

                    <form action="../addCourse" method="post" class="space-y-4">
                        <div>
                            <label class="block text-xs font-bold text-gray-500 uppercase mb-1">Department</label>
                            <input type="text" name="department" required class="w-full px-3 py-2 border rounded focus:ring-2 focus:ring-brand outline-none">
                        </div>
                        <div>
                            <label class="block text-xs font-bold text-gray-500 uppercase mb-1">Course Code</label>
                            <input type="text" name="courseCode" required class="w-full px-3 py-2 border rounded focus:ring-2 focus:ring-brand outline-none">
                        </div>
                        <div>
                            <label class="block text-xs font-bold text-gray-500 uppercase mb-1">Course Title</label>
                            <input type="text" name="courseTitle" required class="w-full px-3 py-2 border rounded focus:ring-2 focus:ring-brand outline-none">
                        </div>
                        <button class="w-full bg-brand hover:bg-brandhover text-white font-bold py-2 rounded shadow transition">Add Course</button>
                    </form>
                </div>
            </div>

            <div class="md:col-span-8">
                <div class="glass-card overflow-hidden">
                    <table class="min-w-full leading-normal">
                        <thead>
                            <tr>
                                <th class="table-header px-5 py-3 border-b-2 border-gray-200 text-left">Code</th>
                                <th class="table-header px-5 py-3 border-b-2 border-gray-200 text-left">Title</th>
                                <th class="table-header px-5 py-3 border-b-2 border-gray-200 text-left">Assigned Teacher</th>
                                <th class="table-header px-5 py-3 border-b-2 border-gray-200 text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            CourseDao dao = new CourseDao(DBConnect.getConn());
                            List<Course> list = dao.getAllCourses();
                            for(Course c : list) {
                            %>
                            <tr class="hover:bg-gray-50 border-b border-gray-200">
                                <td class="px-5 py-4 bg-white text-sm font-bold text-gray-700"><%=c.getCourseCode()%></td>
                                <td class="px-5 py-4 bg-white text-sm text-gray-600"><%=c.getCourseTitle()%></td>
                                <td class="px-5 py-4 bg-white text-sm">
                                    <% if(c.getTeacherName() != null) { %>
                                        <span class="bg-green-100 text-green-800 text-xs font-bold px-2 py-1 rounded"><%=c.getTeacherName()%></span>
                                    <% } else { %>
                                        <span class="bg-gray-100 text-gray-500 text-xs font-bold px-2 py-1 rounded">Unassigned</span>
                                    <% } %>
                                </td>
                                <td class="px-5 py-4 bg-white text-center">
                                    <a href="edit_course.jsp?id=<%=c.getId()%>" class="text-blue-600 hover:text-blue-800 font-bold text-xs">Edit / Assign</a>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../component/alljs.jsp"%>
</body>
</html>