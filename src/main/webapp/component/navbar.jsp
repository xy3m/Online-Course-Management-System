<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<nav class="bg-brand text-white shadow-md relative z-50">
    <div class="container mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between h-16 relative">
            
            <div class="flex items-center z-10"> 
                <a href="${pageContext.request.contextPath}/index.jsp" class="text-xl font-bold flex items-center gap-2">
                    <i class="fa-solid fa-graduation-cap text-2xl"></i> OCMS
                </a>
            </div>

            <div class="hidden md:flex absolute left-1/2 transform -translate-x-1/2 gap-2">
               
                <c:if test="${not empty adminObj}">
                    <a href="${pageContext.request.contextPath}/admin/teacher.jsp" class="hover:bg-brandhover px-4 py-2 rounded-md text-sm font-medium transition flex items-center gap-2">
                        <i class="fa-solid fa-chalkboard-user"></i> Teachers
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/courses.jsp" class="hover:bg-brandhover px-4 py-2 rounded-md text-sm font-medium transition flex items-center gap-2">
                        <i class="fa-solid fa-book-open"></i> Courses
                    </a>
                </c:if>
            </div>

            <div class="hidden md:block z-10"> 
                <div class="ml-4 flex items-center md:ml-6">
                    
                    <c:choose>
                        <c:when test="${not empty studentObj}">
                            <div class="relative ml-3">
                                <button onclick="toggleDropdown('user-menu')" class="dropdown-btn flex items-center gap-2 bg-brandhover px-4 py-2 rounded-full text-sm focus:outline-none shadow-sm">
                                    <i class="fa-solid fa-user"></i> ${studentObj.fullName} <i class="fa-solid fa-chevron-down text-xs"></i>
                                </button>
                                <div id="user-menu" class="dropdown-content hidden absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg py-1 text-gray-700 ring-1 ring-black ring-opacity-5 z-50">
                                    <a href="${pageContext.request.contextPath}/studentLogout" class="block px-4 py-2 text-sm hover:bg-gray-100">Logout</a>
                                </div>
                            </div>
                        </c:when>
                        <c:when test="${not empty teacherObj}">
                             <div class="relative ml-3">
                                <button onclick="toggleDropdown('teacher-menu')" class="dropdown-btn flex items-center gap-2 bg-brandhover px-4 py-2 rounded-full text-sm focus:outline-none shadow-sm">
                                    <i class="fa-solid fa-chalkboard-user"></i> ${teacherObj.fullName} <i class="fa-solid fa-chevron-down text-xs"></i>
                                </button>
                                <div id="teacher-menu" class="dropdown-content hidden absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg py-1 text-gray-700 ring-1 ring-black ring-opacity-5 z-50">
                                    <a href="${pageContext.request.contextPath}/teacherLogout" class="block px-4 py-2 text-sm hover:bg-gray-100">Logout</a>
                                </div>
                            </div>
                        </c:when>
                        <c:when test="${not empty adminObj}">
                             <div class="relative ml-3">
                                <button onclick="toggleDropdown('admin-menu')" class="dropdown-btn flex items-center gap-2 bg-brandhover px-4 py-2 rounded-full text-sm focus:outline-none shadow-sm">
                                    <i class="fa-solid fa-user-shield"></i> Admin <i class="fa-solid fa-chevron-down text-xs"></i>
                                </button>
                                <div id="admin-menu" class="dropdown-content hidden absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg py-1 text-gray-700 ring-1 ring-black ring-opacity-5 z-50">
                                    <a href="${pageContext.request.contextPath}/adminLogout" class="block px-4 py-2 text-sm hover:bg-gray-100">Logout</a>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/student_login.jsp" class="bg-white text-brand hover:bg-gray-100 px-4 py-2 rounded-md text-sm font-bold shadow-sm mr-2 transition">Student</a>
                            <a href="${pageContext.request.contextPath}/teacher_login.jsp" class="text-white hover:bg-brandhover px-3 py-2 rounded-md text-sm font-medium transition border border-white/30 mr-2">Teacher</a>
                            <a href="${pageContext.request.contextPath}/admin_login.jsp" class="text-white hover:bg-brandhover px-3 py-2 rounded-md text-sm font-medium transition border border-white/30">Admin</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="-mr-2 flex md:hidden">
                <button onclick="toggleMenu()" class="inline-flex items-center justify-center p-2 rounded-md hover:bg-brandhover focus:outline-none">
                    <i class="fa-solid fa-bars text-2xl"></i>
                </button>
            </div>
        </div>
    </div>

    <div id="mobile-menu" class="hidden md:hidden bg-brandhover">
        <div class="px-2 pt-2 pb-3 space-y-1 sm:px-3">
           
            
            <c:if test="${not empty adminObj}">
                <a href="${pageContext.request.contextPath}/admin/teacher.jsp" class="block px-3 py-2 rounded-md text-base font-medium hover:bg-brand">Teachers</a>
                <a href="${pageContext.request.contextPath}/admin/courses.jsp" class="block px-3 py-2 rounded-md text-base font-medium hover:bg-brand">Courses</a>
                <a href="${pageContext.request.contextPath}/adminLogout" class="block px-3 py-2 rounded-md text-base font-medium hover:bg-brand">Logout</a>
            </c:if>

            <c:if test="${empty studentObj and empty teacherObj and empty adminObj}">
                <a href="${pageContext.request.contextPath}/student_login.jsp" class="block px-3 py-2 rounded-md text-base font-medium hover:bg-brand">Student</a>
                <a href="${pageContext.request.contextPath}/teacher_login.jsp" class="block px-3 py-2 rounded-md text-base font-medium hover:bg-brand">Teacher</a>
                <a href="${pageContext.request.contextPath}/admin_login.jsp" class="block px-3 py-2 rounded-md text-base font-medium hover:bg-brand">Admin</a>
             </c:if>
             
             <c:if test="${not empty studentObj}">
                <a href="${pageContext.request.contextPath}/studentLogout" class="block px-3 py-2 rounded-md text-base font-medium hover:bg-brand">Logout</a>
             </c:if>
             <c:if test="${not empty teacherObj}">
                <a href="${pageContext.request.contextPath}/teacherLogout" class="block px-3 py-2 rounded-md text-base font-medium hover:bg-brand">Logout</a>
             </c:if>
        </div>
    </div>
</nav>