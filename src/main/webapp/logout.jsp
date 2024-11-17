<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    // 세션에서 사용자 정보 삭제
    session.invalidate();  // 모든 세션 정보 삭제

    // 로그아웃 후 로그인 페이지로 리다이렉션
    response.sendRedirect("login.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>