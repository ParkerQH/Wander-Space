<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.File" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
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
	<%@ include file="dbconn.jsp" %>
	<% 
	String countryname = request.getParameter("country");
	PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "SELECT * FROM country WHERE country_name = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, countryname);
    rs = pstmt.executeQuery();
    
    while (rs.next()) {
		String countryName = countryname.replace(" ", "");
		String countryCalpital = rs.getString("capital").replace(" ", "");
		String countryIntro = countryName + "Intro";
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
        		<jsp:param name="country" value="<%= countryname %>" />
    		</jsp:include>
   		<div class="card fade-in">
    		<h1><fmt:message key="<%= countryName %>" /></h1>
    		<h2>- <fmt:message key="<%= countryCalpital %>" /></h2>
            <span class="fi fi-<%=rs.getString("country_id")%>"></span>
            <p><fmt:message key="<%=countryIntro%>" /></p>
        </div>
	</section>
	
	<%
    sql = "SELECT * FROM trip WHERE t_country = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, countryname);
    rs = pstmt.executeQuery();
    
    while (rs.next()) {
	%>
	<section class="card">
    <div class="text-content">
        <h3><%=rs.getString("t_title") %></h3>
        <p><%=rs.getString("t_content") %></p>  
        <a href="viewTrip.jsp?id=<%=rs.getString("t_id") %>&language=${param.language}"><fmt:message key = "More" /></a>
    </div>
    <div class="visual">
        <img src="resources/images/TravelReview/<%=rs.getString("t_mainpicture") %>" alt="" />
    </div>
	</section>
	<%
    }
	}
    if (rs!=null)
		rs.close();
	if (pstmt!=null)
		pstmt.close();
	%>
    <%@include file="footer.jsp" %>
</body>
</html>