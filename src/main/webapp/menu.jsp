<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Modern Website</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icons/6.6.6/css/flag-icons.min.css" />
<link rel="stylesheet" href="resources/css/menu.css">
<script src="resources/js/menu.js"></script>
</head>
<body>
    <fmt:setLocale value="${param.language}" />
    <fmt:setBundle basename="bundle.webBundle" />
    <header>
        <nav>
            <a href="home.jsp?language=${param.language}" class="logo">Wander Space</a>
            <ul class="nav-links">
                <!-- 언어 선택 드롭다운을 nav-links 안에 배치 -->
                <li class="language-dropdown">
                    <a href="javascript:void(0);" class="dropdown-toggle">
                        <span class="fi fi-kr"></span> KR
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="?language=ko"><span class="fi fi-kr"></span> KR</a></li>
                        <li><a href="?language=en"><span class="fi fi-us"></span> EN</a></li>
                        <li><a href="?language=zh_CN"><span class="fi fi-cn"></span> CN</a></li>
                        <li><a href="?language=jp"><span class="fi fi-jp"></span> JP</a></li>
                    </ul>
                </li>

                <%-- 로그인 상태에 따라 Login/Logout 링크 변경 --%>
                <li>
                    <%
                        String loggedInUser = (String) session.getAttribute("loggedInUser");
                        if (loggedInUser != null) {  // 로그인 상태
                    %>
                        <a href="logout.jsp?language=${param.language}">Logout</a>
                    <%
                        } else {  // 로그인 안 된 상태
                    %>
                        <a href="login.jsp?language=${param.language}">Login</a>
                    <%
                        }
                    %>
                </li>

                <li>
                	<%
    				if (loggedInUser != null) {  // 로그인 상태
        				if (loggedInUser.equals("admin")) {  // 관리자일 경우
					%>
            		<a href="adminpage.jsp?language=${param.language}">Admin Page</a>
					<%
        				} else {  // 일반 사용자일 경우
					%>
            		<a href="mypage.jsp?language=${param.language}">My Page</a>
					<%
        				}
    				} else {  // 로그인 안 된 상태
					%>
        			<a href="login.jsp?language=${param.language}">My Page</a>
					<%
    				}
					%>
                </li>
            </ul>
            <button id="themeToggle">
                <i class="fas fa-adjust"></i>
            </button>
        </nav>
    </header>
</body>
</html>
