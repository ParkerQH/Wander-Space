<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Modern Website</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icons/6.6.6/css/flag-icons.min.css" />
<link rel="stylesheet" href="resources/css/menu.css">
</head>
<body>
<fmt:setLocale value='<%=request.getParameter("language") %>'/>
<fmt:bundle basename="bundle.webBundle"/>
	<header>
		<nav>
			<a href="home.jsp" class="logo">Wander Space</a>
			<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
			<ul class="nav-links">
				<li><a href="login.jsp">Login</a></li>
				<li><a href="mypage.jsp">My Page</a></li>
			</ul>
			<button id="themeToggle">
				<i class="fas fa-adjust"></i>
			</button>
		</nav>
	</header>
</body>
</html>
