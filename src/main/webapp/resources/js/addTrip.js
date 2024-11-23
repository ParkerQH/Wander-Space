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

	// 현재 언어 추출 (기본값은 'en')
	    const selectedLanguage = document.documentElement.lang || 'en';
	    console.log("Selected Language:", selectedLanguage);  // 콘솔에 언어 코드 출력

	    // 페이지 로드 시 선택된 국가에 맞게 지역 업데이트
	    updateRegions(selectedLanguage);

	    // updateRegions 함수 호출을 여기서 실행
	    document.getElementById("country").addEventListener('change', () => {
	        updateRegions(selectedLanguage);  // 국가 변경 시에도 언어를 고려하여 지역 업데이트
	    });
});

// 지역 업데이트 함수
function updateRegions(selectedLanguage) {
    const countrySelect = document.getElementById("country");
    const regionSelect = document.getElementById("region");
    const selectedCountry = countrySelect.value;

    // 기존 옵션 초기화
    regionSelect.innerHTML = "<option value=''>Select a region</option>";

    if (regionsByCountry[selectedCountry]) {
        const englishRegions = regionsByCountry[selectedCountry].en;
        const translatedRegions = regionsByCountry[selectedCountry][selectedLanguage] || englishRegions;

        // 지역들 추가
        englishRegions.forEach((region, index) => {
            const option = document.createElement("option");
            option.value = region; // 영어로 된 값 설정
            option.textContent = translatedRegions[index]; // 번역된 텍스트 표시
            regionSelect.appendChild(option);
        });
    }
}



