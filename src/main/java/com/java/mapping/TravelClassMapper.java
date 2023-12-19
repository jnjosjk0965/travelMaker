package com.java.mapping;

import java.util.HashMap;

public class TravelClassMapper {
	private static HashMap<String, String> valToKor = new HashMap<>();
	
	static {
		valToKor.put("ECONOMY", "일반석");
		valToKor.put("PREMIUM_ECONOMY", "프리미엄 일반석");
		valToKor.put("BUSINESS", "비즈니스석");
		valToKor.put("FIRST", "일등석");	
	}
	public static String getTravelClassKor(String value) {
		return valToKor.get(value);
	}
}
