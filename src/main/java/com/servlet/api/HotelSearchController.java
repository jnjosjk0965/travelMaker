package com.servlet.api;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apiKeys.APIKey;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

/**
 * Servlet implementation class AmadeusAPI
 */
@WebServlet("/hotelSearch.do")
public class HotelSearchController extends HttpServlet {
	private static final String HOTEL_LIST_URL = "https://test.api.amadeus.com/v1/reference-data/locations/hotels/by-geocode";
	private static final String HOTEL_SEARCH_URL = "https://test.api.amadeus.com/v3/shopping/hotel-offers";

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// api 인증 정보 설정 후 accessToken 발급
    	String access = APIKey.getAmaedusAccessToken();
    	
//    	// 검색 조건 설정
    	
//    	float lat = 41.23f; // 위도
//    	float lon= 2.43f; // 경도
//    	int radius = 20; // 해당 위치에서 검색 거리 즉 도시 크기?
//    	String radiusUnit = "KM"; // 거리 단위
//    	String[] amenities = {""}; // 편의 시설
//    	/*
//    	 * Available values : SWIMMING_POOL, SPA, FITNESS_CENTER, AIR_CONDITIONING, RESTAURANT, PARKING, 
//    	 * PETS_ALLOWED, AIRPORT_SHUTTLE, BUSINESS_CENTER, DISABLED_FACILITIES, WIFI, MEETING_ROOMS, 
//    	 * NO_KID_ALLOWED, TENNIS, GOLF, KITCHEN, ANIMAL_WATCHING, BABY-SITTING, BEACH, CASINO, JACUZZI, 
//    	 * SAUNA, SOLARIUM, MASSAGE, VALET_PARKING, BAR or LOUNGE, KIDS_WELCOME, NO_PORN_FILMS, MINIBAR, 
//    	 * TELEVISION, WI-FI_IN_ROOM, ROOM_SERVICE, GUARDED_PARKG, SERV_SPEC_MENU
//    	 * \*/
//    	String[] ratings = {""}; // 호텔 성급
//    	
//    	
//    	// API URL 조합
//    	String apiURL = "https://test.api.amadeus.com/v1/reference-data/locations/hotels/by-geocode"
//    			+ "?latitude="+lat+"&longitude="+lon+"&radius="+radius+"&radiusUnit=KM"
//    					+ "&amenities=PARKING,WI-FI_IN_ROOM&ratings=4,5&hotelSource=ALL";
    	String result = listofHotels(access);
    	resp.setContentType("text/html; charset=utf-8");
    	resp.getWriter().write("<p>" + result + "</p>");
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	private static String listofHotels(String accessToken) {
        try {
            URL url = new URL(HOTEL_LIST_URL + "?latitude=41.397158&longitude=2.160873&radius=20&radiusUnit=KM");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Authorization", "Bearer " + accessToken);

            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
            reader.close();

            // 호텔 검색 결과 처리
            return response.toString();

        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
