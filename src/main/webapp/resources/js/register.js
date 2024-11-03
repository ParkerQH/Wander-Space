// register.js

window.onload = function() {
    var notification = document.getElementById('notification');
    if (notification && notification.innerHTML.trim() !== "") {
        notification.style.display = 'block'; // 알림창 표시
        setTimeout(function() {
            notification.style.display = 'none'; // 3초 후 알림창 숨김
        }, 3000);
    }
};

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

// 전화번호 포맷 함수
function formatPhoneNumber(phoneNumber) {
    // 숫자만 추출
    phoneNumber = phoneNumber.replace(/\D/g, '');

    if (phoneNumber.length === 10) {
        // 3-3-4 형식 (예: 010-000-0000)
        return phoneNumber.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
    } else if (phoneNumber.length === 11) {
        // 3-4-4 형식 (예: 010-0000-0000)
        return phoneNumber.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
    } else {
        // 기본적으로 포맷이 맞지 않으면 그대로 반환
        return phoneNumber;
    }
}

document.addEventListener('DOMContentLoaded', function() {
    document.querySelector('form').addEventListener('submit', function(event) {
        const passwordInput = document.getElementById('register-pass');
		const phoneInput = document.getElementById('register-phone');
		
        const passwordPattern = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_+={}|[\]\\:'\";<>?,./-]).{8,}$/;

        // 비밀번호 유효성 검사
        if (!passwordPattern.test(passwordInput.value)) {
            alert("보안을 위해 비밀번호는 영어, 숫자, 특수문자를 포함하여 8자 이상으로 작성해주세요.");
            event.preventDefault(); // 제출 이벤트 중단
        }
		
		// 전화번호 포맷 적용
		phoneInput.value = formatPhoneNumber(phoneInput.value);
    });
});
