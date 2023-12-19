package com.servlet.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.apiKeys.APIKey;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.servlet.api.beans.FlightOffer;
import com.servlet.api.beans.Hotel;
import com.servlet.api.beans.HotelList;
import com.servlet.api.beans.SearchInfo;


@WebServlet("/flightSearch.do")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FLIGHT_SEARCH_URL = "https://test.api.amadeus.com/v2/shopping/flight-offers";
	private static final String HOTEL_LIST_URL = "https://test.api.amadeus.com/v1/reference-data/locations/hotels/by-geocode";
	private static final String HOTEL_SEARCH_URL = "https://test.api.amadeus.com/v3/shopping/hotel-offers";
	private static String accessToken;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		accessToken = APIKey.getAmaedusAccessToken();

		HttpSession session = request.getSession();
		
		String originLocation = request.getParameter("originLocation");
		String destinationLocation = request.getParameter("destinationLocation");
		String departureDate = request.getParameter("departureDate");
		String returnDate = request.getParameter("returnDate");
		String adults = request.getParameter("adults");
		String children = request.getParameter("children");
		String travelClass = request.getParameter("travelClass");
		
		SearchInfo searchInfo = new SearchInfo();
		searchInfo.setOriginLocation(originLocation);
		searchInfo.setDestinationLocation(destinationLocation);
		searchInfo.setDepartureDate(departureDate);
		searchInfo.setReturnDate(returnDate);
		searchInfo.setAdults(adults);
		searchInfo.setChildren(children);
		searchInfo.setTravelClass(travelClass);
		
		session.setAttribute("searchInfo", searchInfo);
		
		try {
			//비행기 리스트 요청
			URL flightUrl = new URL(FLIGHT_SEARCH_URL + searchInfo.getFlightString());
			HttpURLConnection flightConn = (HttpURLConnection)flightUrl.openConnection();
			flightConn.setRequestMethod("GET");
			flightConn.setRequestProperty("Authorization", "Bearer " + accessToken);
			
			BufferedReader freader = new BufferedReader(new InputStreamReader(flightConn.getInputStream()));
			 //멀티스레드에선 StringBuffer
			StringBuilder fresp = new StringBuilder();
			String fline;
			while ((fline = freader.readLine()) != null) {
				fresp.append(fline);
			}
			freader.close();
			
			
			// JSON 파싱
			ObjectMapper objectMapper = new ObjectMapper();
			FlightOffer flightOffers = objectMapper.readValue(fresp.toString(), FlightOffer.class);
			
			//호텔 리스트 요청
			URL hotelListUrl = new URL(HOTEL_LIST_URL + searchInfo.getHotelListString());
			HttpURLConnection hotelListConn = (HttpURLConnection) hotelListUrl.openConnection();
			hotelListConn.setRequestMethod("GET");
			hotelListConn.setRequestProperty("Authorization", "Bearer " + accessToken);
			
			BufferedReader hreader = new BufferedReader(new InputStreamReader(hotelListConn.getInputStream()));
			 //멀티스레드에선 StringBuffer
			StringBuilder hresp = new StringBuilder();
			String hline;
			while ((hline = hreader.readLine()) != null) {
				hresp.append(hline);
			}
			hreader.close();
			
			
			// JSON 파싱
			HotelList hotelList = objectMapper.readValue(hresp.toString(), HotelList.class);
			// hotel 검색 API
			URL hotelUrl = new URL(HOTEL_SEARCH_URL + hotelList.getHotelListString() + "&roomQuantity=1&paymentPolicy=NONE&bestRateOnly=true&lang=KR");
			HttpURLConnection hotelConn = (HttpURLConnection) hotelUrl.openConnection();
			hotelConn.setRequestMethod("GET");
			hotelConn.setRequestProperty("Authorization", "Bearer " + accessToken);
		
			BufferedReader hdreader = new BufferedReader(new InputStreamReader(hotelConn.getInputStream()));
			 //멀티스레드에선 StringBuffer
			StringBuilder hdresp = new StringBuilder();
			String hdline;
			while ((hdline = hdreader.readLine()) != null) {
				hdresp.append(hdline);
			}
			hdreader.close();
			
			// JSON 파싱
			Hotel hotelOffers = objectMapper.readValue(hdresp.toString(), Hotel.class);
			
			session.setAttribute("flightOffers", flightOffers);
			session.setAttribute("hotelOffers", hotelOffers);
			request.getRequestDispatcher("searchResult.jsp").forward(request, response);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
