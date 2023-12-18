package com.java.mapping;

import java.util.HashMap;

public class CityMapper {
	private static final HashMap<String, Airport> airportData = new HashMap<>();
	
	static {
		airportData.put("대한민국 인천국제공항", new Airport("ICN", 37.4692, 126.4505));
		airportData.put("대한민국 제주국제공항", new Airport("CJU", 33.4996, 126.5311));
		airportData.put("도쿄 하네다", new Airport("HND",35.6975, 139.7464));
        airportData.put("도쿄 나리타", new Airport("NRT", 35.6975, 139.7464));
        airportData.put("오사카 칸사이인터내셔널", new Airport("KIX", 34.6880, 135.5084));
        airportData.put("오사카 이타미", new Airport("ITM", 34.6880, 135.5084));
        airportData.put("삿포로 신치토세", new Airport("CTS", 43.0716, 141.3457));
        airportData.put("후쿠오카", new Airport("FUK", 33.5859, 130.4107));
        airportData.put("나고야 주부", new Airport("NGO", 35.1662, 136.9025));
        airportData.put("오키나와 나하", new Airport("OKA", 26.5022, 127.9430));
        airportData.put("센다이", new Airport("SDJ", 38.2596, 140.8861));
        
	}
	
	public static String getAirportCode(String airportName) {
		return airportData.get(airportName).getIataCode();
	}
	public static double[] getGeoInfo(String airportName) {
		double[] geoInfo = new double[2];
		geoInfo[0] = airportData.get(airportName).getLatitude();
		geoInfo[1] = airportData.get(airportName).getLongitude();
		
		return geoInfo;
	}
}
