package com.servlet.api.beans;

public class SearchFlight {
	private String originLocationCode;
	private String destinationLocationCode;
	private String departureDate;
	private String returnDate;
	private String adults;
	private String children;
	private String travelClass;
	public String getOriginLocationCode() {
		return originLocationCode;
	}
	public void setOriginLocationCode(String originLocationCode) {
		this.originLocationCode = originLocationCode;
	}
	public String getDestinationLocationCode() {
		return destinationLocationCode;
	}
	public void setDestinationLocationCode(String destinationLocationCode) {
		this.destinationLocationCode = destinationLocationCode;
	}
	public String getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}
	public String getReturnDate() {
		return returnDate;
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
	public String getTravelClass() {
		return travelClass;
	}
	public void setTravelClass(String travelClass) {
		this.travelClass = travelClass;
	}
	@Override
	public String toString() {
		String result = "?originLocationCode=" + originLocationCode + "&destinationLocationCode="+destinationLocationCode + 
				"&departureDate="+departureDate+"&returnDate="+returnDate+"&adults="+adults+
				"&nonStop=true&max=250";
		if(children != null) {
			result += "&children=" + children;
		}
		result += ("&travelClass=" + travelClass);
		return result;
	}
	
	
}
