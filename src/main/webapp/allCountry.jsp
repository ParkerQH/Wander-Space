<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.List, com.wander.dto.Country, com.wander.dao.CountryRepository"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="countryDAO" class="com.wander.dao.CountryRepository" scope="session" />
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

    <section class="plans" id="plans">
        <h2 class="fade-in"><fmt:message key = "AllCountry" /></h2>
        <div class="plan-cards">
            <%
            List<Country> countries = countryDAO.getAllCountries(); // 모든 나라 리스트를 가져옴
            for (Country country : countries) {
            	String countryKey = country.getCountry().replace(" ", "");
                String countryIntroKey = countryKey + "Intro"; // JSP 변수로 설정
            %>
            <div class="card fade-in">
                <span class="fi fi-<%=country.getCountryId()%>"></span>
                <!-- 각 나라의 ID로 아이콘을 표시 -->
                <h3><fmt:message key="<%=countryKey%>" /></h3>
                <!-- 나라 이름 -->
                <p><fmt:message key="<%=countryIntroKey%>" /></p>
                <!-- 나라 소개 -->
                
                <a href="allTrip.jsp?country=<%=country.getCountry()%>&language=${param.language}">
                    <button><fmt:message key = "More" /></button>
                </a>
            </div>
            <%
            }
            %>
        </div>
    </section>

    <%@include file="footer.jsp"%>

</body>
</html>
