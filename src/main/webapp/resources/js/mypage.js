document.addEventListener('DOMContentLoaded', function() {
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

function filterTrips(country) {
    const items = document.querySelectorAll('.portfolio-item');
    items.forEach(item => {
        if (country === 'All' || item.getAttribute('data-country') === country) {
            item.style.display = 'block';
        } else {
            item.style.display = 'none';
        }
    });
}
