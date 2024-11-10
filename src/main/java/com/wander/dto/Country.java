package com.wander.dto;

import java.io.Serializable;

public class Country implements Serializable {

	private static final long serialVersionUID = 791162587187412369L;
	private String country; // 나라 이름
	private String countryId; // 나라 코드
	private String capital; // 수도
	private String[] region; // 관광지
	private String intro; // 나라 소개

	public Country() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Country(String country, String countryId, String capital) {
		this.country = country;
		this.countryId = countryId;
		this.capital = capital;
	}
	
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCountryId() {
		return countryId;
	}

	public void setCountryId(String countryId) {
		this.countryId = countryId;
	}

	public String getCapital() {
		return capital;
	}

	public void setCapital(String capital) {
		this.capital = capital;
	}

	public String[] getRegion() {
		return region;
	}

	public void setRegion(String[] region) {
		this.region = region;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
