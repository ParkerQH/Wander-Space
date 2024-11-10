package com.wander.dao;

import java.util.ArrayList;
import java.util.List;
import com.wander.dto.Country;

public class CountryRepository {
	private ArrayList<Country> listOfCountries = new ArrayList<Country>();
	private static CountryRepository instance = new CountryRepository();
	
	public static CountryRepository getInstance() {
		return instance;
	}
	
	public CountryRepository() {
	    // Create Country objects with name, countryId, and capital
	    Country korea = new Country("Korea", "kr", "Seoul");
	    korea.setRegion(new String[]{"Seoul", "Busan", "Jeju"});
	    korea.setIntro("Korea, a land of rich history and culture, offers beautiful landmarks like Gyeongbokgung Palace and vibrant cities like Seoul and Busan.");

	    Country china = new Country("China", "cn", "Beijing");
	    china.setRegion(new String[]{"Beijing", "Shanghai", "Xi'an"});
	    china.setIntro("China, one of the oldest civilizations, is home to the Great Wall, the Forbidden City, and modern cities like Shanghai.");

	    Country japan = new Country("Japan", "jp", "Tokyo");
	    japan.setRegion(new String[]{"Tokyo", "Kyoto", "Osaka"});
	    japan.setIntro("Japan, a country blending tradition with modernity, is famous for its temples, cherry blossoms, and cities like Tokyo and Kyoto.");

	    Country france = new Country("France", "fr", "Paris");
	    france.setRegion(new String[]{"Paris", "Nice", "Marseille"});
	    france.setIntro("France, known for its culture, art, and cuisine, offers landmarks such as the Eiffel Tower and the Louvre in Paris.");

	    Country italy = new Country("Italy", "it", "Roma");
	    italy.setRegion(new String[]{"Rome", "Venice", "Florence"});
	    italy.setIntro("Italy, the birthplace of the Renaissance, is home to famous cities like Rome, Venice, and Florence, as well as its world-renowned cuisine.");

	    Country usa = new Country("USA", "us", "Washington, D.C.");
	    usa.setRegion(new String[]{"New York", "Los Angeles", "Chicago"});
	    usa.setIntro("The USA, a vast country with diverse landscapes and cultures, is home to iconic cities like New York, Los Angeles, and Washington, D.C.");

	    Country canada = new Country("Canada", "ca", "Ottawa");
	    canada.setRegion(new String[]{"Toronto", "Vancouver", "Montreal"});
	    canada.setIntro("Canada, known for its stunning natural beauty and multicultural cities, features landscapes like Niagara Falls and Banff National Park.");

	    Country germany = new Country("Germany", "de", "Berlin");
	    germany.setRegion(new String[]{"Berlin", "Munich", "Hamburg"});
	    germany.setIntro("Germany, a country of great history and culture, is known for its castles, museums, and cities like Berlin and Munich.");

	    Country uk = new Country("United Kingdom", "gb", "London");
	    uk.setRegion(new String[]{"London", "Edinburgh", "Manchester"});
	    uk.setIntro("The UK, home to historic landmarks like the Tower of London and Buckingham Palace, also offers rich culture in cities like London and Edinburgh.");

	    Country australia = new Country("Australia", "au", "Canberra");
	    australia.setRegion(new String[]{"Sydney", "Melbourne", "Great Barrier Reef"});
	    australia.setIntro("Australia, known for its unique wildlife and beaches, boasts landmarks like the Great Barrier Reef, Sydney Opera House, and Melbourne's laneways.");

	    Country spain = new Country("Spain", "es", "Madrid");
	    spain.setRegion(new String[]{"Madrid", "Barcelona", "Seville"});
	    spain.setIntro("Spain, famous for its rich history, architecture, and cuisine, includes landmarks like the Alhambra and the Sagrada Familia.");

	    Country mexico = new Country("Mexico", "mx", "Mexico City");
	    mexico.setRegion(new String[]{"Mexico City", "Cancun", "Guadalajara"});
	    mexico.setIntro("Mexico, known for its vibrant culture and rich history, offers beautiful beaches in Cancun and historic cities like Mexico City.");

	    Country brazil = new Country("Brazil", "br", "Brasilia");
	    brazil.setRegion(new String[]{"Rio de Janeiro", "Sao Paulo", "Amazon Rainforest"});
	    brazil.setIntro("Brazil, a land of carnival and football, features landmarks like the Christ the Redeemer statue and the Amazon rainforest.");

	    Country india = new Country("India", "in", "New Delhi");
	    india.setRegion(new String[]{"New Delhi", "Mumbai", "Goa"});
	    india.setIntro("India, a land of ancient traditions and modern innovation, offers landmarks like the Taj Mahal and vibrant cities like Mumbai and Delhi.");

	    Country egypt = new Country("Egypt", "eg", "Cairo");
	    egypt.setRegion(new String[]{"Cairo", "Luxor", "Giza"});
	    egypt.setIntro("Egypt, the cradle of civilization, is home to the iconic pyramids, the Sphinx, and the treasures of ancient pharaohs.");

	    Country southAfrica = new Country("South Africa", "za", "Pretoria");
	    southAfrica.setRegion(new String[]{"Cape Town", "Johannesburg", "Kruger National Park"});
	    southAfrica.setIntro("South Africa offers diverse landscapes, from the beaches of Cape Town to the safari experiences of Kruger National Park.");

	    Country thailand = new Country("Thailand", "th", "Bangkok");
	    thailand.setRegion(new String[]{"Bangkok", "Phuket", "Chiang Mai"});
	    thailand.setIntro("Thailand, famous for its tropical beaches, vibrant nightlife, and cultural landmarks, attracts visitors to Bangkok and Chiang Mai.");

	    Country argentina = new Country("Argentina", "ar", "Buenos Aires");
	    argentina.setRegion(new String[]{"Buenos Aires", "Mendoza", "Patagonia"});
	    argentina.setIntro("Argentina offers a rich cultural experience, from tango in Buenos Aires to breathtaking landscapes in Patagonia.");

	    Country russia = new Country("Russia", "ru", "Moscow");
	    russia.setRegion(new String[]{"Moscow", "St. Petersburg", "Siberia"});
	    russia.setIntro("Russia, the world's largest country, offers historic landmarks in Moscow and St. Petersburg and vast wilderness in Siberia.");

	    Country turkey = new Country("Turkey", "tr", "Ankara");
	    turkey.setRegion(new String[]{"Istanbul", "Cappadocia", "Antalya"});
	    turkey.setIntro("Turkey, a country where East meets West, features the iconic Hagia Sophia, ancient ruins in Ephesus, and natural wonders in Cappadocia.");

	    Country switzerland = new Country("Switzerland", "ch", "Bern");
	    switzerland.setRegion(new String[]{"Zurich", "Geneva", "Lucerne"});
	    switzerland.setIntro("Switzerland, known for its Alps and stunning landscapes, is home to cities like Zurich and Geneva and offers world-class skiing.");

	    Country sweden = new Country("Sweden", "se", "Stockholm");
	    sweden.setRegion(new String[]{"Stockholm", "Gothenburg", "Kiruna"});
	    sweden.setIntro("Sweden, with its rich heritage and stunning landscapes, includes the archipelago in Stockholm and the ice hotel in Kiruna.");

	    Country portugal = new Country("Portugal", "pt", "Lisbon");
	    portugal.setRegion(new String[]{"Lisbon", "Porto", "Algarve"});
	    portugal.setIntro("Portugal, known for its coastal beauty and rich history, is home to cities like Lisbon, Porto, and the stunning Algarve coast.");

	    Country norway = new Country("Norway", "no", "Oslo");
	    norway.setRegion(new String[]{"Oslo", "Bergen", "Lofoten Islands"});
	    norway.setIntro("Norway, famous for its fjords and northern lights, offers beautiful landscapes like those around Bergen and the Lofoten Islands.");

	    Country netherlands = new Country("Netherlands", "nl", "Amsterdam");
	    netherlands.setRegion(new String[]{"Amsterdam", "Rotterdam", "Giethoorn"});
	    netherlands.setIntro("The Netherlands, known for its canals, tulips, and windmills, offers unique experiences in cities like Amsterdam and the charming village of Giethoorn.");

	    Country greece = new Country("Greece", "gr", "Athens");
	    greece.setRegion(new String[]{"Athens", "Santorini", "Crete"});
	    greece.setIntro("Greece, famous for its ancient ruins and islands, features landmarks like the Parthenon and picturesque islands like Santorini.");

	    Country newZealand = new Country("New Zealand", "nz", "Wellington");
	    newZealand.setRegion(new String[]{"Auckland", "Queenstown", "Rotorua"});
	    newZealand.setIntro("New Zealand, renowned for its stunning landscapes and outdoor adventures, offers activities like bungee jumping and exploring Hobbiton.");

	    Country indonesia = new Country("Indonesia", "id", "Jakarta");
	    indonesia.setRegion(new String[]{"Bali", "Jakarta", "Yogyakarta"});
	    indonesia.setIntro("Indonesia, an archipelago of islands, is home to beautiful beaches in Bali, cultural heritage in Yogyakarta, and vibrant cities like Jakarta.");

	    Country malaysia = new Country("Malaysia", "my", "Kuala Lumpur");
	    malaysia.setRegion(new String[]{"Kuala Lumpur", "Penang", "Langkawi"});
	    malaysia.setIntro("Malaysia is a mix of modernity and tradition, with its bustling capital Kuala Lumpur, historical sites in Penang, and island paradises like Langkawi.");

	    // Add countries to the list
	    listOfCountries.add(korea);
	    listOfCountries.add(china);
	    listOfCountries.add(japan);
	    listOfCountries.add(france);
	    listOfCountries.add(italy);
	    listOfCountries.add(usa);
	    listOfCountries.add(canada);
	    listOfCountries.add(germany);
	    listOfCountries.add(uk);
	    listOfCountries.add(australia);
	    listOfCountries.add(spain);
	    listOfCountries.add(mexico);
	    listOfCountries.add(brazil);
	    listOfCountries.add(india);
	    listOfCountries.add(egypt);
	    listOfCountries.add(southAfrica);
	    listOfCountries.add(thailand);
	    listOfCountries.add(argentina);
	    listOfCountries.add(russia);
	    listOfCountries.add(turkey);
	    listOfCountries.add(switzerland);
	    listOfCountries.add(sweden);
	    listOfCountries.add(portugal);
	    listOfCountries.add(norway);
	    listOfCountries.add(netherlands);
	    listOfCountries.add(greece);
	    listOfCountries.add(newZealand);
	    listOfCountries.add(indonesia);
	    listOfCountries.add(malaysia);
	}
	
	 // 모든 국가 목록 반환
    public List<Country> getAllCountries() {
        return listOfCountries;
    }

    // 나라 이름으로 국가 찾기
    public Country getCountryByName(String countryName) {
        for (Country country : listOfCountries) {
            if (country.getCountry().equalsIgnoreCase(countryName)) {  // 나라 이름으로 비교
                return country;
            }
        }
        return null; // 찾을 수 없으면 null 반환
    }

    // 특정 지역에 속하는 국가 목록 반환
    public List<Country> getCountriesByRegion(String region) {
        List<Country> countriesInRegion = new ArrayList<>();
        for (Country country : listOfCountries) {
            for (String reg : country.getRegion()) {
                if (reg.equalsIgnoreCase(region)) {
                    countriesInRegion.add(country);
                    break;
                }
            }
        }
        return countriesInRegion;
    }
    
    
}
