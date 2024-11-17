<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.HashSet" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
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
    <%@include file="menu.jsp" %>
    <%@include file="dbconn.jsp" %>

    <div class="container">
        <br><br>
        <!-- Skills Section -->
        <section class="countrys">
            <h2><fmt:message key="Places" /></h2>
            <div class="countrys-list">
                <div class="country" onclick="filterTrips('All')">All</div>
                <%
                // Trip에서 국가 목록을 가져옴
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                HashSet<String> countries = new HashSet<>();
                try {
                    String sql = "SELECT DISTINCT t_country FROM trip WHERE t_email = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, loggedInUser);
                    rs = pstmt.executeQuery();
                    while (rs.next()) {
                        countries.add(rs.getString("t_country"));
                    }

                    for (String country : countries) {
                %>
                <div class="country" onclick="filterTrips('<%= country %>')"><fmt:message key="<%= country %>" /></div>
                <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                }
                %>
            </div>
        </section>

        <h2><fmt:message key="MyTrip" /></h2>
        <a href="addTrip.jsp?language=${param.language}"><button>+<fmt:message key="AddTrip" /></button></a>
        
        <!-- Portfolio Section -->
        <section class="portfolio">
            <%
            try {
                String sql = "SELECT * FROM trip WHERE t_email = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, loggedInUser);
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    String tripId = rs.getString("t_id");
                    String title = rs.getString("t_title");
                    String content = rs.getString("t_content");
                    String mainPicture = rs.getString("t_mainpicture");
                    String tripCountry = rs.getString("t_country");
            %>
            <div class="portfolio-item" data-country="<%= tripCountry %>">
                <img src="resources/images/TravelReview/<%= mainPicture %>" alt="<%= title %>">
                <h3><%= title %></h3>
                <p><%= content %></p>
                <a href="viewTrip.jsp?id=<%= tripId %>&language=${param.language}"><fmt:message key="More" /></a>
            </div>
            <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
            }
            %>
        </section>
    </div>

    <%@include file="footer.jsp" %>
</body>

</html>
