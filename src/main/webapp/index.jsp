<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard - OCMS</title>
<%@ include file="component/allcss.jsp"%>
</head>
<body class="bg-gray-50">
    <%@ include file="component/navbar.jsp"%>

    <%-- 1. REDIRECT LOGIC: Send Admin and Teacher to their own dashboards --%>
    <c:if test="${not empty adminObj}">
        <c:redirect url="admin/index.jsp"/>
    </c:if>
    
    <c:if test="${not empty teacherObj}">
        <c:redirect url="teacher/index.jsp"/>
    </c:if>

    <%-- 2. NOT LOGGED IN: Show Welcome Card --%>
    <c:if test="${empty studentObj}">
        <div class="flex flex-col items-center justify-center min-h-[80vh] text-center p-6">
            <div class="glass-card p-10 max-w-2xl w-full animate-fade-in-up">
                <h1 class="text-4xl font-extrabold text-gray-800 mb-4">Welcome to OCMS</h1>
                <p class="text-lg text-gray-600 mb-8">The modern way to manage your academic courses.</p>
                <img src="https://img.freepik.com/free-vector/university-student-cap-mortar-board-diploma_3446-334.jpg" class="mx-auto w-64 h-auto mb-6 rounded-lg" alt="education">
                <a href="student_login.jsp" class="inline-block bg-brand hover:bg-brandhover text-white font-bold py-3 px-8 rounded-full shadow-lg transition transform hover:-translate-y-1">Get Started</a>
            </div>
        </div>
    </c:if>

    <%-- 3. STUDENT LOGGED IN: Show Student Dashboard --%>
    <c:if test="${not empty studentObj}">
        <div class="container mx-auto p-6 max-w-6xl">
            <div class="mb-8">
                <h2 class="text-3xl font-bold text-gray-800">Hello, <span class="text-brand">${studentObj.fullName}</span>! 👋</h2>
                <p class="text-gray-500">What would you like to do today?</p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                <div class="glass-card p-8 flex flex-col items-center text-center hover:shadow-2xl transition duration-300 border-t-4 border-brand">
                    <div class="bg-green-100 p-4 rounded-full mb-4 text-brand">
                        <i class="fa-solid fa-book-open text-4xl"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-2">Enroll New Course</h3>
                    <p class="text-gray-500 mb-6">Browse available courses and sign up for your next class.</p>
                    <a href="studentCourseEnroll.jsp" class="w-full bg-brand hover:bg-brandhover text-white font-bold py-3 px-4 rounded-lg shadow transition">Enroll Now</a>
                </div>

                <div class="glass-card p-8 flex flex-col items-center text-center hover:shadow-2xl transition duration-300 border-t-4 border-blue-500">
                    <div class="bg-blue-100 p-4 rounded-full mb-4 text-blue-600">
                        <i class="fa-solid fa-list text-4xl"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-800 mb-2">My Courses</h3>
                    <p class="text-gray-500 mb-6">View the list of all courses you are currently enrolled in.</p>
                    <a href="viewRegistration.jsp" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-4 rounded-lg shadow transition">View List</a>
                </div>
            </div>
        </div>
    </c:if>

    <%@ include file="component/footer.jsp"%>
    <%@ include file="component/alljs.jsp"%>
</body>
</html>