document.addEventListener("DOMContentLoaded", function () {
    // 페이드인 효과 초기화
    function initializeFadeInEffect() {
        const fadeInElements = document.querySelectorAll('.fade-in');
        fadeInElements.forEach((element, index) => {
            setTimeout(() => {
                element.style.opacity = 1;
            }, 100 * index);
        });
    }

    // 다크 모드 토글 초기화
    function initializeDarkMode() {
        const themeToggle = document.getElementById('themeToggle');
        const isDarkMode = localStorage.getItem('dark-mode') === 'true';

        if (isDarkMode) {
            document.body.classList.add('dark-mode');
        }

        themeToggle.addEventListener('click', () => {
            document.body.classList.toggle('dark-mode');
            localStorage.setItem('dark-mode', document.body.classList.contains('dark-mode'));
        });
    }

    // 슬라이더 초기화
    function initializeSlider() {
        let currentSlide = 0;
        const slides = document.querySelectorAll('.slider-container .slide');
        const sliderContainer = document.querySelector('.slider-container');

        function showSlide(index) {
            if (index >= slides.length) {
                currentSlide = 0;
            } else if (index < 0) {
                currentSlide = slides.length - 1;
            } else {
                currentSlide = index;
            }
            sliderContainer.style.transform = `translateX(-${currentSlide * 100}%)`;
        }

        function moveSlide(step) {
            showSlide(currentSlide + step);
        }

        document.querySelector('.prev').addEventListener('click', () => moveSlide(-1));
        document.querySelector('.next').addEventListener('click', () => moveSlide(1));

        showSlide(currentSlide);
    }

    // 여행 삭제 확인
    window.deleteTrip = function (tripId) {
        if (confirm("정말로 삭제하시겠습니까?")) {
            window.location.href = "deleteTrip.jsp?tripId=" + tripId;
        }
    };

    // 초기화 함수 호출
    initializeFadeInEffect();
    initializeDarkMode();
    initializeSlider();
});
