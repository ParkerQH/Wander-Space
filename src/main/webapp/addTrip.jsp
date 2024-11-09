<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Page</title>
<link rel="stylesheet" href="resources/css/addTrip.css">
<script src="resources/js/addTrip.js"></script>
</head>

<body>
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
			<form action="#" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="country">Country:</label> 
					<select  id="country" name="country" onchange="updateRegions()">
						<option value="" selected>Select a country</option>
						<option value="Korea">Korea</option>
						<option value="China">China</option>
						<option value="Japan">Japan</option>
					</select> 
					<label for="country">Region:</label>
					<select id="region" name="region">
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
			</form>

		</section>
	</div>

	<%@include file="footer.jsp"%>
</body>
</html>
