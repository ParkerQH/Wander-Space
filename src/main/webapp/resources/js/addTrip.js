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

let imageCount = 1;

function addImageInput() {
	const additionalImages = document.getElementById("additional-images");
	const newInputDiv = document.createElement("div");
	newInputDiv.classList.add("form-group");
	newInputDiv.innerHTML = `<input type="file" name="pictures${imageCount}" multiple>`;
	additionalImages.appendChild(newInputDiv);
	imageCount++;
}