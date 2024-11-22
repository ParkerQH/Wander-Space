<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.HashSet" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Page</title>
    <link rel="stylesheet" href="resources/css/recentlyView.css">
    <script src="resources/js/recentlyView.js"></script>
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
            <h2><fmt:message key="viewPlaces" /></h2>
            <div class="countrys-list">
                <div class="country" onclick="filterTrips('All')"><fmt:message key="All"/></div>
                <%
                // Trip에서 국가 목록을 가져옴
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                HashSet<String> countries = new HashSet<>();

                // 쿠키에서 Trip ID 목록 추출
                Cookie[] cookies = request.getCookies();
                HashSet<String> tripIds = new HashSet<>();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        // 쿠키 이름이 "recentTrip"인 경우
                        if (cookie.getName().startsWith("recentTrip")) {
                            String cookieValue = cookie.getValue();
                            // 쿠키 값을 ':'로 분리 (userEmail + ":" + tripId)
                            String[] cookieParts = cookieValue.split(":");
                            if (cookieParts.length == 2) {
                                String userEmailFromCookie = cookieParts[0];  // 이메일
                                String tripIdFromCookie = cookieParts[1];    // 여행 ID

                                // 로그인된 사용자 이메일과 동일하면 해당 여행 ID를 tripIds에 추가
                                if (userEmailFromCookie.equals(loggedInUser)) {
                                    tripIds.add(tripIdFromCookie);
                                }
                            }
                        }
                    }
                }

                if (!tripIds.isEmpty()) {
                    try {
                        // IN 절에 들어갈 ?의 수는 tripIds의 크기만큼 동적으로 설정
                        StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM trip WHERE t_id IN (");
                   		 for (int i = 0; i < tripIds.size(); i++) {
                        	sqlBuilder.append("?");
                        	if (i < tripIds.size() - 1) {
                            	sqlBuilder.append(",");
                        	}
                    	}
                    	sqlBuilder.append(") AND t_email != ?");

                        pstmt = conn.prepareStatement(sqlBuilder.toString());

                     // tripIds에 맞춰서 ?에 값을 설정
                        int paramIndex = 1;
                        for (String tripId : tripIds) {
                            pstmt.setString(paramIndex++, tripId);
                        }
                        pstmt.setString(paramIndex, loggedInUser); // 로그인한 사용자의 여행일지는 제외

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
                }
                %>
            </div>
        </section>
        
        <h2><fmt:message key="viewTrip" /></h2>
        
        <!-- Portfolio Section -->
        <section class="portfolio">
            <%
            if (!tripIds.isEmpty()) {
                try {
                    // 여행일지 검색 시 로그인된 사용자와 다른 사람이 작성한 여행만 출력
                    StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM trip WHERE t_id IN (");
                    for (int i = 0; i < tripIds.size(); i++) {
                        sqlBuilder.append("?");
                        if (i < tripIds.size() - 1) {
                            sqlBuilder.append(",");
                        }
                    }
                    sqlBuilder.append(") AND t_email != ?");

                    pstmt = conn.prepareStatement(sqlBuilder.toString());

                    // tripIds에 맞춰서 ?에 값을 설정
                    int paramIndex = 1;
                    for (String tripId : tripIds) {
                        pstmt.setString(paramIndex++, tripId);
                    }
                    pstmt.setString(paramIndex, loggedInUser); // 로그인한 사용자의 여행일지는 제외

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
    			<div class="action-container">
        			<a class="float-left" href="viewTrip.jsp?id=<%= tripId %>&language=${param.language}"><fmt:message key="More" /></a>
        			<button class="float-right" onclick="deleteCookie('<%= loggedInUser %>', '<%= tripId %>')">Delete</button>
    			</div>
    			<div style="clear: both;"></div> <!-- float 초기화 -->
			</div>
            <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                }
            } else {
            %>
            <p>최근 7일간 본 여행 후기가 없습니다.</p>
            <%
            }
            %>
        </section>
    </div>

    <%@include file="footer.jsp" %>
</body>
</html>
