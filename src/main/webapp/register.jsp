<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.wander.dto.Member" %>
<%@ page import="com.wander.dao.MemberRepository" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/register.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="resources/js/register.js"></script> <!-- JS 파일 포함 -->
    <title>WanderSpace Register Page</title>

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

    // 폼이 제출될 경우
    boolean showNotification = false; // 알림창 표시 여부
    String notificationMessage = ""; // 알림 메시지

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String name = request.getParameter("register-name");
        String email = request.getParameter("register-email");
        String phone = request.getParameter("register-phone");
        String nickname = request.getParameter("register-nickname");
        String password = request.getParameter("register-pass");

        Member member = new Member(name, email, phone, nickname, password);
        MemberRepository memberRepo = MemberRepository.getInstance(); // 싱글턴 인스턴스 가져오기

        boolean isRegistered = memberRepo.registerMember(member);
        if (isRegistered) {
            response.sendRedirect("login.jsp"); // 등록 성공 시 로그인 페이지로 리다이렉트
        } else {
            showNotification = true; // 알림창 표시
            notificationMessage = "이미 존재하는 이메일입니다. 다른 이메일을 사용해주세요."; // 알림 메시지
        }
    }
%>

<!-- 알림창 -->
<div class="notification" id="notification">
    <%= notificationMessage %>
</div>

<div class="register">
    <img src="resources/images/<%= selectedImage %>" alt="register image" class="register__img">
    <form action="" class="container" method="post">
        <h1 class="register__title"><fmt:message key = "Register" /></h1>

        <div class="register__content">
            <div class="register__box">
                <i class="ri-user-line register__icon"></i>
                <div class="register__box-input">
                    <input type="text" required class="register__input" id="register-name" name="register-name" placeholder=" ">
                    <label for="register-name" class="register__label"><fmt:message key = "Name" /></label>
                </div>
            </div>

            <div class="register__box">
                <i class="ri-user-3-line register__icon"></i>
                <div class="register__box-input">
                    <input type="email" required class="register__input" id="register-email" name="register-email" placeholder=" ">
                    <label for="register-email" class="register__label"><fmt:message key = "Email" /></label>
                </div>
            </div>

            <div class="register__box">
                <i class="ri-phone-line register__icon"></i>
                <div class="register__box-input">
                    <input type="tel" required class="register__input" id="register-phone" name="register-phone" placeholder=" " pattern="^(01[016789]|070)-?[0-9]{3,4}-?[0-9]{4}$" title="Ex. 010-1234-5678 or 01012345678">
                    <label for="register-phone" class="register__label"><fmt:message key = "PhoneNumber" /></label>
                </div>
            </div>

            <div class="register__box">
                <i class="ri-account-box-line register__icon"></i>
                <div class="register__box-input">
                    <input type="text" required class="register__input" id="register-nickname" name="register-nickname" placeholder=" ">
                    <label for="register-nickname" class="register__label"><fmt:message key = "Nickname" /></label>
                </div>
            </div>

            <div class="register__box">
                <i class="ri-lock-2-line register__icon"></i>
                <div class="register__box-input">
                    <input type="password" required class="register__input" id="register-pass" name="register-pass" placeholder=" " pattern=".{8,}" title="비밀번호는 8자 이상으로 작성해주세요.">
                    <label for="register-pass" class="register__label"><fmt:message key = "Password" /></label>
                    <i class="ri-eye-off-line register__eye" id="register-eye" onclick="togglePasswordVisibility()"></i>
                </div>
            </div>
        </div>

        <button type="submit" class="register__button"><fmt:message key = "Register" /></button>

        <p class="register__login">
            <fmt:message key = "Already"/> <a href="login.jsp?language=${param.language}"><fmt:message key = "Login" /></a>
        </p>
    </form>
</div>

</body>
</html>
