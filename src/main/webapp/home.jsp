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
    </section>

    <section class="plans" id="plans">
    <h2 class="fade-in">A Popular Destination</h2>
    <div class="plan-cards">
        <div class="card fade-in">
            <span class="fi fi-kr"></span>
            <h3>Korea</h3>
            <p>Gyeongbokgung in Seoul, Myeongdong, Hallasan and beaches in Jeju! Don't miss Korean food and Hongdae nightlife!</p>
            <a href="allTrip.jsp?country=Korea">
                <button>More</button>
            </a>
        </div>
        <div class="card fade-in">
            <span class="fi fi-cn"></span>
            <h3>China</h3>
            <p>Great Wall in Beijing, The Bund in Shanghai, and Zhangjiajie's natural scenery! Don't miss Chinese cuisine!</p>
            <a href="allTrip.jsp?country=China">
                <button>More</button>
            </a>
        </div>
        <div class="card fade-in">
            <span class="fi fi-jp"></span>
            <h3>Japan</h3>
            <p>Shibuya in Tokyo, Gion in Kyoto, and Dotonbori in Osaka! Don't miss Japanese cuisine!</p>
            <a href="allTrip.jsp?country=Japan">
                <button>More</button>
            </a>
        </div>
    </div>
    <a href="allCountry.jsp">
            <button class="discord-button button-3d">More</button>
    </a>
	</section>

	<section class="contact">
       	<h2>Contact Me</h2>
        <p>Email: <a href="mailto:blueskyaoa7@gmail.com">blueskyaoa7@gmail.com</a></p>
        <p>GitHub: <a href="https://github.com/ParkerQH">GitHub ParkerQH</a></p>
    </section>

    <%@include file="footer.jsp" %>
</body>
</html>
