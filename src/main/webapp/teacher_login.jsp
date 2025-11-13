<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher Login</title>
<%@ include file="component/allcss.jsp"%>
</head>
<body class="bg-gray-100">
    <%@ include file="component/navbar.jsp"%>

    <div class="min-h-[85vh] flex items-center justify-center px-4">
        <div class="glass-card w-full max-w-md p-8 animate-fade-in-up">
            <div class="text-center mb-6">
                <i class="fa-solid fa-chalkboard-user text-4xl text-brand mb-2"></i>
                <h2 class="text-2xl font-bold text-gray-800">Teacher Login</h2>
            </div>

            <c:if test="${not empty errorMsg}">
                <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mb-4 rounded text-sm">
                    ${errorMsg}
                </div>
                <c:remove var="errorMsg" scope="session" />
            </c:if>
            <c:if test="${not empty succMsg}">
                <div class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-4 rounded text-sm">
                    ${succMsg}
                </div>
                <c:remove var="succMsg" scope="session" />
            </c:if>

            <form action="teacherLogin" method="post" class="space-y-6">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
                    <input required name="email" type="email" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-brand focus:border-transparent outline-none transition" placeholder="teacher@example.com">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                    <input required name="password" type="password" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-brand focus:border-transparent outline-none transition" placeholder="••••••••">
                </div>
                
                <button type="submit" class="w-full bg-brand hover:bg-brandhover text-white font-bold py-3 rounded-lg shadow-lg transition duration-300">Teacher Sign In</button>
            </form>
        </div>
    </div>

    <%@ include file="component/alljs.jsp"%>
</body>
</html>