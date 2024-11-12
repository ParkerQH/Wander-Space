document.addEventListener('DOMContentLoaded', function() {
    const fadeInElements = document.querySelectorAll('.fade-in');
    fadeInElements.forEach(element => {
        setTimeout(() => {
            element.style.opacity = 1;
        }, 100);
    });

    const themeToggle = document.getElementById('themeToggle');

    // 페이지 로드 시 로컬 스토리지에서 다크 모드 상태를 확인
    if (localStorage.getItem('dark-mode') === 'true') {
        document.body.classList.add('dark-mode');
    }

    themeToggle.addEventListener('click', () => {
        document.body.classList.toggle('dark-mode');

        // 다크 모드 상태를 로컬 스토리지에 저장
        if (document.body.classList.contains('dark-mode')) {
            localStorage.setItem('dark-mode', 'true');
        } else {
            localStorage.setItem('dark-mode', 'false');
        }
    });
});

