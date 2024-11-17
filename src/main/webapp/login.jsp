<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %> <!-- Include the DB connection file -->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/login.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="resources/js/login.js"></script>
<title>WanderSpace Login Page</title>
</head>
<body>
<fmt:setLocale value="${param.language}" />
<fmt:setBundle basename="bundle.webBundle" />
<%
    // 이미지 개수
    int totalImages = 10;

    // 이미지 파일 이름 배열 생성
    String[] images = new String[totalImages];
    for (int i = 1; i <= totalImages; i++) {
        images[i - 1] = i + ".jpg";  // "1.jpg", "2.jpg", ..., "10.jpg"
    }

    // 랜덤으로 이미지 선택
    int randomIndex = (int) (Math.random() * images.length);
    String selectedImage = images[randomIndex];
%>
<div class="login">
    <img src="resources/images/<%= selectedImage %>" alt="login image" class="login__img">
    <form action="login.jsp" class="container" method="post">
        <h1 class="login__title">Login</h1>

        <div class="login__content">
            <div class="login__box">
                <i class="ri-user-3-line login__icon"></i>
                <div class="login__box-input">
                    <input type="email" name="email" required class="login__input" id="login-email" placeholder=" " />
                    <label for="login-email" class="login__label"><fmt:message key="Email" /></label>
                </div>
            </div>

            <div class="login__box">
                <i class="ri-lock-2-line login__icon"></i>
                <div class="login__box-input">
                    <input type="password" name="password" required class="login__input" id="login-pass" placeholder=" " />
                    <label for="login-pass" class="login__label"><fmt:message key="Password" /></label>
                    <i class="ri-eye-off-line login__eye" id="login-eye" onclick="togglePasswordVisibility()"></i>
                </div>
            </div>
            
            <!-- 오류 메시지 출력 위치 -->
            <div class="error-message" id="error-message"></div>
        </div>

        <button type="submit" class="login__button"><fmt:message key="Login" /></button>

        <p class="login__register">
            <a href="register.jsp?language=${param.language}"><fmt:message key="Register" /></a> | <a href="home.jsp?language=${param.language}"><fmt:message key="Home" /></a>
        </p>

        <%
		    // 세션 유효 시간을 3분(180초)으로 설정
        	session.setMaxInactiveInterval(3*60);
            // 폼 제출 후 로그인 검증 수행
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            boolean isValid = false; // 기본값을 false로 설정

            if (email != null && password != null) {
                // SQL 쿼리로 로그인 검증
                String query = "SELECT u_password FROM users WHERE u_email = ?";
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                
                try {
                    pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, email);
                    rs = pstmt.executeQuery();
                    
                    if (rs.next()) {
                        String dbPassword = rs.getString("u_password");
                        // 비밀번호가 일치하면 로그인 성공
                        if (password.equals(dbPassword)) {
                            isValid = true;
                        }
                    }
                    
                    if (isValid) {
                    	session.setAttribute("loggedInUser", email);
        %>
                        <script>
                            window.location.href = "home.jsp?language=${param.language}";  // 로그인 성공 후 리다이렉션
                        </script>
        <%
                    } else {
        %>
                        <script>
                            document.getElementById('error-message').innerText = "잘못된 이메일 또는 비밀번호입니다.";
                            document.getElementById('error-message').style.display = "block"; // 오류 메시지 표시
                        </script>
        <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </form>
</div>

</body>
</html>
