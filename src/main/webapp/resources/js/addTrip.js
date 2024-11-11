document.addEventListener('DOMContentLoaded', function() {
    const themeToggle = document.getElementById('themeToggle');

    // 페이지 로드 시 로컬 스토리지에서 다크 모드 상태를 확인
    if (localStorage.getItem('dark-mode') === 'true') {
        document.body.classList.add('dark-mode');
    }

    themeToggle.addEventListener('click', () => {
        document.body.classList.toggle('dark-mode');

        // 다크 모드 상태를 로컬 스토리지에 저장
        if (document.body.classList.contains('dark-mode')) {
            localStorage.setItem('dark-mode', 'true');
        } else {
            localStorage.setItem('dark-mode', 'false');
        }
    });

    // updateRegions 함수 호출을 여기서 실행
    document.getElementById("country").addEventListener('change', updateRegions);

    // 페이지 로드 시 선택된 국가에 맞게 지역 업데이트
    updateRegions(); 
});

// 지역 정보
const regionsByCountry = {
	Korea: ["Seoul", "Busan", "Incheon", "Daegu", "Daejeon", "Gwangju", "Suwon", "Ulsan", "Jeonju", "Jeju", "Pohang"],
	China: ["Beijing", "Shanghai", "Guangzhou", "Shenzhen", "Chengdu", "Xi'an", "Hangzhou", "Wuhan", "Chongqing", "Nanjing", "Suzhou"],
	Japan: ["Tokyo", "Osaka", "Kyoto", "Hokkaido", "Nagoya", "Fukuoka", "Sapporo", "Hiroshima", "Sendai", "Yokohama", "Kobe"],
	France: ["Paris", "Nice", "Marseille", "Lyon", "Bordeaux", "Toulouse", "Lille", "Nantes", "Strasbourg", "Montpellier", "Cannes", "Avignon"],
	Italy: ["Rome", "Venice", "Florence", "Milan", "Naples", "Turin", "Bologna", "Palermo", "Catania", "Verona", "Genoa", "Siena"],
	USA: ["New York", "Los Angeles", "Chicago", "Miami", "San Francisco", "Las Vegas", "Washington, D.C.", "Boston", "Dallas", "Seattle", "Austin", "Philadelphia"],
	Canada: ["Toronto", "Vancouver", "Montreal", "Ottawa", "Calgary", "Quebec City", "Edmonton", "Winnipeg", "Halifax", "Victoria"],
	Germany: ["Berlin", "Munich", "Hamburg", "Cologne", "Frankfurt", "Stuttgart", "Düsseldorf", "Leipzig", "Nuremberg", "Dresden"],
	UnitedKingdom: ["London", "Edinburgh", "Manchester", "Birmingham", "Liverpool", "Glasgow", "Leeds", "Bristol", "Cardiff", "Oxford"],
	Australia: ["Sydney", "Melbourne", "Brisbane", "Perth", "Adelaide", "Hobart", "Cairns", "Gold Coast", "Darwin", "Canberra"],
	Spain: ["Madrid", "Barcelona", "Seville", "Valencia", "Malaga", "Bilbao", "Granada", "Alicante", "Cordoba", "Salamanca"],
	Mexico: ["Mexico City", "Cancun", "Guadalajara", "Monterrey", "Oaxaca", "Tulum", "Puebla", "Merida", "Acapulco", "Mazatlan"],
	Brazil: ["Rio de Janeiro", "Sao Paulo", "Brasilia", "Salvador", "Fortaleza", "Belo Horizonte", "Recife", "Manaus", "Curitiba", "Porto Alegre"],
	India: ["New Delhi", "Mumbai", "Goa", "Kolkata", "Bangalore", "Chennai", "Hyderabad", "Jaipur", "Agra", "Varanasi"],
	Egypt: ["Cairo", "Luxor", "Giza", "Sharm El Sheikh", "Alexandria", "Aswan", "Hurghada", "Dahab", "Marsa Alam", "Fayoum"],
	SouthAfrica: ["Cape Town", "Johannesburg", "Durban", "Pretoria", "Port Elizabeth", "Stellenbosch", "Knysna", "Drakensberg", "Garden Route", "Sun City"],
	Thailand: ["Bangkok", "Phuket", "Chiang Mai", "Pattaya", "Ayutthaya", "Krabi", "Koh Samui", "Hua Hin", "Chiang Rai", "Sukhothai"],
	Argentina: ["Buenos Aires", "Mendoza", "Patagonia", "Cordoba", "Bariloche", "Rosario", "Mar del Plata", "Iguazu Falls", "Salta", "Ushuaia"],
	Russia: ["Moscow", "St. Petersburg", "Kazan", "Sochi", "Yekaterinburg", "Novosibirsk", "Vladivostok", "Krasnoyarsk", "Samara", "Volgograd"],
	Turkey: ["Istanbul", "Ankara", "Cappadocia", "Antalya", "Izmir", "Bodrum", "Fethiye", "Pamukkale", "Konya", "Mardin"],
	Switzerland: ["Zurich", "Geneva", "Lucerne", "Bern", "Basel", "Lausanne", "Interlaken", "Zermatt", "Montreux", "St. Moritz"],
	Sweden: ["Stockholm", "Gothenburg", "Malmo", "Kiruna", "Uppsala", "Lund", "Visby", "Nykoping", "Ostersund", "Vasteras"],
	Portugal: ["Lisbon", "Porto", "Algarve", "Braga", "Coimbra", "Madeira", "Azores", "Sintra", "Evora", "Funchal"],
	Norway: ["Oslo", "Bergen", "Lofoten Islands", "Stavanger", "Trondheim", "Tromso", "Alesund", "Flam", "Geiranger", "Roros"],
	Netherlands: ["Amsterdam", "Rotterdam", "Giethoorn", "Utrecht", "The Hague", "Eindhoven", "Groningen", "Leiden", "Delft", "Maastricht"],
	Greece: ["Athens", "Santorini", "Crete", "Mykonos", "Thessaloniki", "Rhodes", "Corfu", "Naxos", "Paros", "Kefalonia"],
	NewZealand: ["Auckland", "Queenstown", "Rotorua", "Wellington", "Christchurch", "Dunedin", "Hamilton", "Napier", "Taupo", "Wanaka"],
	Indonesia: ["Bali", "Jakarta", "Yogyakarta", "Surabaya", "Bandung", "Medan", "Lombok", "Makassar", "Banda Aceh", "Malang"],
	Malaysia: ["Kuala Lumpur", "Penang", "Langkawi", "Kota Kinabalu", "George Town", "Ipoh", "Shah Alam", "Melaka", "Kuching", "Johor Bahru"]
};

// 지역 업데이트 함수
function updateRegions() {
    const countrySelect = document.getElementById("country");
    const regionSelect = document.getElementById("region");
    const selectedCountry = countrySelect.value;

    console.log("Selected Country:", selectedCountry);  // 선택된 나라 확인

    // 기존 옵션 초기화
    regionSelect.innerHTML = "<option value=''>Select a region</option>"; // 기본 옵션 추가

    // 선택된 국가에 맞는 지역 옵션 추가
    if (regionsByCountry[selectedCountry]) {
        regionsByCountry[selectedCountry].forEach(region => {
            const option = document.createElement("option");
            option.value = region;
            option.textContent = region;
            regionSelect.appendChild(option);
        });
    } else {
        const option = document.createElement("option");
        option.value = "";
        option.textContent = "No regions available";
        regionSelect.appendChild(option);
    }
}
