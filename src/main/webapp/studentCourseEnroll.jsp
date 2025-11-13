<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.CourseDao"%>
<%@page import="com.entity.Course"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enroll in Course</title>
<%@include file="component/allcss.jsp"%>
</head>
<body class="bg-gray-50">
    <%@include file="component/navbar.jsp"%>
    
    <%-- Redirect if not logged in --%>
    <c:if test="${empty studentObj}">
        <c:redirect url="student_login.jsp"></c:redirect>
    </c:if>

    <div class="container mx-auto p-6 max-w-4xl">
        <div class="mb-4">
            <a href="index.jsp" class="inline-flex items-center text-gray-600 hover:text-brand font-medium transition">
                <i class="fa-solid fa-arrow-left mr-2"></i> Back to Dashboard
            </a>
        </div>

        <div class="flex justify-center">
            <div class="w-full max-w-lg">
                <div class="glass-card p-8">
                    <div class="text-center mb-6">
                        <i class="fa-solid fa-book-open-reader text-4xl text-brand"></i>
                        <h3 class="text-2xl font-bold text-gray-800 mt-2">Course Enrollment</h3>
                        <p class="text-gray-500 text-sm">Select a course to register.</p>
                    </div>

                    <c:if test="${not empty succMsg}">
                        <div class="bg-green-100 text-green-700 p-3 rounded mb-4 text-center border border-green-200 text-sm font-bold">${succMsg}</div>
                        <c:remove var="succMsg" scope="session" />
                    </c:if>
                    <c:if test="${not empty errorMsg}">
                        <div class="bg-red-100 text-red-700 p-3 rounded mb-4 text-center border border-red-200 text-sm font-bold">${errorMsg}</div>
                        <c:remove var="errorMsg" scope="session" />
                    </c:if>
                    
                    <form action="course_enroll" method="post" class="space-y-5">
                        <input type="hidden" name="studentID" value="${studentObj.id}">
                        
                        <div>
                            <label class="block text-sm font-bold text-gray-700 mb-1">Student Name</label> 
                            <input required type="text" class="w-full px-4 py-2 border rounded bg-gray-100 text-gray-500 cursor-not-allowed" name="fullName" value="${studentObj.fullName}" readonly>
                        </div>
                        
                        <div>
                            <label class="block text-sm font-bold text-gray-700 mb-1">Registration No</label> 
                            <input required type="text" class="w-full px-4 py-2 border rounded bg-gray-100 text-gray-500 cursor-not-allowed" name="registrationNo" value="${studentObj.regNo}" readonly>
                        </div>
                        
                        <div>
                            <label class="block text-sm font-bold text-gray-700 mb-1">Select Course</label> 
                            <select class="w-full px-4 py-2 border rounded focus:ring-2 focus:ring-brand outline-none bg-white" name="course" required>
                                <option value="">-- Choose a Course --</option>
                                <%
                                    CourseDao dao = new CourseDao(DBConnect.getConn());
                                    List<Course> list = dao.getAllCourses();
                                    for (Course c : list){
                                        // Logic to display teacher name or 'Unassigned'
                                        String teacherName = (c.getTeacherName() != null) ? c.getTeacherName() : "Unassigned";
                                %>                                          
                                    <option value="<%=c.getCourseTitle()%>">
                                        <%=c.getCourseTitle()%> (<%=c.getCourseCode()%>) &mdash; <%=teacherName%>
                                    </option>                                       
                                <% } %>
                            </select>
                        </div>

                        <button class="w-full bg-brand hover:bg-brandhover text-white font-bold py-3 rounded shadow-lg transition transform hover:-translate-y-1">Submit Enrollment</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <%@ include file="component/alljs.jsp"%>
</body>
</html>