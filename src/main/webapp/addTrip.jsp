<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="${param.language}">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Page</title>
<link rel="stylesheet" href="resources/css/addTrip.css">
<script src="resources/js/addTrip.js"></script>
</head>
<body>
	<fmt:setLocale value="${param.language}" />
	<fmt:setBundle basename="bundle.webBundle" />
	<%@include file="menu.jsp"%>

	<div class="container">
		<!-- About Me Section -->
		<section class="about">
			<br> <br>
			<h2><fmt:message key="AboutTrip" /></h2>
			<p><fmt:message key="HowYourTrip" /></p>
		</section>

		<!-- Skills Section -->
		<section class="mytrip">
			<h2><fmt:message key="MyTrip" /></h2>
			<form action="addTripAction.jsp" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="country"><fmt:message key="Country" />:</label> <select
						id="country" name="country" onchange="updateRegions()">
						<option value="" selected>Select a country</option>
						<option value="Korea"><fmt:message key="Korea" /></option>
						<option value="China"><fmt:message key="China" /></option>
						<option value="Japan"><fmt:message key="Japan" /></option>
						<option value="France"><fmt:message key="France" /></option>
						<option value="Italy"><fmt:message key="Italy" /></option>
						<option value="USA"><fmt:message key="USA" /></option>
						<option value="Canada"><fmt:message key="Canada" /></option>
						<option value="Germany"><fmt:message key="Germany" /></option>
						<option value="UnitedKingdom"><fmt:message key="UnitedKingdom" /></option>
						<option value="Australia"><fmt:message key="Australia" /></option>
						<option value="Spain"><fmt:message key="Spain" /></option>
						<option value="Mexico"><fmt:message key="Mexico" /></option>
						<option value="Brazil"><fmt:message key="Brazil" /></option>
						<option value="India"><fmt:message key="India" /></option>
						<option value="Egypt"><fmt:message key="Egypt" /></option>
						<option value="SouthAfrica"><fmt:message key="SouthAfrica" /></option>
						<option value="Thailand"><fmt:message key="Thailand" /></option>
						<option value="Argentina"><fmt:message key="Argentina" /></option>
						<option value="Russia"><fmt:message key="Russia" /></option>
						<option value="Turkey"><fmt:message key="Turkey" /></option>
						<option value="Switzerland"><fmt:message key="Switzerland" /></option>
						<option value="Sweden"><fmt:message key="Sweden" /></option>
						<option value="Portugal"><fmt:message key="Portugal" /></option>
						<option value="Norway"><fmt:message key="Norway" /></option>
						<option value="Netherlands"><fmt:message key="Netherlands" /></option>
						<option value="Greece"><fmt:message key="Greece" /></option>
						<option value="NewZealand"><fmt:message key="NewZealand" /></option>
						<option value="Indonesia"><fmt:message key="Indonesia" /></option>
						<option value="Malaysia"><fmt:message key="Malaysia" /></option>
					</select> <label for="country"><fmt:message key="Region" />:</label> 
					<select id="region" name="region">
						<option value="">Select a region</option>
					</select>
				</div>
				<div class="form-group">
					<label for="title"><fmt:message key="Title" />:</label> <input type="text" name="title"
						id="title">
				</div>
				<div class="form-group">
					<label for="content"><fmt:message key="Content" />:</label>
					<textarea name="content" id="content" rows="10"></textarea>
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

	<%@include file="footer.jsp"%>
</body>
</html>
