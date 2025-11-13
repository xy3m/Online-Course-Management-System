<%@page import="com.entity.Teacher"%>
<%@page import="com.dao.TeacherDao"%>
<%@page import="com.entity.Course"%>
<%@page import="com.dao.CourseDao"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Course</title>
<%@ include file="../component/allcss.jsp"%>
</head>
<body class="bg-gray-50">
    <%@ include file="../component/navbar.jsp"%>
    <c:if test="${empty adminObj}"><c:redirect url="../admin_login.jsp"></c:redirect></c:if>

    <div class="container mx-auto p-6 max-w-md">
        <div class="glass-card p-8 mt-10">
            <h3 class="text-2xl font-bold text-gray-800 mb-6 text-center">Assign Teacher</h3>
            
            <%
            int id = Integer.parseInt(request.getParameter("id"));
            CourseDao dao = new CourseDao(DBConnect.getConn());
            Course c = dao.getCourseById(id);
            %>

            <form action="../updateCourse" method="post" class="space-y-6">
                <input type="hidden" name="courseId" value="<%=id%>">
                
                <div>
                    <label class="block text-sm font-bold text-gray-700 mb-2">Course Title</label>
                    <input type="text" value="<%=c.getCourseTitle()%>" readonly class="w-full px-4 py-2 border rounded bg-gray-100 text-gray-500">
                </div>

                <div>
                    <label class="block text-sm font-bold text-gray-700 mb-2">Select Teacher</label>
                    <select name="teacherId" class="w-full px-4 py-2 border rounded bg-white focus:ring-2 focus:ring-brand">
                        <option value="0">-- Unassigned --</option>
                        <%
                        TeacherDao tDao = new TeacherDao(DBConnect.getConn());
                        List<Teacher> tList = tDao.getAllTeacher();
                        for(Teacher t : tList) {
                        %>
                        <option value="<%=t.getId()%>" <%= c.getTeacherId() == t.getId() ? "selected" : "" %>>
                            <%=t.getFullName()%>
                        </option>
                        <% } %>
                    </select>
                </div>

                <button class="w-full bg-brand hover:bg-brandhover text-white font-bold py-3 rounded shadow transition">Update Assignment</button>
            </form>
        </div>
    </div>
    <%@ include file="../component/alljs.jsp"%>
</body>
</html>