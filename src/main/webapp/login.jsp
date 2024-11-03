<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.wander.dao.MemberRepository" %>
<%@ page import="com.wander.dto.Member" %>
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
                    <input type="email" name="email" required class="login__input" id="login-email" placeholder=" ">
                    <label for="login-email" class="login__label">Email</label>
                </div>
            </div>

            <div class="login__box">
                <i class="ri-lock-2-line login__icon"></i>
                <div class="login__box-input">
                    <input type="password" name="password" required class="login__input" id="login-pass" placeholder=" ">
                    <label for="login-pass" class="login__label">Password</label>
                    <i class="ri-eye-off-line login__eye" id="login-eye" onclick="togglePasswordVisibility()"></i>
                </div>
            </div>
            
            <!-- 오류 메시지 출력 위치 -->
            <div class="error-message" id="error-message"></div>
        </div>

        <button type="submit" class="login__button">Login</button>

        <p class="login__register">
            <a href="register.jsp">Register</a> | <a href="home.jsp">Home</a>
        </p>

        <% 
        // 폼 제출 후 로그인 검증 수행
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean isValid = false; // 기본값을 false로 설정

        if (email != null && password != null) {
            isValid = MemberRepository.getInstance().validateLogin(email, password);
            
            if (isValid) { 
        %>
                <script>
                    window.location.href = "https://www.google.com";
                </script>
        <% 
            } else { 
        %>
                <script>
                    // 오류 메시지를 표시
                    document.getElementById('error-message').innerText = "잘못된 이메일 또는 비밀번호입니다.";
                    document.getElementById('error-message').style.display = "block"; // 오류 메시지 표시
                </script>
        <% 
            }
        }
        %>
    </form>
</div>

</body>
</html>
