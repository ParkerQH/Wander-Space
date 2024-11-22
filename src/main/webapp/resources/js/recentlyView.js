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

function deleteCookie(userEmail, tripId) {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = cookies[i].trim();
            // 쿠키 이름이 "recentTrip"으로 시작하는지 확인
            if (cookie.startsWith("recentTrip")) {
            	var cookieName = cookie.split('=')[0];
                var cookieValue = cookie.split('=')[1];
                // 쿠키 값이 userEmail과 tripId로 매칭되는지 확인
                if (cookieValue === userEmail + ":" + tripId) {
                    // 해당 쿠키를 삭제하기 위해 Max-Age를 0으로 설정
                    document.cookie = cookieName + "=; max-age=0; path=/;";  // path는 '/'로 지정
                    location.reload();  // 페이지 새로고침
                    break;
                }
            }
        }
    }