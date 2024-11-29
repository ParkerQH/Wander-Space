<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.File" %>
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
		String email = rs.getString("t_email");
		String countryName = rs.getString("t_country").replace(" ", "");
		String countryIntro = countryName + "Intro";
		String tripregion = rs.getString("t_region");
		String title = rs.getString("t_title");
		String mainpicture = rs.getString("t_mainpicture");
		String content = rs.getString("t_content") != null ? rs.getString("t_content") : "";
		// 이미지 경로 설정
	    String imagePath = application.getRealPath("/resources/images/Countries/") + countryName + ".jpg";
	    File imageFile = new File(imagePath);

	    // 파일이 존재하면 해당 파일 이름 사용, 존재하지 않으면 기본 이미지 사용
	    String backgroundImage = imageFile.exists() ? countryName + ".jpg" : "homepage.jpg";
	%>
	    <section class="hero fade-in" style="background-image: url('resources/images/Countries/<%= backgroundImage %>');">
	        <h1>Welcome to <%= countryName %></h1>
	    </section>

	<section class="plans" id="plans" style="display: flex;">
		<%--@include file="demo.jsp" --%>
		<jsp:include page="weather.jsp">
			<jsp:param name="country" value="<%=tripregion%>" />
		</jsp:include>
		<div class="card fade-in">
			<h1><fmt:message key="<%=countryName%>" /></h1>
			<h2>-<fmt:message key="<%=tripregion%>" /></h2>
			<%
			String country = rs.getString("t_country");
			sql = "SELECT * FROM country WHERE country_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, country);
			rs = pstmt.executeQuery();

			while (rs.next()) {
			%>
			<span class="fi fi-<%=rs.getString("country_id")%>"></span>
			<%
			}
			%>
			<p>
				<fmt:message key="<%=countryIntro%>" />
			</p>
		</div>
	</section>

	<section class="plans" id="plans">
		<div class="card-alt fade-in">
			<%
    		if (loggedInUser != null) {
        			if (loggedInUser.equals("admin")) {
			%>
            <!-- Admin은 Delete 버튼만 보이게 -->
            <div class="button-container">
                <button onclick="deleteTrip('<%= tripId %>')">Delete</button>
            </div>
			<%
        			} else if (loggedInUser.equals(email)) {  // 일반 사용자 본인일 경우
			%>
            <!-- 일반 사용자는 Update와 Delete 버튼 모두 보이게 -->
            <div class="button-container">
                <button onclick="location.href='updateTrip.jsp?id=<%= tripId %>'"><fmt:message key="Update"/></button>
                <button onclick="deleteTrip('<%= tripId %>')"><fmt:message key="Delete"/></button>
            </div>
			<%
        			}
    		}
			%>
			
			<h2><%=title%></h2>
			<br>
			<div class="photo-slider">
				<div class="slider-container">
					<%
					// mainPicture가 있는 경우 첫 번째 슬라이드로 추가
					if (mainpicture != null && !mainpicture.isEmpty()) {
					%>
					<div class="slide">
						<img src="resources/images/TravelReview/<%=mainpicture%>"
							alt="Main Trip Picture">
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
						<img
							src="resources/images/TravelReview/<%=rs.getString("tp_picture")%>"
							alt="Trip Picture">
					</div>
					<%
					}
					%>
				</div>
				<button class="slider-button prev" onclick="moveSlide(-1)">&#10094;</button>
				<button class="slider-button next" onclick="moveSlide(1)">&#10095;</button>
			</div>
			<br> <br>
			<p><%=content%></p>
		</div>
	</section>

	<%
		// 쿠키 생성 조건: 이메일과 여행 ID가 모두 존재해야 함
		if (loggedInUser != null && tripId != null && !loggedInUser.equals(email) && !loggedInUser.equals("admin")) {
			String cookieValue = loggedInUser + ":" + tripId;

			// 기존 쿠키 확인: 저장된 값이 같은 쿠키가 있는지 확인
			boolean cookieExists = false;
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				System.out.println("Stored Cookies:");
				for (Cookie cookie : cookies) {
					System.out.println("Cookie Name: " + cookie.getName() + " | Cookie Value: " + cookie.getValue());
				}
			} else {
				System.out.println("No cookies found.");
			}

			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (cookieValue.equals(cookie.getValue())) {
						cookieExists = true;
						break;
					}
				}
			}

			// 동일한 값의 쿠키가 없다면 새로운 쿠키 생성
			if (!cookieExists) {
			// 쿠키 이름을 숫자로 자동 증가시키기 위한 변수
				String cookieBaseName = "recentTrip";
				int cookieIndex = 1; // 숫자 인덱스 시작 값

				// 기존 쿠키 확인: 쿠키 이름에 숫자 부분이 있는지 확인
				if (cookies != null) {
					for (Cookie cookie : cookies) {
						try {
							if (cookie.getName().startsWith(cookieBaseName)) {
								int currentIndex = Integer.parseInt(cookie.getName().substring(cookieBaseName.length()));
								cookieIndex = Math.max(cookieIndex, currentIndex + 1); // 더 큰 숫자로 증가
							}
						} catch (NumberFormatException e) {
							// 숫자가 아닐 경우 넘어감
						}
					}
				}
		
				// 새로운 쿠키 이름 생성
				String cookieName = cookieBaseName + cookieIndex;

				// 쿠키 생성
				Cookie newCookie = new Cookie(cookieName, cookieValue);
				newCookie.setPath("/"); // 애플리케이션 전체에서 사용 가능
				newCookie.setMaxAge(7 * 24 * 60 * 60); // 7일 동안 유효

				// 쿠키 추가
				response.addCookie(newCookie);
				System.out.println("New Cookie Created: " + cookieName + " = " + cookieValue);
			} else {
				System.out.println("Cookie already exists with the value: " + cookieValue);
			}
		} else {
			System.out.println("Cannot create cookie: Missing email or trip ID.");
		}
	}

	if (rs != null)
	rs.close();
	if (pstmt != null)
	pstmt.close();
	%>

	<%@include file="footer.jsp"%>
</body>
</html>
