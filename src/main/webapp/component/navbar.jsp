<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<nav class="bg-dark text-white shadow-md relative z-50 border-b-4 border-accent">
    <div class="container mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between h-20 relative">
            
            <div class="flex items-center z-10"> 
                <a href="${pageContext.request.contextPath}/index.jsp" class="text-2xl font-bold flex items-center gap-3 hover:text-accent transition">
                    <i class="fa-solid fa-graduation-cap text-3xl text-accent"></i> 
                    <span>SUST OCMS</span>
                </a>
            </div>

            <div class="hidden md:flex absolute left-1/2 transform -translate-x-1/2 gap-4">
                <c:if test="${not empty adminObj}">
                    <a href="${pageContext.request.contextPath}/admin/teacher.jsp" class="hover:text-accent px-3 py-2 rounded-md text-sm font-bold transition flex items-center gap-2 uppercase tracking-wide">
                        <i class="fa-solid fa-chalkboard-user"></i> Teachers
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/courses.jsp" class="hover:text-accent px-3 py-2 rounded-md text-sm font-bold transition flex items-center gap-2 uppercase tracking-wide">
                        <i class="fa-solid fa-book-open"></i> Courses
                    </a>
                </c:if>
            </div>

            <div class="hidden md:block z-10"> 
                <div class="ml-4 flex items-center md:ml-6">
                    
                    <c:choose>
                        <c:when test="${not empty studentObj}">
                            <div class="relative ml-3">
                                <button onclick="toggleDropdown('user-menu')" class="dropdown-btn flex items-center gap-2 bg-gray-800 hover:bg-gray-700 px-4 py-2 rounded-full text-sm border border-gray-600 transition">
                                    <i class="fa-solid fa-user text-accent"></i> ${studentObj.fullName} <i class="fa-solid fa-chevron-down text-xs"></i>
                                </button>
                                <div id="user-menu" class="dropdown-content hidden absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg py-1 text-gray-700 z-50">
                                    <a href="${pageContext.request.contextPath}/studentLogout" class="block px-4 py-2 text-sm hover:bg-gray-100">Logout</a>
                                </div>
                            </div>
                        </c:when>

                        <c:when test="${not empty teacherObj}">
                             <div class="relative ml-3">
                                <button onclick="toggleDropdown('teacher-menu')" class="dropdown-btn flex items-center gap-2 bg-gray-800 hover:bg-gray-700 px-4 py-2 rounded-full text-sm border border-gray-600 transition">
                                    <i class="fa-solid fa-chalkboard-user text-accent"></i> ${teacherObj.fullName} <i class="fa-solid fa-chevron-down text-xs"></i>
                                </button>
                                <div id="teacher-menu" class="dropdown-content hidden absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg py-1 text-gray-700 z-50">
                                    <a href="${pageContext.request.contextPath}/teacherLogout" class="block px-4 py-2 text-sm hover:bg-gray-100">Logout</a>
                                </div>
                            </div>
                        </c:when>

                        <c:when test="${not empty adminObj}">
                             <div class="relative ml-3">
                                <button onclick="toggleDropdown('admin-menu')" class="dropdown-btn flex items-center gap-2 bg-gray-800 hover:bg-gray-700 px-4 py-2 rounded-full text-sm border border-gray-600 transition">
                                    <i class="fa-solid fa-user-shield text-accent"></i> Admin <i class="fa-solid fa-chevron-down text-xs"></i>
                                </button>
                                <div id="admin-menu" class="dropdown-content hidden absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg py-1 text-gray-700 z-50">
                                    <a href="${pageContext.request.contextPath}/adminLogout" class="block px-4 py-2 text-sm hover:bg-gray-100">Logout</a>
                                </div>
                            </div>
                        </c:when>

                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/student_login.jsp" class="text-white hover:text-accent px-3 py-2 rounded-md text-sm font-medium transition mr-2">Student</a>
                            <a href="${pageContext.request.contextPath}/teacher_login.jsp" class="text-white hover:text-accent px-3 py-2 rounded-md text-sm font-medium transition mr-2">Teacher</a>
                            <a href="${pageContext.request.contextPath}/admin_login.jsp" class="text-white hover:text-accent px-3 py-2 rounded-md text-sm font-medium transition">Admin</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="-mr-2 flex md:hidden">
                <button onclick="toggleMenu()" class="inline-flex items-center justify-center p-2 rounded-md hover:text-accent focus:outline-none">
                    <i class="fa-solid fa-bars text-2xl"></i>
                </button>
            </div>
        </div>
    </div>

    <div id="mobile-menu" class="hidden md:hidden bg-gray-800 border-t border-gray-700">
        <div class="px-2 pt-2 pb-3 space-y-1 sm:px-3">
             
             <c:if test="${not empty adminObj}">
                <a href="${pageContext.request.contextPath}/admin/teacher.jsp" class="block px-3 py-2 rounded-md text-base font-medium hover:bg-gray-700 text-white">Teachers</a>
                <a href="${pageContext.request.contextPath}/admin/courses.jsp" class="block px-3 py-2 rounded-md text-base font-medium hover:bg-gray-700 text-white">Courses</a>
             </c:if>

             <c:if test="${empty studentObj and empty teacherObj and empty adminObj}">
                <a href="${pageContext.request.contextPath}/student_login.jsp" class="block px-3 py-2 rounded-md text-base font-medium hover:bg-gray-700 text-white">Student Login</a>
                <a href="${pageContext.request.contextPath}/teacher_login.jsp" class="block px-3 py-2 rounded-md text-base font-medium hover:bg-gray-700 text-white">Teacher Login</a>
                <a href="${pageContext.request.contextPath}/admin_login.jsp" class="block px-3 py-2 rounded-md text-base font-medium hover:bg-gray-700 text-white">Admin Login</a>
             </c:if>
             
             <c:if test="${not empty studentObj}">
                <a href="${pageContext.request.contextPath}/studentLogout" class="block px-3 py-2 rounded-md text-base font-medium hover:bg-gray-700 text-red-400">Logout</a>
             </c:if>
             <c:if test="${not empty teacherObj}">
                <a href="${pageContext.request.contextPath}/teacherLogout" class="block px-3 py-2 rounded-md text-base font-medium hover:bg-gray-700 text-red-400">Logout</a>
             </c:if>
             <c:if test="${not empty adminObj}">
                <a href="${pageContext.request.contextPath}/adminLogout" class="block px-3 py-2 rounded-md text-base font-medium hover:bg-gray-700 text-red-400">Logout</a>
             </c:if>
        </div>
    </div>
</nav>