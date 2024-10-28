<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modern Website</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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

        h2 {
            color: #333; /* 기본 모드에서의 헤딩 색상 */
        }

        header {
            background-color: #2c2c2c;
            padding: 20px 0;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-bottom: 3px solid #00ffcc;
            transition: border-bottom-color 0.5s ease, background-color 0.5s ease;
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
        }

        .nav-links {
            list-style: none;
            display: flex;
            justify-content: flex-start;
            gap: 30px;
        }

        .nav-links li a {
            color: white;
            text-decoration: none;
            font-size: 20px;
            transition: color 0.3s, transform 0.3s;
        }

        .hero {
            background: linear-gradient(to right, #2c2c2c, #1a1a1a);
            color: white;
            text-align: center;
            padding: 150px 20px;
            animation: fadeIn 1.5s ease-in-out;
        }

        .button-3d {
            background-color: #2c2c2c;
            color: white;
            border: none;
            padding: 15px 30px;
            font-size: 18px;
            border-radius: 30px;
            transition: transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            position: relative; /* 추가된 부분 */
            z-index: 1; /* 추가된 부분 */
        }

        .button-3d:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.25);
        }

        .button-3d::before { /* 추가된 부분 */
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(255, 255, 255, 0.1); /* 투명한 흰색 효과 */
            border-radius: 30px; /* 버튼의 테두리와 동일하게 */
            opacity: 0; /* 초기 상태에서 보이지 않게 설정 */
            transition: opacity 0.3s; /* 부드럽게 나타나게 설정 */
            z-index: -1; /* 버튼보다 뒤에 위치 */
        }

        .button-3d:hover::before { /* 버튼에 마우스를 올렸을 때의 효과 */
            opacity: 1; /* 버튼 hover 시에 배경 효과가 나타나도록 */
        }

        .plans {
            padding: 80px 20px;
            max-width: 1200px;
            margin: 0 auto;
            text-align: center;
            background-color: #f0f0f0;
            transition: background-color 0.5s ease;
        }

        .plan-cards {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
        }

        .card {
            background-color: #ecf0f1;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            width: 300px;
            position: relative;
            transition: transform 0.3s;
        }

        body.dark-mode .card {
            background-color: #444; /* 다크 모드 배경색 */
            color: #ecf0f1; /* 다크 모드 텍스트 색상 */
        }

        body.dark-mode .card h3,
        body.dark-mode .card p {
            color: #ecf0f1; /* 다크 모드에서 카드 내 텍스트 색상 */
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.25);
        }

        .contact {
            padding: 60px 20px;
            max-width: 1200px;
            margin: 0 auto;
            text-align: center;
        }

        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 20px 0;
        }

        @media (max-width: 768px) {
            .nav-links {
                flex-direction: column;
                gap: 15px;
            }

            .plan-cards {
                flex-direction: column;
                align-items: center;
            }
        }

        .fade-in {
            opacity: 0;
            transition: opacity 1s ease-in-out;
        }

        /* Toggle Switch Style */
        .toggle {
            display: block;
            margin: auto;
            position: relative;
            width: 60px;
            height: 34px;
        }

        .toggle input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .toggle-slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
            border-radius: 34px;
        }

        .toggle-slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }

        input:checked + .toggle-slider {
            background-color: #2196F3;
        }

        input:checked + .toggle-slider:before {
            transform: translateX(26px);
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }
    </style>
</head>

<body>
    <header>
        <nav>
            <div class="logo">My Website</div>
            <ul class="nav-links">
                <li><a href="#home">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
            <label class="toggle">
                <input type="checkbox" id="toggle-mode">
                <span class="toggle-slider"></span>
            </label>
        </nav>
    </header>

    <div class="hero" id="home">
        <h2>Welcome to My Modern Website</h2>
        <button class="button-3d">Get Started</button>
    </div>

    <section class="plans" id="about">
        <h2>Our Plans</h2>
        <div class="plan-cards">
            <div class="card">
                <h3>Basic Plan</h3>
                <p>Details about the basic plan.</p>
                <button class="button-3d">Select</button>
            </div>
            <div class="card">
                <h3>Pro Plan</h3>
                <p>Details about the pro plan.</p>
                <button class="button-3d">Select</button>
            </div>
            <div class="card">
                <h3>Premium Plan</h3>
                <p>Details about the premium plan.</p>
                <button class="button-3d">Select</button>
            </div>
        </div>
    </section>

    <section class="contact" id="contact">
        <h2>Contact Us</h2>
        <p>If you have any questions, feel free to reach out!</p>
        <button class="button-3d">Contact</button>
    </section>

    <footer>
        <p>&copy; 2024 My Website. All Rights Reserved.</p>
    </footer>

    <script>
        const toggleButton = document.getElementById('toggle-mode');
        const body = document.body;

        toggleButton.addEventListener('change', () => {
            body.classList.toggle('dark-mode');
        });
    </script>
</body>

</html>
