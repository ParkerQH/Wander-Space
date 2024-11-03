<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wander Space Homepage</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icons/6.6.6/css/flag-icons.min.css" />
    <link rel="stylesheet" href="resources/css/home.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="resources/js/home.js"></script>
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
            <h3>Japan</h3>
            <p>Shibuya in Tokyo, Gion in Kyoto, and Dotonbori in Osaka! Don't miss Japanese cuisine!</p>
            <a href="https://www.exemplo.com" target="_blank">
                <button>More</button>
            </a>
        </div>
    </div>
	</section>

	<section class="contact">
       	<h2>Contact Me</h2>
        <p>Feel free to reach out to me via email or connect with me on social media!</p>
        <p>Email: <a href="mailto:yourname@example.com">yourname@example.com</a></p>
        <p>LinkedIn: <a href="#">Your LinkedIn Profile</a></p>
        <p>GitHub: <a href="#">Your GitHub Profile</a></p>
    </section>
    <section class="contact" id="contact">
        <h2>Contact Us</h2>
        <a href="https://www.exemplo.com" target="_blank">
            <button class="discord-button button-3d">Join Discord</button>
        </a>
    </section>

    <%@include file="footer.jsp" %>
</body>
</html>
