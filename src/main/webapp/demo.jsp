<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="java.util.ArrayList, com.wander.dto.Country, com.wander.dao.CountryRepository, com.wander.dto.Trip, com.wander.dao.TripRepository" %>
<jsp:useBean id="countryDAO" class="com.wander.dao.CountryRepository" scope="session" />
<jsp:useBean id="tripDAO" class="com.wander.dao.TripRepository" scope="session" />
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Andev Web</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="resources/css/demo.css">
</head>
<body>
    <main>
    <%
		String tripId = request.getParameter("id");
    	System.out.println("Generated ID for new trip: " + tripId);
    	Trip trip1 = tripDAO.getTripById(tripId);
	%>
	<%
	TripRepository dao = TripRepository.getInstance();
	ArrayList<Trip> listOfTrips = dao.getAllTrips();
	System.out.println("저장된 글 수: " + listOfTrips.size());
	
	
	for (int i = 0; i < listOfTrips.size(); i++) {
		Trip trip = listOfTrips.get(i);
		if (trip.getId().equalsIgnoreCase(tripId)){
			System.out.println("저장된 글 수: " + trip.getId());
			System.out.println("저장된 글 수: " + trip1.getId());
		}
	}
	%>
    
        <form>
            <input type="text" id="name" autocomplete="off">
            <button>
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
        </form>
        <section class="result">

            <figure class="name">
                <figcaption>Lo1ndon</figcaption> 
                <img src="https://flagsapi.com/GB/shiny/32.png">
            </figure>

            <figure class="temperature">
                <img src="https://openweathermap.org/img/wn/10d@4x.png">
                <figcaption>
                    <span>31</span>
                    <sup>o</sup>
                </figcaption> 
            </figure>
            <p class="description">overcast clouds</p>
            <ul>
                <li>
                    <span>clouds</span>
                    <i class="fa-solid fa-cloud"></i>
                    <span id="clouds">98</span>%
                </li>
                <li>
                    <span>humidity</span>
                    <i class="fa-solid fa-droplet"></i>
                    <span id="humidity">98</span>%
                </li>
                <li>
                    <span>pressure</span>
                    <i class="fa-solid fa-gauge"></i>
                    <span id="pressure">1011</span>hPa
                </li>
            </ul>
        </section>
    </main>

    <script src="resources/js/demo.js"></script>
</body>
</html>
            