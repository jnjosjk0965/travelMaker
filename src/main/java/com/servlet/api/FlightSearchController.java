package com.servlet.api;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apiKeys.APIKey;

/**
 * Servlet implementation class AmadeusFlightAPI
 */
@WebServlet("/flightSearch.do")
public class FlightSearchController extends HttpServlet {
	private static final String FLIGHT_SEARCH_URL = "https://test.api.amadeus.com/v2/shopping/flight-offers";
	private static final String FLIGHT_PRICE_URL = "https://test.api.amadeus.com/v1/shopping/flight-offers/pricing";

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// api 인증 정보 설정 후 accessToken 발급
		String access = APIKey.getAmaedusAccessToken();
	}
	/* FLIGHT SEARCH */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String origin = request.getParameter("origin");
        String destination = request.getParameter("destination");
        String departDate = request.getParameter("departDate");
        String returnDate = request.getParameter("returnDate");
        int adults = Integer.parseInt(request.getParameter("travelers"));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	

}
