<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>쿠키 삭제</title>
</head>
<body>
    <%
        // 클라이언트로부터 받은 모든 쿠키를 가져옴
        Cookie[] cookies = request.getCookies();
    	if (cookies != null) {
        // 각 쿠키에 대해 Max-Age를 0으로 설정하여 삭제
        for (Cookie cookie : cookies) {
					System.out.println("Cookie Name: " + cookie.getName() + " | Cookie Value: " + cookie.getValue());
			}
    	}
        // 쿠키가 존재할 경우
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                // 쿠키 만료 시각을 0으로 설정하여 삭제
                cookies[i].setMaxAge(0);
                cookies[i].setPath("/"); // 경로를 지정해줍니다. 기본적으로 루트 경로로 설정
                response.addCookie(cookies[i]); // 만료된 쿠키를 클라이언트로 전송
            }
        }
    %>
    <h2>모든 쿠키가 삭제되었습니다.</h2>
    <a href="home.jsp">홈으로 돌아가기</a>
</body>
</html>
