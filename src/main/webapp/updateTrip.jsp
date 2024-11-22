<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html lang="${param.language}">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Trip</title>
<link rel="stylesheet" href="resources/css/addTrip.css">
<script src="resources/js/addTrip.js"></script>
</head>
<%
    // tripId를 URL 파라미터로부터 받아옴
    String tripId = request.getParameter("id");

    // DB에서 tripId에 해당하는 여행 정보 조회
    String sql = "SELECT * FROM trip WHERE t_id = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, tripId);
    ResultSet rs = pstmt.executeQuery();

    // 여행 정보 가져오기
    String email = null;
    String country = null;
    String region = null;
    String title = null;
    String content = null;
    String mainPicture = null;
    
    if (rs.next()) {
        email = rs.getString("t_email");
        country = rs.getString("t_country");
        region = rs.getString("t_region");
        title = rs.getString("t_title");
        content = rs.getString("t_content");
        mainPicture = rs.getString("t_mainpicture");
    }

    // 해당 tripId에 해당하는 사진 조회
    sql = "SELECT * FROM trip_pictures WHERE tp_trip_id = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, tripId);
    ResultSet picturesRs = pstmt.executeQuery();
    
    List<String> tripPictures = new ArrayList<>();
    while (picturesRs.next()) {
        tripPictures.add(picturesRs.getString("tp_picture"));
    }
    
    request.setAttribute("country", country);
    request.setAttribute("region", region);
    request.setAttribute("title", title);
    request.setAttribute("content", content);
    request.setAttribute("mainPicture", mainPicture);
    request.setAttribute("tripPictures", tripPictures);
%>
<body>
    <fmt:setLocale value="${param.language}" />
    <fmt:setBundle basename="bundle.webBundle" />
    <%@ include file="menu.jsp" %>

    <div class="container">
        <section class="about">
        	<br> <br>
            <h2><fmt:message key="AboutTrip" /></h2>
            <p><fmt:message key="HowYourTrip" /></p>
        </section>

        <section class="mytrip">
            <h2><fmt:message key="MyTrip" /></h2>
            <form action="updateTripAction.jsp" method="post" enctype="multipart/form-data">
                <!-- Trip ID (hidden field) -->
                <input type="hidden" name="tripId" value="<%= tripId %>">
                
                <!-- Country and Region (not editable) -->
                <div class="form-group">
                    <label for="country"><fmt:message key="Country" />:</label>
                    <input type="text" id="country" name="country" value="<%= request.getAttribute("country") %>" disabled>
                </div>
                <div class="form-group">
                    <label for="region"><fmt:message key="Region" />:</label>
                    <input type="text" id="region" name="region" value="<%= request.getAttribute("region") %>" disabled>
                </div>

                <!-- Title and Content (editable) -->
                <div class="form-group">
                    <label for="title"><fmt:message key="Title" />:</label>
                    <input type="text" name="title" id="title" value="<%= request.getAttribute("title") %>">
                </div>
                <div class="form-group">
                    <label for="content"><fmt:message key="Content" />:</label>
                    <textarea name="content" id="content" rows="10"><%= request.getAttribute("content") %></textarea>
                </div>
                <div class="form-group">
                    <label for="existingPictures"><fmt:message key="ExistingPictures" />:</label>
                    <div id="existingPictures">
                        <c:forEach var="picture" items="${tripPictures}">
                            <div class="existing-picture">
                                <img src="resources/images/TravelReview/${picture}" alt="Trip Picture" width="250">
                                <input type="checkbox" name="deletePicture" value="${picture}"> <fmt:message key="Delete"/>
                            </div>
                        </c:forEach>
                    </div>
                </div>
				<div class="form-group">
					<label><fmt:message key="MainImage" />:</label> <input type="file" name="mainpicture">
				</div>
				<div class="form-group">
					<label><fmt:message key="AdditionalImages" />:</label> <input type="file"
						name="pictures" multiple>
				</div>
				<div class="form-group">
					<button type="button" onclick="addImageInput()"><fmt:message key="AddImage" /></button>
				</div>
				<div id="additional-images">
					<!-- Additional image inputs will be added here -->
				</div>
				<div class="form-group">
					<c:set var="submitText"><fmt:message key="Submit" /></c:set>
					<input type="submit" value="${submitText}">
				</div>
				
			</form>
        </section>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
