document.addEventListener("DOMContentLoaded", function() {
    const dropdownToggle = document.querySelector(".dropdown-toggle");
    const dropdownMenu = document.querySelector(".dropdown-menu");
    const currentLanguage = new URLSearchParams(window.location.search).get("language") || "ko"; // 현재 언어를 URL에서 가져옴

    // 언어별 아이콘과 텍스트 설정
    const languageMap = {
        "ko": { icon: "fi-kr", text: "KR" },
        "en": { icon: "fi-us", text: "EN" },
		"zh_CN": { icon: "fi-cn", text: "CN" },
        "jp": { icon: "fi-jp", text: "JP" }
    };

    // 현재 언어로 버튼 텍스트 및 아이콘 업데이트
    function updateButtonLanguage(language) {
        const { icon, text } = languageMap[language];
        dropdownToggle.innerHTML = `<span class="fi ${icon}"></span> ${text}`;
    }

    // 초기 언어 설정
    updateButtonLanguage(currentLanguage);

    // 드롭다운 토글 클릭 시
    dropdownToggle.addEventListener("click", function(event) {
        event.stopPropagation(); // 다른 영역 클릭 시 닫히도록 설정
        dropdownMenu.classList.toggle("show");
    });

	// 언어 변경 시 드롭다운을 닫고 버튼 업데이트
	dropdownMenu.addEventListener("click", function(event) {
	    const selectedLanguage = event.target.getAttribute("href").split("=")[1];
	    updateButtonLanguage(selectedLanguage);
	    dropdownMenu.classList.remove("show"); // 드롭다운 닫기
	    window.location.search = `?language=${selectedLanguage}`; // 언어를 변경하여 새로고침
	});

    // 드롭다운 외부 클릭 시 메뉴 닫기
    document.addEventListener("click", function(event) {
        if (!dropdownToggle.contains(event.target)) {
            dropdownMenu.classList.remove("show");
        }
    });
});
