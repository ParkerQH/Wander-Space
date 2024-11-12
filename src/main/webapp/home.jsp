<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
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
<fmt:setLocale value="${param.language}"/>
<fmt:setBundle basename="bundle.webBundle" />
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
            <h3><fmt:message key = "Korea" /></h3>
            <p><fmt:message key = "KoreaIntro" /></p>
            <a href="allTrip.jsp?country=Korea&language=${param.language}">
                <button>More</button>
            </a>
        </div>
        <div class="card fade-in">
            <span class="fi fi-cn"></span>
            <h3><fmt:message key = "China" /></h3>
            <p><fmt:message key = "ChinaIntro" /></p>
            <a href="allTrip.jsp?country=China&language=${param.language}">
                <button>More</button>
            </a>
        </div>
        <div class="card fade-in">
            <span class="fi fi-jp"></span>
            <h3><fmt:message key = "Japan" /></h3>
            <p><fmt:message key = "JapanIntro" /></p>
            <a href="allTrip.jsp?country=Japan&language=${param.language}">
                <button>More</button>
            </a>
        </div>
    </div>
    <a href="allCountry.jsp?language=${param.language}">
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
