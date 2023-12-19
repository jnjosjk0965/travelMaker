package com.java.review;

public class ReviewDTO {
	private String userEmail;
	private String hotelID;
	private String userAllrate;
	private String userClean;
	private String userLocation;
	private String userService;
	private String userFacility;
	private String userContents;
	
	
	public ReviewDTO() {
		
	}
	public ReviewDTO(String userEmail, String hotelID) 
	{
		this.userEmail = userEmail;
		this.hotelID = hotelID;
	}
	
	public ReviewDTO(String userEmail,String hotelID,String userAllrate, String userClean, String userLocation,
			String userService, String userFacility,String userContents) {
		
		super();
		this.userEmail = userEmail;
		this.hotelID = hotelID;
		this.userAllrate = userAllrate;
		this.userClean = userClean;
		this.userLocation  = userLocation;
		this.userService = userService;
		this.userFacility = userFacility;
		this.userContents = userContents;
	}

	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public String getHotelID() {
		return hotelID;
	}


	public void setHotelID(String hotelID) {
		this.hotelID = hotelID;
	}


	public String getUserAllrate() {
		return userAllrate;
	}


	public void setUserAllrate(String userAllrate) {
		this.userAllrate = userAllrate;
	}


	public String getUserClean() {
		return userClean;
	}


	public void setUserClean(String userClean) {
		this.userClean = userClean;
	}


	public String getUserLocation() {
		return userLocation;
	}


	public void setUserLocation(String userLocation) {
		this.userLocation = userLocation;
	}


	public String getUserService() {
		return userService;
	}


	public void setUserService(String userService) {
		this.userService = userService;
	}


	public String getUserFacility() {
		return userFacility;
	}


	public void setUserFacility(String userFacility) {
		this.userFacility = userFacility;
	}


	public String getUserContents() {
		return userContents;
	}


	public void setUserContents(String userContents) {
		this.userContents = userContents;
	}
	
	
}


