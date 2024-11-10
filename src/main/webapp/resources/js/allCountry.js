document.addEventListener('DOMContentLoaded', function() {
	const fadeInElements = document.querySelectorAll('.fade-in');
	fadeInElements.forEach(element => {
		setTimeout(() => {
			element.style.opacity = 1;
		}, 100);
	});

	const themeToggle = document.getElementById('themeToggle');
	themeToggle.addEventListener('click', () => {
		document.body.classList.toggle('dark-mode');
	});
});