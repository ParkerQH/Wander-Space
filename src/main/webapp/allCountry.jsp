<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Wander Space allTrip page</title>
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/flag-icons/6.6.6/css/flag-icons.min.css" />
<link rel="stylesheet" href="resources/css/allCountry.css">
<script src="resources/js/allCountry.js"></script>
</head>
<body>
<fmt:setLocale value="${param.language}" />
<fmt:setBundle basename="bundle.webBundle" />
    <%@include file="menu.jsp"%>
	<%@ include file="dbconn.jsp" %>
	
    <section class="plans" id="plans">
        <h2 class="fade-in"><fmt:message key = "AllCountry" /></h2>
        <div class="plan-cards">
            <%
            String sql = "SELECT * FROM country";
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
            	String countryName = rs.getString("country_name");
            	String countryKey = countryName.replace(" ", "");
            	String countryIntroKey = countryKey + "Intro";
            %>
            <div class="card fade-in">
                <span class="fi fi-<%=rs.getString("country_id")%>"></span>
                <!-- 각 나라의 ID로 아이콘을 표시 -->
                <h3><fmt:message key="<%=countryKey%>" /></h3>
                <!-- 나라 이름 -->
                <p><fmt:message key="<%=countryIntroKey%>" /></p>
                <!-- 나라 소개 -->
                
                <a href="allTrip.jsp?country=<%=rs.getString("country_name")%>&language=${param.language}">
                    <button><fmt:message key = "More" /></button>
                </a>
            </div>
            <%
            }
            if (rs!=null)
				rs.close();
			if (pstmt!=null)
				pstmt.close();
			if (conn!=null)
				conn.close();
            %>
        </div>
    </section>

    <%@include file="footer.jsp"%>

</body>
</html>
