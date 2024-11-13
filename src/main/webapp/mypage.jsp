<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="com.wander.dao.TripRepository, com.wander.dto.Trip"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
TripRepository tripRepo = TripRepository.getInstance();
ArrayList<Trip> trips = tripRepo.getAllTrips();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Page</title>
<link rel="stylesheet" href="resources/css/mypage.css">
<script src="resources/js/mypage.js"></script>
</head>

<body>
	<fmt:setLocale value="${param.language}" />
	<fmt:setBundle basename="bundle.webBundle" />
	<%@include file="menu.jsp"%>

	<div class="container">
		<!-- About Me Section -->
		<section class="about">
			<br> <br>
			<h2>About Me</h2>
			<p>Hello! I'm a passionate web developer with experience in
				creating dynamic and responsive web applications. I enjoy coding and
				am always eager to learn new technologies.</p>
		</section>

		<!-- Skills Section -->
		<section class="countrys">
			<h2><fmt:message key = "Places" /></h2>
			<div class="countrys-list">
				<div class="country" onclick="filterTrips('All')">All</div>
				<%
				HashSet<String> countries = new HashSet<>();
				for (Trip trip : trips) {
					countries.add(trip.getCountry());
				}
				for (String country : countries) {
				%>
				<div class="country" onclick="filterTrips('<%=country%>')"><fmt:message key = "<%=country%>" /></div>
				<%
				}
				%>
			</div>
		</section>

		<h2><fmt:message key = "MyTrip" /></h2>
		<a href="addTrip.jsp?language=${param.language}"><button >+<fmt:message key = "AddTrip" /></button></a>
		<!-- Portfolio Section -->
		<section class="portfolio">
			<%
			for (Trip trip : trips) {
			%>
			<div class="portfolio-item" data-country="<%=trip.getCountry()%>">
				<img src="resources/images/TravelReview/<%=trip.getMainPicture()%>"
					alt="<%=trip.getTitle()%>">
				<h3><%=trip.getTitle()%></h3>
				<p><%=trip.getContent()%></p>
				<a href="viewTrip.jsp?id=<%=trip.getId()%>&language=${param.language}"><fmt:message key="More" /></a>
			</div>
			<%
			}
			%>
		</section>

		<!-- Contact Section -->
		<section class="contact">
			<h2>Contact Me</h2>
			<p>Feel free to reach out to me via email or connect with me on
				social media!</p>
			<p>
				Email: <a href="mailto:yourname@example.com">yourname@example.com</a>
			</p>
			<p>
				LinkedIn: <a href="#">Your LinkedIn Profile</a>
			</p>
			<p>
				GitHub: <a href="#">Your GitHub Profile</a>
			</p>
		</section>
	</div>

	<%@include file="footer.jsp"%>
</body>

</html>
