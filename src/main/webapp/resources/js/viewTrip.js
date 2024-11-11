document.addEventListener('DOMContentLoaded', function() {
    const fadeInElements = document.querySelectorAll('.fade-in');
    fadeInElements.forEach(element => {
        setTimeout(() => {
            element.style.opacity = 1;
        }, 100);
    });

    const themeToggle = document.getElementById('themeToggle');
    if (localStorage.getItem('dark-mode') === 'true') {
        document.body.classList.add('dark-mode');
    }
    themeToggle.addEventListener('click', () => {
        document.body.classList.toggle('dark-mode');
        localStorage.setItem('dark-mode', document.body.classList.contains('dark-mode') ? 'true' : 'false');
    });

    let currentSlide = 0;
    const slides = document.querySelectorAll('.slider-container .slide');

    function showSlide(index) {
        if (index >= slides.length) {
            currentSlide = 0;
        } else if (index < 0) {
            currentSlide = slides.length - 1;
        } else {
            currentSlide = index;
        }
        document.querySelector('.slider-container').style.transform = `translateX(-${currentSlide * 100}%)`;
    }

    function moveSlide(step) {
        showSlide(currentSlide + step);
    }

    document.querySelector('.prev').addEventListener('click', () => moveSlide(-1));
    document.querySelector('.next').addEventListener('click', () => moveSlide(1));

    // 초기 슬라이드 설정
    showSlide(currentSlide);
});
