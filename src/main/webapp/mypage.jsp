<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Page</title>
    <link rel="stylesheet" href="resources/css/mypage.css">

</head>

<body>
	<%@include file="menu.jsp" %>

    <div class="container">
        <!-- About Me Section -->
        <section class="about">
        <br><br>
            <h2>About Me</h2>
            <p>Hello! I'm a passionate web developer with experience in creating dynamic and responsive web applications. I enjoy coding and am always eager to learn new technologies.</p>
        </section>

        <!-- Skills Section -->
        <section class="skills">
            <h2>Country</h2>
            <div class="skills-list">
                <div class="skill-item">HTML</div>
                <div class="skill-item">CSS</div>
                <div class="skill-item">JavaScript</div>
                <div class="skill-item">React</div>
                <div class="skill-item">Node.js</div>
                <div class="skill-item">Python</div>
            </div>
        </section>

		<h2>My Work</h2>
        <!-- Portfolio Section -->
        <section class="portfolio">
            <div class="portfolio-item">
                <img src="resources/images/1.jpg" alt="Project 1">
                <h3>Project 1</h3>
                <p>Description of project 1. This project involves...</p>
                <a href="#">View Project</a>
            </div>
            <div class="portfolio-item">
                <img src="resources/images/1.jpg" alt="Project 2">
                <h3>Project 2</h3>
                <p>Description of project 2. This project involves...</p>
                <a href="#">View Project</a>
            </div>
            <div class="portfolio-item">
                <img src="resources/images/1.jpg" alt="Project 3">
                <h3>Project 3</h3>
                <p>Description of project 3. This project involves...</p>
                <a href="#">View Project</a>
            </div>
            <div class="portfolio-item">
                <img src="resources/images/1.jpg" alt="Project 3">
                <h3>Project 3</h3>
                <p>Description of project 3. This project involves...</p>
                <a href="#">View Project</a>
            </div>
            <div class="portfolio-item">
                <img src="resources/images/1.jpg" alt="Project 3">
                <h3>Project 3</h3>
                <p>Description of project 3. This project involves...</p>
                <a href="#">View Project</a>
            </div>
            <div class="portfolio-item">
                <img src="project3.jpg" alt="Project 3">
                <h3>Project 3</h3>
                <p>Description of project 3. This project involves...</p>
                <a href="#">View Project</a>
            </div>
            <!-- Add more portfolio items as needed -->
        </section>

        <!-- Contact Section -->
        <section class="contact">
            <h2>Contact Me</h2>
            <p>Feel free to reach out to me via email or connect with me on social media!</p>
            <p>Email: <a href="mailto:yourname@example.com">yourname@example.com</a></p>
            <p>LinkedIn: <a href="#">Your LinkedIn Profile</a></p>
            <p>GitHub: <a href="#">Your GitHub Profile</a></p>
        </section>
    </div>

    
</body>

</html>            