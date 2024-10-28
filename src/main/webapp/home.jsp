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

		body.dark-mode{
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

        #themeToggle {
            background: none;
            border: none;
            color: white;
            font-size: 24px;
            cursor: pointer;
            transition: color 0.3s;
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
    </style>
</head>
<body>
    <header>
        <nav>
            <div class="logo">Wander Space</div>
            <ul class="nav-links">
                <li><a href="#plans">Plans</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
            <button id="themeToggle"><i class="fas fa-adjust"></i></button>
        </nav>
    </header>

    <section class="hero fade-in">
        <h1>Welcome to Our Website</h1>
        <p>Discover our services and offerings.</p>
        <button id="learnMoreButton" class="button-3d">Learn More</button>
    </section>

    <section class="plans" id="plans">
    <h2 class="fade-in">Our Plans</h2>
    <div class="plan-cards">
        <div class="card fade-in">
            <i class="fas fa-star"></i>
            <h3>Basic Plan</h3>
            <p>Plano Basico Teste.</p>
            <a href="https://www.exemplo.com" target="_blank">
                <button>More</button>
            </a>
        </div>
        <div class="card fade-in">
            <i class="fas fa-rocket"></i>
            <h3>Pro Plan</h3>
            <p>Plano Pro advenced.</p>
            <a href="https://www.exemplo.com" target="_blank">
                <button>More</button>
            </a>
        </div>
        <div class="card fade-in">
            <i class="fas fa-gem"></i>
            <h3>Enterprise Plan</h3>
            <p>Todos os planos juntos etc...</p>
            <a href="https://www.exemplo.com" target="_blank">
                <button>More</button>
            </a>
        </div>
    </div>
</section>

    <section class="contact" id="contact">
        <h2>Contact Us</h2>
        <a href="https://www.exemplo.com" target="_blank">
            <button class="discord-button button-3d">Join Discord</button>
        </a>
    </section>

    <footer>
        <p>© 2023 Modern Website. All rights reserved.</p>
    </footer>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const fadeInElements = document.querySelectorAll('.fade-in');
            fadeInElements.forEach(element => {
                setTimeout(() => {
                    element.style.opacity = 1;
                }, 100);
            });

            const themeToggle = document.getElementById('themeToggle');
            themeToggle.addEventListener('click', () => {
                document.body.classList.toggle('dark-mode');
            });
        });
    </script>
</body>
</html>
