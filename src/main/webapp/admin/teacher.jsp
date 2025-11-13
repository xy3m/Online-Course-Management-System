<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.TeacherDao"%>
<%@page import="com.entity.Teacher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Manage Teachers</title>
<%@ include file="../component/allcss.jsp"%>
</head>
<body class="bg-gray-50">
    <%@ include file="../component/navbar.jsp"%>
    <c:if test="${empty adminObj}"><c:redirect url="../admin_login.jsp"></c:redirect></c:if>

    <div class="container mx-auto p-6 max-w-6xl">
        <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-bold text-gray-800">Manage Teachers</h2>
            <a href="courses.jsp" class="bg-white border border-gray-300 text-gray-700 px-4 py-2 rounded hover:bg-gray-50 transition">Go to Manage Courses &rarr;</a>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-12 gap-6">
            <div class="md:col-span-4">
                <div class="glass-card p-6 sticky top-6">
                    <h3 class="text-xl font-bold text-gray-800 mb-4 flex items-center gap-2">
                        <i class="fa-solid fa-user-plus text-brand"></i> Add New Teacher
                    </h3>
                    
                    <c:if test="${not empty succMsg}">
                        <div class="bg-green-100 text-green-700 p-2 rounded mb-2 text-sm text-center">${succMsg}</div>
                        <c:remove var="succMsg" scope="session" />
                    </c:if>

                    <form action="../addTeacher" method="post" class="space-y-4">
                        <div>
                            <label class="block text-xs font-bold text-gray-500 uppercase mb-1">Full Name</label>
                            <input type="text" required name="fullname" class="w-full px-3 py-2 border rounded focus:ring-2 focus:ring-brand outline-none">
                        </div>
                        <div>
                            <label class="block text-xs font-bold text-gray-500 uppercase mb-1">Email</label>
                            <input type="email" required name="email" class="w-full px-3 py-2 border rounded focus:ring-2 focus:ring-brand outline-none">
                        </div>
                        <div>
                            <label class="block text-xs font-bold text-gray-500 uppercase mb-1">Password</label>
                            <input required name="password" type="password" class="w-full px-3 py-2 border rounded focus:ring-2 focus:ring-brand outline-none">
                        </div>
                        <button type="submit" class="w-full bg-brand hover:bg-brandhover text-white font-bold py-2 rounded shadow transition">Add Teacher</button>
                    </form>
                </div>
            </div>

            <div class="md:col-span-8">
                <div class="glass-card overflow-hidden">
                    <table class="min-w-full leading-normal">
                        <thead>
                            <tr>
                                <th class="table-header px-5 py-3 border-b-2 border-gray-200 text-left">Name</th>
                                <th class="table-header px-5 py-3 border-b-2 border-gray-200 text-left">Email</th>
                                <th class="table-header px-5 py-3 border-b-2 border-gray-200 text-left">Current Course</th>
                                <th class="table-header px-5 py-3 border-b-2 border-gray-200 text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            TeacherDao dao = new TeacherDao(DBConnect.getConn());
                            List<Teacher> list = dao.getAllTeacher();
                            for(Teacher d : list){ %>
                            <tr class="hover:bg-gray-50 transition border-b border-gray-200">
                                <td class="px-5 py-4 bg-white text-sm font-bold text-gray-700"><%=d.getFullName() %></td>
                                <td class="px-5 py-4 bg-white text-sm text-gray-500"><%=d.getEmail() %></td>
                                <td class="px-5 py-4 bg-white text-sm">
                                    <span class="<%= d.getCourse().equals("Unassigned") ? "bg-gray-100 text-gray-500" : "bg-green-100 text-green-800" %> px-2 py-1 rounded text-xs font-bold">
                                        <%=d.getCourse()%>
                                    </span>
                                </td>
                                <td class="px-5 py-4 bg-white text-center">
                                    <a href="../deleteTeacher?id=<%=d.getId()%>" class="text-red-500 hover:text-red-700 transition" onclick="return confirm('Are you sure you want to delete this teacher?')">
                                        <i class="fa-solid fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                            <%} %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../component/alljs.jsp"%>
</body>
</html>