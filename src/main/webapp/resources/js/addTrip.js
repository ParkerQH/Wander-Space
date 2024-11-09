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
});

const regionsByCountry = {
	Korea: ["Seoul", "Busan", "Incheon", "Daegu", "Daejeon", "Gwangju", "Suwon", "Ulsan", "Jeonju", "Jeju", "Pohang"],
	   China: ["Beijing", "Shanghai", "Guangzhou", "Shenzhen", "Chengdu", "Xi'an", "Hangzhou", "Wuhan", "Chongqing", "Nanjing", "Suzhou"],
	   Japan: ["Tokyo", "Osaka", "Kyoto", "Hokkaido", "Nagoya", "Fukuoka", "Sapporo", "Hiroshima", "Sendai", "Yokohama", "Kobe"]
};

// 나라 선택에 따라 지역을 업데이트하는 함수
function updateRegions() {
    const countrySelect = document.getElementById("country");
    const regionSelect = document.getElementById("region");
    const selectedCountry = countrySelect.value;

    // 기존 옵션 초기화
    regionSelect.innerHTML = "";

    // 선택한 나라의 지역을 옵션으로 추가
    if (regionsByCountry[selectedCountry]) {
        regionsByCountry[selectedCountry].forEach(region => {
            const option = document.createElement("option");
            option.value = region;
            option.textContent = region;
            regionSelect.appendChild(option);
        });
    }
}

if (content.value.length <100){
		alert("[내용]\n최소 20자 이상 입력하세요");
		description.focus();
		return false;
	}