package com.java.mapping;

public class Airport {
	private String iatacode; //IATA 공항 코드
	private double latitude; // 해당 공항이 소재하는 도시의 경도 위도
    private double longitude;
    
    public Airport(String iatacode, double latitude, double longitude) {
		super();
		this.iatacode = iatacode;
		this.latitude = latitude;
		this.longitude = longitude;
	}
	public String getIataCode() {
        return iatacode;
    }
    public double getLatitude() {
        return latitude;
    }
    public double getLongitude() {
        return longitude;
    }
}
