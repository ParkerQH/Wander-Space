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
