<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weather Information</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="resources/css/weather.css">
</head>
<body>
    <main>
        <section class="result">
            <figure class="name">
                <figcaption>Loading...</figcaption> 
                <img src="">
            </figure>

            <figure class="temperature">
                <img src="">
                <figcaption>
                    <span id="temperature">0</span>
                    <sup>°</sup>
                </figcaption> 
            </figure>
            <p class="description">Loading...</p>
            <ul>
                <li>
                    <span>Clouds</span>
                    <i class="fa-solid fa-cloud"></i>
                    <span id="clouds">0</span>%
                </li>
                <li>
                    <span>Humidity</span>
                    <i class="fa-solid fa-droplet"></i>
                    <span id="humidity">0</span>%
                </li>
                <li>
                    <span>Pressure</span>
                    <i class="fa-solid fa-gauge"></i>
                    <span id="pressure">0</span>hPa
                </li>
            </ul>
        </section>
    </main>

    <!-- country 파라미터를 JavaScript로 전달 -->
    <script>
        const country = "<%= request.getParameter("country") %>";
    </script>
    <script src="resources/js/weather.js"></script>
</body>
</html>
