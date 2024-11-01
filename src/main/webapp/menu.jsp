<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Modern Website</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icons/6.6.6/css/flag-icons.min.css" />

<style>
    @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap');

    body {
        font-family: 'Open Sans', sans-serif;
        margin: 0;
        padding: 0;
        color: #333;
        background-color: #f5f5f5;
        transition: background-color 0.5s ease, color 0.5s ease;
    }

    body.dark-mode {
        background-color: #2b2b2b;
        color: #ecf0f1;
    }

    header {
        background-color: #2c2c2c;
        padding: 10px 0;
        position: fixed;
        top: 0;
        width: 100%;
        z-index: 1000;
        border-bottom: 3px solid #00ffcc;
    }

    nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
    }

    .logo {
        font-size: 28px;
        font-weight: bold;
        color: white;
        text-decoration: none;
    }

    .nav-links {
        list-style: none;
        display: flex;
        gap: 30px;
        margin-left: auto;
        margin-right: 20px;
    }

    .nav-links li a {
        color: white;
        text-decoration: none;
        font-size: 20px;
        transition: color 0.3s;
    }

    #themeToggle {
        background: none;
        border: none;
        color: white;
        font-size: 24px;
        cursor: pointer;
    }

    .hero {
        background: url('images/home.jpg') no-repeat center center;
        background-size: cover;
        color: white;
        text-align: center;
        padding: 200px 20px 100px;
    }

    .fade-in {
        opacity: 0;
        transition: opacity 1s ease-in-out;
    }
</style>
</head>
<body>
	<header>
		<nav>
			<a href="home.jsp" class="logo">Wander Space</a>
			<ul class="nav-links">
				<li><a href="login.jsp">Login</a></li>
				<li><a href="#mypage">My Page</a></li>
			</ul>
			<button id="themeToggle">
				<i class="fas fa-adjust"></i>
			</button>
		</nav>
	</header>
</body>
</html>
