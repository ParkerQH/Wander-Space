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
<title>WanderSpace Register Page</title>

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

/*=============== REGISTER ===============*/
.register {
  position: relative;
  height: 100vh;
  display: grid;
  align-items: center;
}

.register__img {
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

.register__title {
  text-align: center;
  font-size: 1.75rem;
  font-weight: 500;
  margin-bottom: 2rem;
}

.register__content,
.register__box {
  display: grid;
}

.register__content {
  row-gap: 1.75rem;
  margin-bottom: 1.5rem;
}

.register__box {
  grid-template-columns: max-content 1fr;
  align-items: center;
  column-gap: 0.75rem;
  border-bottom: 2px solid hsl(0, 0%, 100%);
}

.register__icon,
.register__eye {
  font-size: 1.25rem;
}

.register__input {
  width: 100%;
  padding-block: 0.8rem;
  background: none;
  color: hsl(0, 0%, 100%);
  position: relative;
  z-index: 1;
}

.register__box-input {
  position: relative;
}

.register__label {
  position: absolute;
  left: 0;
  top: 13px;
  font-weight: 500;
  transition: top 0.3s, font-size 0.3s;
}

.register__eye {
  position: absolute;
  right: 0;
  top: 18px;
  z-index: 10;
  cursor: pointer;
}

.register__box:nth-child(2) input {
  padding-right: 1.8rem;
}

.register__button {
  width: 100%;
  padding: 1rem;
  border-radius: 0.5rem;
  background-color: hsl(0, 0%, 100%);
  font-weight: 500;
  cursor: pointer;
  margin-bottom: 2rem;
}

.register__login {
  text-align: center;
}

.register__login a {
  color: hsl(0, 0%, 100%);
  font-weight: 500;
}

.register__login a:hover {
  text-decoration: underline;
}

/* Input focus move up label */
.register__input:focus + .register__label {
  top: -12px;
  font-size: 0.813rem;
}

/* Input focus sticky top label */
.register__input:not(:placeholder-shown).register__input:not(:focus) + .register__label {
  top: -12px;
  font-size: 0.813rem;
}

/*=============== BREAKPOINTS ===============*/
/* For medium devices */
@media screen and (min-width: 576px) {
  .register {
    justify-content: center;
  }

  .container {
    width: 400px;
    padding: 4rem 3rem 3.5rem;
    border-radius: 1.5rem;
  }

  .register__title {
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
<div class="register">
    <img src="images/<%= selectedImage %>" alt="register image" class="register__img">
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