const regionsByCountry = {
	Korea: {
		en: ["Seoul", "Busan", "Incheon", "Daegu", "Daejeon", "Gwangju", "Suwon", "Ulsan", "Jeonju", "Jeju", "Pohang"],
		ko: ["서울", "부산", "인천", "대구", "대전", "광주", "수원", "울산", "전주", "제주", "포항"],
		zh_CN: ["首尔", "釜山", "仁川", "大邱", "大田", "光州", "水原", "蔚山", "全州", "济州", "浦项"],
		jp: ["ソウル", "釜山", "インチョン", "大邱", "大田", "光州", "水原", "蔚山", "全州", "済州", "浦項"]
	},
	China: {
		en: ["Beijing", "Shanghai", "Guangzhou", "Shenzhen", "Chengdu", "Xi'an", "Hangzhou", "Wuhan", "Chongqing", "Nanjing", "Suzhou"],
		ko: ["베이징", "상하이", "광저우", "선전", "청두", "시안", "항저우", "우한", "충칭", "난징", "쑤저우"],
		zh_CN: ["北京", "上海", "广州", "深圳", "成都", "西安", "杭州", "武汉", "重庆", "南京", "苏州"],
		jp: ["北京", "上海", "広州", "深セン", "成都", "西安", "杭州", "武漢", "重慶", "南京", "蘇州"]
	},
	Japan: {
		en: ["Tokyo", "Osaka", "Kyoto", "Hokkaido", "Nagoya", "Fukuoka", "Sapporo", "Hiroshima", "Sendai", "Yokohama", "Kobe"],
		ko: ["도쿄", "오사카", "교토", "홋카이도", "나고야", "후쿠오카", "삿포로", "히로시마", "센다이", "요코하마", "고베"],
		zh_CN: ["东京", "大阪", "京都", "北海道", "名古屋", "福冈", "札幌", "广岛", "仙台", "横滨", "神户"],
		jp: ["東京", "大阪", "京都", "北海道", "名古屋", "福岡", "札幌", "広島", "仙台", "横浜", "神戸"]
	},
	France: {
		en: ["Paris", "Nice", "Marseille", "Lyon", "Bordeaux", "Toulouse", "Lille", "Nantes", "Strasbourg", "Montpellier", "Cannes", "Avignon"],
		ko: ["파리", "니스", "마르세유", "리옹", "보르도", "툴루즈", "릴", "낭트", "스트라스부르", "몽펠리에", "칸", "아비뇽"],
		zh_CN: ["巴黎", "尼斯", "马赛", "里昂", "波尔多", "图卢兹", "里尔", "南特", "斯特拉斯堡", "蒙彼利埃", "戛纳", "阿维尼翁"],
		jp: ["パリ", "ニース", "マルセイユ", "リヨン", "ボルドー", "トゥールーズ", "リール", "ナント", "ストラスブール", "モンペリエ", "カンヌ", "アヴィニョン"]
	},
	Italy: {
		en: ["Rome", "Venice", "Florence", "Milan", "Naples", "Turin", "Bologna", "Palermo", "Catania", "Verona", "Genoa", "Siena"],
		ko: ["로마", "베네치아", "피렌체", "밀라노", "나폴리", "토리노", "볼로냐", "팔레르모", "카타니아", "베로나", "제노바", "시에나"],
		zh_CN: ["罗马", "威尼斯", "佛罗伦萨", "米兰", "那不勒斯", "都灵", "博洛尼亚", "巴勒莫", "卡塔尼亚", "维罗纳", "热那亚", "锡耶纳"],
		jp: ["ローマ", "ヴェネツィア", "フィレンツェ", "ミラノ", "ナポリ", "トリノ", "ボローニャ", "パレルモ", "カターニア", "ヴェローナ", "ジェノヴァ", "シエナ"]
	},
	USA: {
		en: ["New York", "Los Angeles", "Chicago", "Miami", "San Francisco", "Las Vegas", "Washington DC", "Boston", "Dallas", "Seattle", "Austin", "Philadelphia"],
		ko: ["뉴욕", "로스앤젤레스", "시카고", "마이애미", "샌프란시스코", "라스베가스", "워싱턴 DC", "보스턴", "댈러스", "시애틀", "오스틴", "필라델피아"],
		zh_CN: ["纽约", "洛杉矶", "芝加哥", "迈阿密", "旧金山", "拉斯维加斯", "华盛顿DC", "波士顿", "达拉斯", "西雅图", "奥斯汀", "费城"],
		jp: ["ニューヨーク", "ロサンゼルス", "シカゴ", "マイアミ", "サンフランシスコ", "ラスベガス", "ワシントンDC", "ボストン", "ダラス", "シアトル", "オースティン", "フィラデルフィア"]
	},
	Canada: {
		en: ["Toronto", "Vancouver", "Montreal", "Ottawa", "Calgary", "Quebec City", "Edmonton", "Winnipeg", "Halifax", "Victoria"],
		ko: ["토론토", "밴쿠버", "몬트리올", "오타와", "캘거리", "퀘벡시티", "에드먼턴", "위니펙", "할리팩스", "빅토리아"],
		zh_CN: ["多伦多", "温哥华", "蒙特利尔", "渥太华", "卡尔加里", "魁北克市", "埃德蒙顿", "温尼伯", "哈利法克斯", "维多利亚"],
		jp: ["トロント", "バンクーバー", "モントリオール", "オタワ", "カルガリー", "ケベックシティ", "エドモントン", "ウィニペグ", "ハリファックス", "ビクトリア"]
	},
	Germany: {
		en: ["Berlin", "Munich", "Hamburg", "Cologne", "Frankfurt", "Stuttgart", "Düsseldorf", "Leipzig", "Nuremberg", "Dresden"],
		ko: ["베를린", "뮌헨", "함부르크", "쾰른", "프랑크푸르트", "슈투트가르트", "뒤셀도르프", "라이프치히", "뉘른베르크", "드레스덴"],
		zh_CN: ["柏林", "慕尼黑", "汉堡", "科隆", "法兰克福", "斯图加特", "杜塞尔多夫", "莱比锡", "纽伦堡", "德累斯顿"],
		jp: ["ベルリン", "ミュンヘン", "ハンブルク", "ケルン", "フランクフルト", "シュトゥットガルト", "デュッセルドルフ", "ライプツィヒ", "ニュルンベルク", "ドレスデン"]
	},
	UnitedKingdom: {
		en: ["London", "Edinburgh", "Manchester", "Birmingham", "Liverpool", "Glasgow", "Leeds", "Bristol", "Cardiff", "Oxford"],
		ko: ["런던", "에든버러", "맨체스터", "버밍엄", "리버풀", "글래스고", "리즈", "브리스톨", "카디프", "옥스포드"],
		zh_CN: ["伦敦", "爱丁堡", "曼彻斯特", "伯明翰", "利物浦", "格拉斯哥", "利兹", "布里斯托尔", "卡迪夫", "牛津"],
		jp: ["ロンドン", "エディンバラ", "マンチェスター", "バーミンガム", "リバプール", "グラスゴー", "リーズ", "ブリストル", "カーディフ", "オックスフォード"]
	},
	Australia: {
		en: ["Sydney", "Melbourne", "Brisbane", "Perth", "Adelaide", "Hobart", "Cairns", "Gold Coast", "Darwin", "Canberra"],
		ko: ["시드니", "멜버른", "브리즈번", "퍼스", "애들레이드", "호바트", "케언즈", "골드코스트", "다윈", "캔버라"],
		zh_CN: ["悉尼", "墨尔本", "布里斯班", "珀斯", "阿德莱德", "霍巴特", "凯恩斯", "黄金海岸", "达尔文", "堪培拉"],
		jp: ["シドニー", "メルボルン", "ブリスベン", "パース", "アデレード", "ホバート", "ケアンズ", "ゴールドコースト", "ダーウィン", "キャンベラ"]
	},
	Spain: {
		en: ["Madrid", "Barcelona", "Seville", "Valencia", "Malaga", "Bilbao", "Granada", "Alicante", "Cordoba", "Salamanca"],
		ko: ["마드리드", "바르셀로나", "세비야", "발렌시아", "말라가", "빌바오", "그라나다", "알리칸테", "코르도바", "살라망카"],
		zh_CN: ["马德里", "巴塞罗那", "塞维利亚", "瓦伦西亚", "马拉加", "毕尔巴鄂", "格拉纳达", "阿利坎特", "科尔多瓦", "萨拉曼卡"],
		jp: ["マドリード", "バルセロナ", "セビリア", "バレンシア", "マラガ", "ビルバオ", "グラナダ", "アリカンテ", "コルドバ", "サラマンカ"]
	},
	Mexico: {
		en: ["Mexico City", "Cancun", "Guadalajara", "Monterrey", "Oaxaca", "Tulum", "Puebla", "Merida", "Acapulco", "Mazatlan"],
		ko: ["멕시코시티", "칸쿤", "과달라하라", "몬테레이", "오악사카", "툴룸", "푸에블라", "메리다", "아카풀코", "마젤란"],
		zh_CN: ["墨西哥城", "坎昆", "瓜达拉哈拉", "蒙特雷", "瓦哈卡", "图卢姆", "普埃블拉", "梅里达", "阿卡普尔科", "马萨特兰"],
		jp: ["メキシコシティ", "カンクン", "グアダラハラ", "モンテレイ", "オアハカ", "トゥルム", "プエブラ", "メリダ", "アカプルコ", "マサトラン"]
	},
	Brazil: {
		en: ["Rio de Janeiro", "Sao Paulo", "Brasilia", "Salvador", "Fortaleza", "Belo Horizonte", "Recife", "Manaus", "Curitiba", "Porto Alegre"],
		ko: ["리우데자네이루", "상파울루", "브라질리아", "살바도르", "포르탈레자", "벨루오리존치", "레시페", "마나우스", "쿠리치바", "포르투알레그리"],
		zh_CN: ["里约热内卢", "圣保罗", "巴西利亚", "萨尔瓦多", "福塔雷萨", "贝洛奥里藏特", "累西腓", "马瑙斯", "库里奇巴", "阿雷格里港"],
		jp: ["リオデジャネイロ", "サンパウロ", "ブラジリア", "サルバドール", "フォルタレザ", "ベロオリゾンテ", "レシフェ", "マナウス", "クリチバ", "ポルトアレグレ"]
	},
	India: {
		en: ["New Delhi", "Mumbai", "Goa", "Kolkata", "Bangalore", "Chennai", "Hyderabad", "Jaipur", "Agra", "Varanasi"],
		ko: ["뉴델리", "뭄바이", "고아", "콜카타", "방갈로르", "첸나이", "하이데라바드", "자이푸르", "아그라", "바라나시"],
		zh_CN: ["新德里", "孟买", "果阿", "加尔各答", "班加罗尔", "钦奈", "海得拉巴", "斋浦尔", "阿格拉", "瓦拉纳西"],
		jp: ["ニューデリー", "ムンバイ", "ゴア", "コルカタ", "バンガロール", "チェンナイ", "ハイデラバード", "ジャイプール", "アグラ", "バラナシ"]
	},
	Egypt: {
		en: ["Cairo", "Luxor", "Giza", "Sharm El Sheikh", "Alexandria", "Aswan", "Hurghada", "Dahab", "Marsa Alam", "Fayoum"],
		ko: ["카이로", "룩소르", "기자", "샤름 엘 셰이크", "알렉산드리아", "아스완", "후르가다", "다합", "마르사 알람", "파윰"],
		zh_CN: ["开罗", "卢克索", "吉萨", "沙姆沙伊赫", "亚历山大", "阿斯旺", "赫尔格达", "达哈布", "马尔萨阿拉姆", "费尤姆"],
		jp: ["カイロ", "ルクソール", "ギザ", "シャルム・エル・シェイク", "アレクサンドリア", "アスワン", "フルガダ", "ダハブ", "マルサアラム", "ファユーム"]
	},
	SouthAfrica: {
		en: ["Cape Town", "Johannesburg", "Durban", "Pretoria", "Port Elizabeth", "Stellenbosch", "Knysna", "Drakensberg", "Garden Route", "Sun City"],
		ko: ["케이프타운", "요하네스버그", "더반", "프리토리아", "포트엘리자베스", "스텔렌보스", "크니스나", "드라켄스버그", "가든 루트", "선 시티"],
		zh_CN: ["开普敦", "约翰内斯堡", "德班", "比勒陀利亚", "伊丽莎白港", "斯泰伦博斯", "克尼斯纳", "德拉肯斯堡", "花园大道", "太阳城"],
		jp: ["ケープタウン", "ヨハネスブルグ", "ダーバン", "プレトリア", "ポートエリザベス", "ステレンボッシュ", "クニスナ", "ドラケンスバーグ", "ガーデンルート", "サンシティ"]
	},
	Thailand: {
		en: ["Bangkok", "Phuket", "Chiang Mai", "Pattaya", "Ayutthaya", "Krabi", "Koh Samui", "Hua Hin", "Chiang Rai", "Sukhothai"],
		ko: ["방콕", "푸켓", "치앙마이", "파타야", "아유타야", "끄라비", "코사무이", "후아힌", "치앙라이", "수코타이"],
		zh_CN: ["曼谷", "普吉岛", "清迈", "芭提雅", "大城", "甲米", "苏梅岛", "华欣", "清莱", "素可泰"],
		jp: ["バンコク", "プーケット", "チェンマイ", "パタヤ", "アユタヤ", "クラビ", "コサムイ", "フアヒン", "チェンライ", "スコータイ"]
	},
	Argentina: {
		en: ["Buenos Aires", "Mendoza", "Patagonia", "Cordoba", "Bariloche", "Rosario", "Mar del Plata", "Iguazu Falls", "Salta", "Ushuaia"],
		ko: ["부에노스아이레스", "멘도사", "파타고니아", "코르도바", "바리로체", "로사리오", "마르델플라타", "이구아수 폭포", "살타", "우수아이아"],
		zh_CN: ["布宜诺斯艾利斯", "门多萨", "巴塔哥尼亚", "科尔多瓦", "巴里洛切", "罗萨里奥", "马德普拉塔", "伊瓜苏瀑布", "萨尔塔", "乌斯怀亚"],
		jp: ["ブエノスアイレス", "メンドサ", "パタゴニア", "コルドバ", "バリローチェ", "ロサリオ", "マルデルプラタ", "イグアスの滝", "サルタ", "ウシュアイア"]
	},
	Russia: {
		en: ["Moscow", "St. Petersburg", "Kazan", "Sochi", "Yekaterinburg", "Novosibirsk", "Vladivostok", "Krasnoyarsk", "Samara", "Volgograd"],
		ko: ["모스크바", "상트페테르부르크", "카잔", "소치", "예카테린부르크", "노보시비르스크", "블라디보스토크", "크라스노야르스크", "사마라", "볼고그라드"],
		zh_CN: ["莫斯科", "圣彼得堡", "喀山", "索契", "叶卡捷琳堡", "新西伯利亚", "符拉迪沃斯托克", "克拉斯诺亚尔斯克", "萨马拉", "伏尔加格勒"],
		jp: ["モスクワ", "サンクトペテルブルク", "カザン", "ソチ", "エカテリンブルク", "ノヴォシビルスク", "ウラジオストク", "クラスノヤルスク", "サマラ", "ヴォルゴグラード"]
	},
	Turkey: {
		en: ["Istanbul", "Ankara", "Cappadocia", "Antalya", "Izmir", "Bodrum", "Fethiye", "Pamukkale", "Konya", "Mardin"],
		ko: ["이스탄불", "앙카라", "카파도키아", "안탈리아", "이즈미르", "보드룸", "페티예", "파무칼레", "코니아", "마르딘"],
		zh_CN: ["伊斯坦布尔", "安卡拉", "卡帕多西亚", "安塔利亚", "伊兹密尔", "博德鲁姆", "费特希耶", "棉花堡", "科尼亚", "马尔丁"],
		jp: ["イスタンブール", "アンカラ", "カッパドキア", "アンタルヤ", "イズミール", "ボドルム", "フェティエ", "パムッカレ", "コニア", "マルディン"]
	},
	Switzerland: {
		en: ["Zurich", "Geneva", "Lucerne", "Bern", "Basel", "Lausanne", "Interlaken", "Zermatt", "Montreux", "St. Moritz"],
		ko: ["취리히", "제네바", "루체른", "베른", "바젤", "로잔", "인터라켄", "체르마트", "몽트뢰", "생모리츠"],
		zh_CN: ["苏黎世", "日内瓦", "卢塞恩", "伯尔尼", "巴塞尔", "洛桑", "因特拉肯", "采尔马特", "蒙特勒", "圣莫里茨"],
		jp: ["チューリッヒ", "ジュネーブ", "ルツェルン", "ベルン", "バーゼル", "ローザンヌ", "インターラーケン", "ツェルマット", "モントルー", "サンモリッツ"]
	},
	Sweden: {
		en: ["Stockholm", "Gothenburg", "Malmo", "Kiruna", "Uppsala", "Lund", "Visby", "Nykoping", "Ostersund", "Vasteras"],
		ko: ["스톡홀름", "예테보리", "말뫼", "키루나", "웁살라", "룬드", "비스뷔", "뉘르셍핑", "외스터순드", "베스터로스"],
		zh_CN: ["斯德哥尔摩", "哥德堡", "马尔默", "基鲁纳", "乌普萨拉", "伦德", "维斯比", "纽克平", "厄斯特松德", "韦斯特罗斯"],
		jp: ["ストックホルム", "ヨーテボリ", "マルメ", "キルナ", "ウプサラ", "ルンド", "ヴィスビー", "ニュショーピング", "エステルスンド", "ヴェステロース"]
	},
	Portugal: {
		en: ["Lisbon", "Porto", "Algarve", "Braga", "Coimbra", "Madeira", "Azores", "Sintra", "Evora", "Funchal"],
		ko: ["리스본", "포르투", "알가르브", "브라가", "코임브라", "마데이라", "아조레스", "신트라", "에보라", "푼샬"],
		zh_CN: ["里斯本", "波尔图", "阿尔加维", "布拉加", "科英布拉", "马德拉", "亚速尔群岛", "辛特拉", "埃武拉", "丰沙尔"],
		jp: ["リスボン", "ポルト", "アルガルヴェ", "ブラガ", "コインブラ", "マデイラ", "アゾレス", "シントラ", "エヴォラ", "フンシャル"]
	},
	Norway: {
		en: ["Oslo", "Bergen", "Lofoten Islands", "Stavanger", "Trondheim", "Tromso", "Alesund", "Flam", "Geiranger", "Roros"],
		ko: ["오슬로", "베르겐", "로포텐 제도", "스타방에르", "트론헤임", "트롬쇠", "알레순드", "플람", "게이라옹", "뢰로스"],
		zh_CN: ["奥斯陆", "卑尔根", "洛福滕群岛", "斯塔万格", "特隆赫姆", "特罗姆瑟", "奥勒松", "弗拉姆", "盖朗厄尔", "雷罗斯"],
		jp: ["オスロ", "ベルゲン", "ロフォーテン諸島", "スタヴァンゲル", "トロンハイム", "トロムソ", "アーlesund", "フラム", "ゲイランゲル", "ローロス"]
	},
	Netherlands: {
		en: ["Amsterdam", "Rotterdam", "Giethoorn", "Utrecht", "The Hague", "Eindhoven", "Groningen", "Leyden", "Delft", "Maastricht"],
		ko: ["암스테르담", "로테르담", "기터혼", "위트레흐트", "헤이그", "에인드호번", "그로닝겐", "라이던", "델프트", "마스트리흐트"],
		zh_CN: ["阿姆斯特丹", "鹿特丹", "基特霍恩", "乌得勒支", "海牙", "埃因霍温", "格罗宁根", "莱顿", "代尔夫特", "马斯特里赫特"],
		jp: ["アムステルダム", "ロッテルダム", "ギートホルン", "ユトレヒト", "ハーグ", "エイントホーフェン", "フローニンゲン", "ライデン", "デルフト", "マーストリヒト"]
	},
	Greece: {
		en: ["Athens", "Santorini", "Crete", "Mykonos", "Thessaloniki", "Rhodes", "Corfu", "Naxos", "Paros", "Kefalonia"],
		ko: ["아테네", "산토리니", "크레타", "미코노스", "테살로니키", "로도스", "코르푸", "낙소스", "파로스", "케팔로니아"],
		zh_CN: ["雅典", "圣托里尼", "克里特岛", "米科诺斯", "塞萨洛尼基", "罗德岛", "科孚岛", "纳克索斯岛", "帕罗斯岛", "凯法洛尼亚岛"],
		jp: ["アテネ", "サントリーニ島", "クレタ島", "ミコノス島", "テッサロニキ", "ロードス島", "コルフ島", "ナクソス島", "パロス島", "ケファロニア島"]
	},
	NewZealand: {
		en: ["Auckland", "Queenstown", "Rotorua", "Wellington", "Christchurch", "Dunedin", "Hamilton", "Napier", "Taupo", "Wanaka"],
		ko: ["오클랜드", "퀸스타운", "로토루아", "웰링턴", "크라이스트처치", "더니든", "해밀턴", "네이피어", "타우포", "와나카"],
		zh_CN: ["奥克兰", "皇后镇", "罗托鲁瓦", "惠灵顿", "基督城", "但尼丁", "汉密尔顿", "内皮尔", "陶波", "瓦纳卡"],
		jp: ["オークランド", "クイーンズタウン", "ロトルア", "ウェリントン", "クライストチャーチ", "ダニーデン", "ハミルトン", "ネーピア", "タウポ", "ワナカ"]
	},
	Indonesia: {
		en: ["Bali", "Jakarta", "Yogyakarta", "Surabaya", "Bandung", "Medan", "Lombok", "Makassar", "Banda Aceh", "Malang"],
		ko: ["발리", "자카르타", "욕야카르타", "수라바야", "반둥", "메단", "롬복", "마카사르", "반다 아체", "말랑"],
		zh_CN: ["巴厘岛", "雅加达", "日惹", "泗水", "万隆", "棉兰", "龙目岛", "马卡萨尔", "万达阿齐", "马朗"],
		jp: ["バリ島", "ジャカルタ", "ジョグジャカルタ", "スラバヤ", "バンドン", "メダン", "ロンボク", "マカッサル", "バンダアチェ", "マラン"]
	},
	Malaysia: {
		en: ["Kuala Lumpur", "Penang", "Langkawi", "Kota Kinabalu", "George Town", "Ipoh", "Shah Alam", "Melaka", "Kuching", "Johor Bahru"],
		ko: ["쿠알라룸푸르", "페낭", "랑카위", "코타키나발루", "조지타운", "이포", "샤알람", "말라카", "쿠칭", "조호르 바루"],
		zh_CN: ["吉隆坡", "槟城", "兰卡威", "哥打基纳巴卢", "乔治市", "怡保", "沙亚南", "马六甲", "古晋", "柔佛巴鲁"],
		jp: ["クアラルンプール", "ペナン", "ランカウイ", "コタキナバル", "ジョージタウン", "イポー", "シャーアラム", "マラッカ", "クチン", "ジョホールバル"]
	}
};

let imageCount = 1;

function addImageInput() {
	const additionalImages = document.getElementById("additional-images");
	const newInputDiv = document.createElement("div");
	newInputDiv.classList.add("form-group");
	newInputDiv.innerHTML = `<input type="file" name="pictures${imageCount}" multiple>`;
	additionalImages.appendChild(newInputDiv);
	imageCount++;
}