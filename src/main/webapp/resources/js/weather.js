let id = '9505fd1df737e20152fbd78cdb289b6a';
let url = 'https://api.openweathermap.org/data/2.5/weather?units=metric&appid=' + id;

// `country` 값은 weather.jsp에서 전달된 상태
const capitals = {
    "Korea": "Seoul",
    "United States": "Washington, D.C.",
	"USA": "Washington, D.C.",
    "United Kingdom": "London",
    "France": "Paris",
    "Germany": "Berlin",
    "China": "Beijing",
    "Italy": "Rom",
    "Spain": "Madrid",
    "Japan": "Tokyo",
    "India": "New Delhi",
    "Brazil": "Brasília",
    "Australia": "Canberra",
    "Canada": "Ottawa",
    "Mexico": "Mexico City",
    "Russia": "Moscow",
    "South Africa": "Pretoria",
    "Argentina": "Buenos Aires",
    "Egypt": "Cairo",
    "Turkey": "Ankara",
    "Thailand": "Bangkok",
    "Indonesia": "Jakarta",
    "Malaysia": "Kuala Lumpur",
    "Singapore": "Singapore",
    "Philippines": "Manila",
    "Vietnam": "Hanoi",
    "Pakistan": "Islamabad",
    "Bangladesh": "Dhaka",
    "Nigeria": "Abuja",
    "Saudi Arabia": "Riyadh",
    "United Arab Emirates": "Abu Dhabi",
    "Israel": "Jerusalem",
    "Greece": "Athens",
    "Sweden": "Stockholm",
    "Norway": "Oslo",
    "Denmark": "Copenhagen",
    "Finland": "Helsinki",
    "Poland": "Warsaw",
    "Czech Republic": "Prague",
    "Netherlands": "Amsterdam",
    "Belgium": "Brussels",
    "Portugal": "Lisbon",
    "Switzerland": "Bern",
    "Austria": "Vienna",
    "Ireland": "Dublin",
    "Hungary": "Budapest",
    "South Korea": "Seoul",
    "New Zealand": "Wellington",
    "Chile": "Santiago",
    "Colombia": "Bogotá",
    "Peru": "Lima",
    "Egypt": "Cairo",
    "Morocco": "Rabat",
    "Kenya": "Nairobi",
    "Tanzania": "Dodoma",
    "Uganda": "Kampala",
    "Malaysia": "Kuala Lumpur",
    "Algeria": "Algiers",
    "Iraq": "Baghdad",
    "Lebanon": "Beirut",
    "Jordan": "Amman"
};


let defaultCity = capitals[country] || "Seoul";  // 국가의 수도를 찾고, 없을 경우 기본값으로 'Seoul' 사용

let city = document.querySelector('.name');
let temperature = document.querySelector('.temperature');
let description = document.querySelector('.description');
let clouds = document.getElementById('clouds');
let humidity = document.getElementById('humidity');
let pressure = document.getElementById('pressure');
let main = document.querySelector('main');

// 날씨 검색 함수 - 기본 수도 또는 검색어에 따른 도시로 날씨 가져오기
const searchWeather = (cityName) => {
    fetch(url + '&q=' + cityName)
        .then(response => response.json())
        .then(data => {
            if (data.cod == 200) {
                // 날씨 데이터 업데이트
                city.querySelector('figcaption').innerText = data.name;
                city.querySelector('img').src = `https://flagsapi.com/${data.sys.country}/shiny/32.png`;
                temperature.querySelector('img').src = `https://openweathermap.org/img/wn/${data.weather[0].icon}@4x.png`;
                temperature.querySelector('span').innerText = data.main.temp;
                description.innerText = data.weather[0].description;

                clouds.innerText = data.clouds.all;
                humidity.innerText = data.main.humidity;
                pressure.innerText = data.main.pressure;
            } else {
                console.error("City not found or other error:", data.message);
                main.classList.add('error');
                setTimeout(() => {
                    main.classList.remove('error');
                }, 1000);
            }
        })
        .catch(error => console.error("Error fetching weather data:", error));
};

// 초기 앱 실행 - 기본 수도의 날씨 표시
const initApp = () => {
    searchWeather(defaultCity);
};
initApp();
