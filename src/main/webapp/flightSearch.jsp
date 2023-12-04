<%@page import="com.servlet.api.beans.FlightOffer.Price"%>
<%@page import="com.servlet.api.beans.FlightOffer.Arrival"%>
<%@page import="com.servlet.api.beans.FlightOffer.Departure"%>
<%@page import="com.servlet.api.beans.FlightOffer.Segment"%>
<%@page import="com.servlet.api.beans.FlightOffer.Itinerary"%>
<%@page import="com.servlet.api.beans.FlightOffer"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="SearchContainer p-5" style="background-color: #7b9acc;">
		<%@ include file="module/header.jsp" %>
		<jsp:include page="module/header.jsp" flush="false"/>
	</div>
<% 
	FlightOffer offers = (FlightOffer)session.getAttribute("offers");
	
	// offers 가 null 이 아니면서 data가 비어있지 않은 경우에만 처리
	if(offers != null && offers.getData() != null){
		List<FlightOffer.Data> dataList = offers.getData();
	
		// 데이터를 반복하며 카드 작성
		for( FlightOffer.Data data : dataList){
			List<Itinerary> itineraries = data.getItineraries();
%>
				<div style="border: 1px solid #ccc; padding: 10px; margin-bottom: 10px;">
<%
			for(Itinerary itinerary : itineraries){
				Departure departure = itinerary.getSegments().get(0).getDeparture();
				Arrival arrival = itinerary.getSegments().get(0).getArrival();
%>
                    <p>출발시간: <%= departure.getAt() %></p>
                    <p>출발공항: <%= departure.getIataCode() %></p>
                    <p>도착시간: <%= arrival.getAt() %></p>
                    <p>도착공항: <%= arrival.getIataCode() %></p>
<%
			}
			Price price = data.getPrice();
%>
					<p>가격: <%= price.getTotal() %> <%= price.getCurrency() %></p>
				</div>
<% 
        }
    } else {
    	
	}
%>
</body>
</html>