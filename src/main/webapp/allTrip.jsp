<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="java.util.ArrayList, com.wander.dto.Country, com.wander.dao.CountryRepository, com.wander.dto.Trip, com.wander.dao.TripRepository" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="resources/css/allTrip.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="resources/js/allTrip.js"></script>
</head>
<body>
<fmt:setLocale value="${param.language}" />
<fmt:setBundle basename="bundle.webBundle" />
    <%@include file="menu.jsp" %>

	<% 
	String countryname = request.getParameter("country");
	Country country = countryDAO.getCountryByName(countryname);
	String countryName = countryname.replace(" ", "");
	String countryCalpital = country.getCapital().replace(" ", "");
	String countryKey = country.getCountry().replace(" ", "");
    String countryIntroKey = countryKey + "Intro";
	//String backgroundImage = (country != null && !country.isEmpty()) ? country.toLowerCase() + ".jpg" : "homepage.jpg";
	%>
    <section class="hero fade-in" style="background-image: url('resources/images/homepage.jpg<%--= backgroundImage --%>');">
        <h1>Welcome to <fmt:message key="<%= countryname %>" /></h1>
    </section>

    <section class="plans" id="plans" style="display: flex;">
    	<%--@include file="demo.jsp" --%>
    		<jsp:include page="weather.jsp">
        		<jsp:param name="country" value="<%= countryname %>" />
    		</jsp:include>
   		<div class="card fade-in">
    		<h1><fmt:message key="<%= countryName %>" /></h1>
    		<h2>- <fmt:message key="<%= countryCalpital %>" /></h2>
            <span class="fi fi-<%= country.getCountryId() %>"></span>
            <p><fmt:message key="<%=countryIntroKey%>" /></p>
        </div>
	</section>
	
	<%
	TripRepository dao = TripRepository.getInstance();
	ArrayList<Trip> listOfTrips = dao.getAllTrips();
	
	
	for (int i = 0; i < listOfTrips.size(); i++) {
		Trip trip = listOfTrips.get(i);
		 if (trip.getCountry().equalsIgnoreCase(countryname)) { //국가가 일치하는 경우만 출력
	%>
	<section class="card">
    <div class="text-content">
        <h3><%=trip.getTitle() %></h3>
        <p><%=trip.getContent() %></p>  
        <a href="viewTrip.jsp?id=<%=trip.getId()%>&language=${param.language}"><fmt:message key = "More" /></a>
    </div>
    <div class="visual">
        <img src="resources/images/TravelReview/<%=trip.getMainPicture() %>" alt="" />
    </div>
	</section>
	<%
		 }
	}
	%>
    <%@include file="footer.jsp" %>
</body>
</html>
