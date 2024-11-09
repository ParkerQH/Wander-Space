package com.wander.dto;

import java.io.Serializable;

public class Trip implements Serializable{
	private static final long serialVersionUID = 791162587187412369L;
	private String email;
	private String id;
	private String country;
	private String region;
	private String title;
	private String content;
	private String mainpicture;
	private String[] pictures;
	private String like;
	public Trip() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMainPicture() {
		return mainpicture;
	}
	public void setMainPicture(String mainpicture) {
		this.mainpicture = mainpicture;
	}
	public String[] getPictures() {
		return pictures;
	}
	public void setPictures(String[] pictures) {
		this.pictures = pictures;
	}
	public String getLike() {
		return like;
	}
	public void setLike(String like) {
		this.like = like;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
