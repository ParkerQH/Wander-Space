<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, com.wander.dto.Trip, com.wander.dao.TripRepository"%>
<!DOCTYPE html>
<jsp:useBean id="tripDAO" class="com.wander.dao.TripRepository" scope="session" />
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wander Space Homepage</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icons/6.6.6/css/flag-icons.min.css" />
    <link rel="stylesheet" href="resources/css/allTrip.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=YOUR_GOOGLE_MAPS_API_KEY&callback=initMap"></script>
	<script src="resources/js/allTrip.js"></script>
</head>
<body>
    <%@include file="menu.jsp" %>

	<% 
	String country = request.getParameter("country");
	//String backgroundImage = (country != null && !country.isEmpty()) ? country.toLowerCase() + ".jpg" : "homepage.jpg";
	%>
	%>
    <section class="hero fade-in" style="background-image: url('resources/images/homepage.jpg<%--= backgroundImage --%>');">
        <h1>Welcome to <%= country %></h1>
    </section>

    <section class="plans" id="plans" style="display: flex;">
    	<%--@include file="demo.jsp" --%>
    	<%@ include file="weather.jsp"%>
	</section>
	
	<%
	TripRepository dao = TripRepository.getInstance();
	ArrayList<Trip> listOfTrips = dao.getAllTrips();
	System.out.println("도서 목록의 크기: " + listOfTrips.size());
	
	
	for (int i = 0; i < listOfTrips.size(); i++) {
		Trip trip = listOfTrips.get(i);
		 if (trip.getCountry().equalsIgnoreCase(country)) { //국가가 일치하는 경우만 출력
	%>
	<section class="card">
    <div class="text-content">
        <h3><%=trip.getTitle() %></h3>
        <p><%=trip.getContent() %></p>  
        <a href="viewTrip.jsp">More</a>
    </div>
    <div class="visual">
        <img src="resources/images/<%=trip.getMainPicture() %>" alt="" />
    </div>
	</section>
	<%
		 }
	}
	%>
    <%@include file="footer.jsp" %>
</body>
</html>
