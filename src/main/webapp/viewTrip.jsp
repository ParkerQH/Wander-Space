<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="java.util.ArrayList, com.wander.dto.Country, com.wander.dao.CountryRepository, com.wander.dto.Trip, com.wander.dao.TripRepository" %>
<jsp:useBean id="countryDAO" class="com.wander.dao.CountryRepository" scope="session" />
<jsp:useBean id="tripDAO" class="com.wander.dao.TripRepository" scope="session" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wander Space Homepage</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icons/6.6.6/css/flag-icons.min.css" />
    <link rel="stylesheet" href="resources/css/viewTrip.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="resources/js/viewTrip.js"></script>
</head>
<body>
    <%@include file="menu.jsp" %>

	<%
		String tripId = request.getParameter("id");
		Trip trip = tripDAO.getTripById(tripId);
		Country country = countryDAO.getCountryByName(trip.getCountry());
		//String backgroundImage = (country != null && !country.isEmpty()) ? country.toLowerCase() + ".jpg" : "homepage.jpg";
	%>
    <section class="hero fade-in" style="background-image: url('resources/images/homepage.jpg<%--= backgroundImage --%>');">
        <h1>Welcome to <%= trip.getCountry() %></h1>
    </section>

    <section class="plans" id="plans" style="display: flex;">
    	<%--@include file="demo.jsp" --%>
    		<jsp:include page="weather.jsp">
        		<jsp:param name="country" value="<%= trip.getRegion() %>" />
    		</jsp:include>
   		<div class="card fade-in">
    		<h1><%= trip.getCountry() %></h1>
    		<h2>- <%= trip.getRegion() %></h2>
            <span class="fi fi-<%= country.getCountryId() %>"></span>
            <p><%= country != null ? country.getIntro() : "Explore this beautiful country!" %></p>
        </div>
	</section>
	
	<%
	TripRepository dao = TripRepository.getInstance();
	ArrayList<Trip> listOfTrips = dao.getAllTrips();
	String[] pictures = trip.getPictures(); // trip 객체에서 사진 배열 가져오기
    String mainPicture = trip.getMainPicture(); // trip 객체에서 메인 사진 가져오기
	%>
	
	<section class="plans" id="plans">
   		<div class="card-alt fade-in">
    		<h2><%= trip.getTitle() %></h2>
            <%-- 사진 슬라이드 부분 --%>
        <%
            if (pictures != null && pictures.length > 0) {
        %>
            <div class="photo-slider">
                <div class="slider-container">
                    <% for (String picture : pictures) { %>
                        <div class="slide">
                            <img src="resources/images/<%=trip.getPictures() %>" alt="Trip Picture">
                        </div>
                    <% } %>
                </div>
                <button class="prev" onclick="moveSlide(-1)">&#10094;</button>
                <button class="next" onclick="moveSlide(1)">&#10095;</button>
            </div>
        <% 
            } else if (mainPicture != null && !mainPicture.isEmpty()) {
        %>
            <div class="main-picture">
                <img src="resources/images/<%=trip.getMainPicture() %>" alt="Main Trip Picture">
            </div>
        <% 
            }
        %>
            <p><%= country != null ? country.getIntro() : "Explore this beautiful country!" %></p>
        </div>
	</section>
	
    <%@include file="footer.jsp" %>
</body>
</html>
