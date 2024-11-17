<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Wander Space Homepage</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icons/6.6.6/css/flag-icons.min.css" />
<link rel="stylesheet" href="resources/css/viewTrip.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="resources/js/viewTrip.js"></script>
</head>
<body>
	<fmt:setLocale value="${param.language}" />
	<fmt:setBundle basename="bundle.webBundle" />
	<%@include file="menu.jsp"%>
	<%@ include file="dbconn.jsp"%>
	<%
	String tripId = request.getParameter("id");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "SELECT * FROM trip WHERE t_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, tripId);
	rs = pstmt.executeQuery();

	while (rs.next()) {
		String countryName = rs.getString("t_country").replace(" ", "");
		String countryIntro = countryName + "Intro";
		String tripregion = rs.getString("t_region");
		String title = rs.getString("t_title");
		String mainpicture = rs.getString("t_mainpicture");
		String content = rs.getString("t_content") != null ? rs.getString("t_content") : "";
		String backgroundImage = (rs != null && rs.getString("t_country") != null
		&& !rs.getString("t_country").isEmpty()) ? rs.getString("t_country") + ".jpg" : "homepage.jpg";
	%>
	<section class="hero fade-in"
		style="background-image: url('resources/images/Countries/<%=backgroundImage%>');">
		<h1>Welcome to <%=rs.getString("t_country")%></h1>
	</section>

	<section class="plans" id="plans" style="display: flex;">
		<%--@include file="demo.jsp" --%>
		<jsp:include page="weather.jsp">
			<jsp:param name="country" value="<%=tripregion %>" />
		</jsp:include>
		<div class="card fade-in">
			<h1><fmt:message key="<%=countryName %>" /></h1>
			<h2>- <fmt:message key="<%=tripregion %>" />
			</h2>
			<%
			String country = rs.getString("t_country");
			sql = "SELECT * FROM country WHERE country_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, country);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
			%>
			<span class="fi fi-<%=rs.getString("country_id") %>"></span>
			<%
			}
			%>
			<p><fmt:message key="<%=countryIntro %>" /></p>
		</div>
	</section>

	<section class="plans" id="plans">
		<div class="card-alt fade-in">
			<h2><%=title %></h2>
			<br>
			<div class="photo-slider">
				<div class="slider-container">
					<%
					// mainPicture가 있는 경우 첫 번째 슬라이드로 추가
					if (mainpicture != null && !mainpicture.isEmpty()) {
					%>
					<div class="slide">
						<img src="resources/images/TravelReview/<%=mainpicture %>" alt="Main Trip Picture">
					</div>
					<%
					}
					// pictures 배열의 이미지들을 슬라이드에 추가
					sql = "SELECT * FROM trip_pictures WHERE tp_trip_id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, tripId);
					rs = pstmt.executeQuery();

					while (rs.next()) {
					%>
					<div class="slide">
						<img src="resources/images/TravelReview/<%=rs.getString("tp_picture")%>" alt="Trip Picture">
					</div>
					<%
					}
					%>
				</div>
				<button class="slider-button prev" onclick="moveSlide(-1)">&#10094;</button>
				<button class="slider-button next" onclick="moveSlide(1)">&#10095;</button>
			</div>
			<br>
			<br>
			<p><%=content %></p>
		</div>
	</section>
	<%
	}
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	%>

	<%@include file="footer.jsp"%>
</body>
</html>
