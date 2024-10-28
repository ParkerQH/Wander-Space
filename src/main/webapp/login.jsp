<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--=============== REMIXICONS ===============-->
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">

<!--=============== CSS ===============-->
<link rel="stylesheet" href="./style.css">
<title>WanderSpace Login Page</title>

<style>
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap");

* {
  box-sizing: border-box;
  padding: 0;
  margin: 0;
}

body,
input,
button {
  font-size: 1rem;
  font-family: "Poppins", sans-serif;
}

body {
  color: hsl(0, 0%, 100%);
  margin: 0;
}

input,
button {
  border: none;
  outline: none;
}

a {
  text-decoration: none;
}

img {
  max-width: 100%;
  height: auto;
}

/*=============== LOGIN ===============*/
.login {
  position: relative;
  height: 100vh;
  display: grid;
  align-items: center;
}

.login__img {
  position: absolute;
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center;
}

.container {
  position: relative;
  background-color: hsla(0, 0%, 10%, 0.1);
  border: 2px solid white;
  margin-inline: 1.5rem;
  padding: 2.5rem 1.5rem;
  border-radius: 1rem;
  backdrop-filter: blur(10px);
}

.login__title {
  text-align: center;
  font-size: 1.75rem;
  font-weight: 500;
  margin-bottom: 2rem;
}

.login__content,
.login__box {
  display: grid;
}

.login__content {
  row-gap: 1.75rem;
  margin-bottom: 1.5rem;
}

.login__box {
  grid-template-columns: max-content 1fr;
  align-items: center;
  column-gap: 0.75rem;
  border-bottom: 2px solid hsl(0, 0%, 100%);
}

.login__icon,
.login__eye {
  font-size: 1.25rem;
}

.login__input {
  width: 100%;
  padding-block: 0.8rem;
  background: none;
  color: hsl(0, 0%, 100%);
  position: relative;
  z-index: 1;
}

.login__box-input {
  position: relative;
}

.login__label {
  position: absolute;
  left: 0;
  top: 13px;
  font-weight: 500;
  transition: top 0.3s, font-size 0.3s;
}

.login__eye {
  position: absolute;
  right: 0;
  top: 18px;
  z-index: 10;
  cursor: pointer;
}

.login__box:nth-child(2) input {
  padding-right: 1.8rem;
}

.login__check,
.login__check-group {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.login__check {
  margin-bottom: 1.5rem;
}

.login__check-label,
.login__forgot,
.login__register {
  font-size: 0.813rem;
}

.login__check-group {
  column-gap: 0.5rem;
}

.login__check-input {
  width: 16px;
  height: 16px;
}

.login__forgot {
  color: hsl(0, 0%, 100%);
}

.login__forgot:hover {
  text-decoration: underline;
}

.login__button {
  width: 100%;
  padding: 1rem;
  border-radius: 0.5rem;
  background-color: hsl(0, 0%, 100%);
  font-weight: 500;
  cursor: pointer;
  margin-bottom: 2rem;
}

.login__register {
  text-align: center;
  font-size: 18px;
}

.login__register a {
  color: hsl(0, 0%, 100%);
  font-weight: 500;
  margin-right: 30px;
  margin-left: 30px;
}

.login__register a:hover {
  text-decoration: underline;
}

/* Input focus move up label */
.login__input:focus + .login__label {
  top: -12px;
  font-size: 0.813rem;
}

/* Input focus sticky top label */
.login__input:not(:placeholder-shown).login__input:not(:focus) + .login__label {
  top: -12px;
  font-size: 0.813rem;
}

/*=============== BREAKPOINTS ===============*/
/* For medium devices */
@media screen and (min-width: 576px) {
  .login {
    justify-content: center;
  }

  .container {
    width: 400px;
    padding: 4rem 3rem 3.5rem;
    border-radius: 1.5rem;
  }

  .login__title {
    font-size: 2rem;
  }
}
</style>

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
    <img src="images/<%= selectedImage %>" alt="login image" class="login__img">
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
    		<a href="register.jsp">Register</a> | <a href="#">Home</a>
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
