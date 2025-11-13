<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Register</title>
<%@ include file="component/allcss.jsp"%>
</head>
<body class="bg-gray-100">
    <%@ include file="component/navbar.jsp"%>

    <div class="min-h-[85vh] flex items-center justify-center px-4 my-8">
        <div class="glass-card w-full max-w-md p-8">
            <div class="text-center mb-6">
                <h2 class="text-2xl font-bold text-gray-800">Create Account</h2>
                <p class="text-gray-500 text-sm">Join the student community</p>
            </div>

            <c:if test="${not empty sucMsg}">
                <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4">${sucMsg}</div>
                <c:remove var="sucMsg" scope="session"/>
            </c:if>
            <c:if test="${not empty errorMsg}">
                <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4">${errorMsg}</div>
                <c:remove var="errorMsg" scope="session" />
            </c:if>

            <form action="student_register" method="post" class="space-y-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700">Full Name</label>
                    <input required name="fullname" type="text" class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-brand focus:border-transparent outline-none">
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-gray-700">Registration No</label>
                    <input required name="regno" type="text" placeholder="e.g. 20183310XX" class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-brand focus:border-transparent outline-none">
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700">Email Address</label>
                    <input required name="email" type="email" class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-brand focus:border-transparent outline-none">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Password</label>
                    <input required name="password" type="password" class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-brand focus:border-transparent outline-none">
                </div>
                <button type="submit" class="w-full bg-brand hover:bg-brandhover text-white font-bold py-3 rounded-lg shadow-md mt-4 transition">Register</button>
            </form>
             <p class="mt-6 text-center text-sm text-gray-600">
                Already have an account? <a href="student_login.jsp" class="text-brand font-semibold hover:underline">Login</a>
            </p>
        </div>
    </div>
    <%@ include file="component/alljs.jsp"%>
</body>
</html>