package com.servlet.api.beans;


import com.java.mapping.CityMapper;

public class SearchInfo {
	private String originLocation;
	private String destinationLocation;
	private String departureDate;
	private String returnDate;
	private String adults;
	private String children;
	private String travelClass;
	public String getOriginLocation() {
		return originLocation;
	}
	public void setOriginLocation(String originLocation) {
		this.originLocation = originLocation;
	}
	public String getDestinationLocation() {
		return destinationLocation;
	}
	public void setDestinationLocation(String destinationLocation) {
		this.destinationLocation = destinationLocation;
	}
	public String getDepartureDate() {
		return departureDate;
	}
	public String getDepFormatDate() {
		return departureDate.replace("-", "");
	}
	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}
	public String getReturnDate() {
		return returnDate;
	}
	public String getRetFormatDate() {
		return returnDate.replace("-", "");
	}
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}
	public String getAdults() {
		return adults;
	}
	public void setAdults(String adults) {
		this.adults = adults;
	}
	public String getChildren() {
		return children;
	}
	public void setChildren(String children) {
		this.children = children;
	}
	public int getNoP() { // 인원수 구하는 함수
		if(children == null) {
			return Integer.parseInt(adults);
		}else {
			return (Integer.parseInt(adults) + Integer.parseInt(children));
		}
	}
	public String getTravelClass() {
		return travelClass;
	}
	public void setTravelClass(String travelClass) {
		this.travelClass = travelClass;
	}
	
	public String getFlightString() {
		String result = "?originLocationCode=" + CityMapper.getAirportCode(originLocation) + 
				"&destinationLocationCode="+ CityMapper.getAirportCode(destinationLocation) + 
				"&departureDate="+departureDate+"&returnDate="+returnDate+"&adults="+adults+
				"&currencyCode=KRW&nonStop=true&max=250";
		if(children != null) {
			result += "&children=" + children;
		}
		result += ("&travelClass=" + travelClass);
		return result;
	}
	
	public String getHotelListString() {
		String result = "?latitude=" + CityMapper.getGeoInfo(destinationLocation)[0] + 
						"&longitude="+ CityMapper.getGeoInfo(destinationLocation)[1] + 
						"&radius=10";
		return result;
	}
}
