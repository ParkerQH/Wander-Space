<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/login.css">
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
    <form action="" class="container" method="post">
        <h1 class="login__title">Login</h1>

        <div class="login__content">
            <div class="login__box">
                <i class="ri-user-3-line login__icon"></i>
                <div class="login__box-input">
                    <input type="email" required class="login__input" id="login-email" placeholder=" ">
                    <label for="login-email" class="login__label">Email</label>
                </div>
            </div>

            <div class="login__box">
                <i class="ri-lock-2-line login__icon"></i>
                <div class="login__box-input">
                    <input type="password" required class="login__input" id="login-pass" placeholder=" ">
                    <label for="login-pass" class="login__label">Password</label>
                    <i class="ri-eye-off-line login__eye" id="login-eye" onclick="togglePasswordVisibility()"></i>
                </div>
            </div>
        </div>

        <div class="login__check">
            <div class="login__check-group">
                <input type="checkbox" class="login__check-input" id="login-check">
                <label for="login-check" class="login__check-label">Remember me</label>
            </div>
            <a href="#" class="login__forgot">Forgot Password?</a>
        </div>

        <button type="submit" class="login__button">Login</button>

        <p class="login__register">
    		<a href="register.jsp">Register</a> | <a href="home.jsp">Home</a>
		</p>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/main.js"></script>
<script>
    function togglePasswordVisibility() {
        const passwordInput = document.getElementById('login-pass');
        const eyeIcon = document.getElementById('login-eye');

        if (passwordInput.type === "password") {
            passwordInput.type = "text";  // 비밀번호를 보이게 설정
            eyeIcon.classList.remove("ri-eye-off-line"); // 눈 아이콘 변경
            eyeIcon.classList.add("ri-eye-line"); // 열린 눈 아이콘 추가
        } else {
            passwordInput.type = "password"; // 비밀번호를 숨김
            eyeIcon.classList.remove("ri-eye-line"); // 열린 눈 아이콘 제거
            eyeIcon.classList.add("ri-eye-off-line"); // 닫힌 눈 아이콘 추가
        }
    }
</script>

</body>
</html>
