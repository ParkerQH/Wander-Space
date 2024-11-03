<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/register.css">
<title>WanderSpace Register Page</title>
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
<div class="register">
    <img src="resources/images/<%= selectedImage %>" alt="register image" class="register__img">
    <form action="" class="container" method="post">
        <h1 class="register__title">Register</h1>

        <div class="register__content">
            <div class="register__box">
                <i class="ri-user-line register__icon"></i>
                <div class="register__box-input">
                    <input type="text" required class="register__input" id="register-name" placeholder=" ">
                    <label for="register-name" class="register__label">Name</label>
                </div>
            </div>

			<div class="register__box">
                <i class="ri-user-3-line register__icon"></i>
                <div class="register__box-input">
                    <input type="email" required class="register__input" id="register-email" placeholder=" ">
                    <label for="register-email" class="register__label">Email</label>
                </div>
            </div>
			
            <div class="register__box">
                <i class="ri-phone-line register__icon"></i>
                <div class="register__box-input">
                    <input type="tel" required class="register__input" id="register-phone" placeholder=" ">
                    <label for="register-phone" class="register__label">Phone Number</label>
                </div>
            </div>

            <div class="register__box">
                <i class="ri-account-box-line register__icon"></i>
                <div class="register__box-input">
                    <input type="text" required class="register__input" id="register-nickname" placeholder=" ">
                    <label for="register-nickname" class="register__label">Nickname</label>
                </div>
            </div>

            <div class="register__box">
                <i class="ri-lock-2-line register__icon"></i>
                <div class="register__box-input">
                    <input type="password" required class="register__input" id="register-pass" placeholder=" ">
                    <label for="register-pass" class="register__label">Password</label>
                    <i class="ri-eye-off-line register__eye" id="register-eye" onclick="togglePasswordVisibility()"></i>
                </div>
            </div>
        </div>

        <button type="submit" class="register__button">Register</button>

        <p class="register__login">
            Already have an account? <a href="login.jsp">Log in</a>
        </p>
    </form>
</div>

<script>
    function togglePasswordVisibility() {
        const passwordInput = document.getElementById('register-pass');
        const eyeIcon = document.getElementById('register-eye');

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
