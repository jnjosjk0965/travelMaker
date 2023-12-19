package com.java.mapping;

import java.util.HashMap;

public class CityMapper {
	private static HashMap<String, Airport> airportData = new HashMap<>();
	private static HashMap<String, String> codeToNameMap = new HashMap<>();
	
	static {
		airportData.put("대한민국 인천국제공항", new Airport("ICN", 37.4692, 126.4505));
		codeToNameMap.put("ICN", "서울");
		airportData.put("대한민국 제주국제공항", new Airport("CJU", 33.4996, 126.5311));
		codeToNameMap.put("CJU", "제주");
		airportData.put("도쿄 하네다", new Airport("HND",35.6975, 139.7464));
		codeToNameMap.put("HND","도쿄");
        airportData.put("도쿄 나리타", new Airport("NRT", 35.6975, 139.7464));
        codeToNameMap.put("NRT", "도쿄");
        airportData.put("오사카 칸사이인터내셔널", new Airport("KIX", 34.6880, 135.5084));
        codeToNameMap.put("KIX", "오사카");
        airportData.put("오사카 이타미", new Airport("ITM", 34.6880, 135.5084));
        codeToNameMap.put("ITM", "오사카");
        airportData.put("삿포로 신치토세", new Airport("CTS", 43.0716, 141.3457));
        codeToNameMap.put("CTS", "삿포로");
        airportData.put("후쿠오카", new Airport("FUK", 33.5859, 130.4107));
        codeToNameMap.put("FUK", "후쿠오카");
        airportData.put("나고야 주부", new Airport("NGO", 35.1662, 136.9025));
        codeToNameMap.put("NGO", "나고야");
        airportData.put("오키나와 나하", new Airport("OKA", 26.5022, 127.9430));
        codeToNameMap.put("OKA", "오키나와");
        airportData.put("센다이", new Airport("SDJ", 38.2596, 140.8861));
        codeToNameMap.put("SDJ", "센다이");
        
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
	public static String getName(String code) {
		return codeToNameMap.get(code);
	}
}
