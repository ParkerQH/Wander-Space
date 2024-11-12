<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
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
			<h2>About Your Trip</h2>
			<p>How was your trip? Share where you visited and the special
				moments you experienced</p>
		</section>

		<!-- Skills Section -->
		<section class="mytrip">
			<h2>My Trip</h2>
			<form action="addTripAction.jsp" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="title">Email:</label> <input type="text" name="email"
						id="email">
				</div>
				<div class="form-group">
					<label for="country">Country:</label> 
					<select id="country" name="country" onchange="updateRegions()">
						<option value="" selected>Select a country</option>
						<option value="Korea">Korea</option>
						<option value="China">China</option>
						<option value="Japan">Japan</option>
						<option value="France">France</option>
						<option value="Italy">Italy</option>
						<option value="USA">USA</option>
						<option value="Canada">Canada</option>
						<option value="Germany">Germany</option>
						<option value="UnitedKingdom">United Kingdom</option>
						<option value="Australia">Australia</option>
						<option value="Spain">Spain</option>
						<option value="Mexico">Mexico</option>
						<option value="Brazil">Brazil</option>
						<option value="India">India</option>
						<option value="Egypt">Egypt</option>
						<option value="SouthAfrica">South Africa</option>
						<option value="Thailand">Thailand</option>
						<option value="Argentina">Argentina</option>
						<option value="Russia">Russia</option>
						<option value="Turkey">Turkey</option>
						<option value="Switzerland">Switzerland</option>
						<option value="Sweden">Sweden</option>
						<option value="Portugal">Portugal</option>
						<option value="Norway">Norway</option>
						<option value="Netherlands">Netherlands</option>
						<option value="Greece">Greece</option>
						<option value="New Zealand">New Zealand</option>
						<option value="Indonesia">Indonesia</option>
						<option value="Malaysia">Malaysia</option>
					</select> <label for="country">Region:</label> <select id="region"
						name="region">
						<option value="">Select a region</option>
					</select>
				</div>
				<div class="form-group">
					<label for="title">Title:</label> <input type="text" name="title"
						id="title">
				</div>
				<div class="form-group">
					<label for="content">Content:</label>
					<textarea name="content" id="content" rows="10"></textarea>
				</div>
				<div class="form-group">
					<label>Main Image:</label> <input type="file" name="mainpicture">
				</div>
				<div class="form-group">
					<label>Additional Images:</label> 
					<input type="file" name="pictures" multiple>
				</div>
				<div class="form-group">
					<button type="button" onclick="addImageInput()">Add Image</button>
				</div>
				<div id="additional-images">
                        <!-- Additional image inputs will be added here -->
				</div>
				<div class="form-group">
					<input type="submit" value="Submit">
				</div>
			</form>

		</section>
	</div>

	<%@include file="footer.jsp"%>
</body>
</html>
