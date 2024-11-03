<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wander Space Homepage</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icons/6.6.6/css/flag-icons.min.css" />
    <link rel="stylesheet" href="resources/css/home.css">
</head>
<body>
    <%@include file="menu.jsp" %>

    <section class="hero fade-in">
        <h1>Welcome to Wander Space</h1>
        <p>Discover our services and offerings.</p>
        <button id="learnMoreButton" class="button-3d">Learn More</button>
    </section>

    <section class="plans" id="plans">
    <h2 class="fade-in">A Popular Destination</h2>
    <div class="plan-cards">
        <div class="card fade-in">
            <span class="fi fi-kr"></span>
            <h3>Korea</h3>
            <p>Gyeongbokgung in Seoul, Myeongdong, Hallasan and beaches in Jeju! Don't miss Korean food and Hongdae nightlife!</p>
            <a href="https://www.exemplo.com" target="_blank">
                <button>More</button>
            </a>
        </div>
        <div class="card fade-in">
            <span class="fi fi-cn"></span>
            <h3>China</h3>
            <p>Great Wall in Beijing, The Bund in Shanghai, and Zhangjiajie's natural scenery! Don't miss Chinese cuisine!</p>
            <a href="https://www.exemplo.com" target="_blank">
                <button>More</button>
            </a>
        </div>
        <div class="card fade-in">
            <span class="fi fi-jp"></span>
            <h3>Japen</h3>
            <p>Shibuya in Tokyo, Gion in Kyoto, and Dotonbori in Osaka! Don't miss Japanese cuisine!</p>
            <a href="https://www.exemplo.com" target="_blank">
                <button>More</button>
            </a>
        </div>
    </div>
</section>

    <section class="contact" id="contact">
        <h2>Contact Us</h2>
        <a href="https://www.exemplo.com" target="_blank">
            <button class="discord-button button-3d">Join Discord</button>
        </a>
    </section>

    <%@include file="footer.jsp" %>

    <script>
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
    </script>
</body>
</html>
