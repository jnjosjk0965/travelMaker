<%@page import="com.servlet.api.beans.FlightOffer.Price"%>
<%@page import="com.servlet.api.beans.FlightOffer.Arrival"%>
<%@page import="com.servlet.api.beans.FlightOffer.Departure"%>
<%@page import="com.servlet.api.beans.FlightOffer.Segment"%>
<%@page import="com.servlet.api.beans.FlightOffer.Itinerary"%>
<%@page import="com.servlet.api.beans.FlightOffer"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% FlightOffer offers = (FlightOffer)request.getAttribute("offers"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
</head>
<body>
	<div class="SearchContainer p-5">
		<%@ include file="module/header.jsp" %>
		<%@	include file="module/searchHeader.jsp" %>
	</div>
	<div class="container">
		<c:if test="${not empty offers and not empty offers.getData() }">
			<c:forEach var="data" items="${offers.getData()}">
				<jsp:include page="module/flightCard.jsp">
					<jsp:param value="${data.getItineraries().get(0).getSegments().get(0).getCarrierCode()}" name="dep-airline"/>
					<jsp:param value="${data.getItineraries().get(0).getDuration()}" name="dep-duration"/>
					<jsp:param value="${data.getItineraries().get(0).getSegments().get(0).getDeparture().getAt()}" name="dep-dep-time"/>
					<jsp:param value="${data.getItineraries().get(0).getSegments().get(0).getDeparture().getIataCode()}" name="dep-dep-airport"/>
					<jsp:param value="${data.getItineraries().get(0).getSegments().get(0).getArrival().getAt()}" name="dep-arr-time"/>
					<jsp:param value="${data.getItineraries().get(0).getSegments().get(0).getArrival().getIataCode()}" name="dep-arr-airport"/>
					<jsp:param value="${data.getItineraries().get(1).getSegments().get(0).getCarrierCode()}" name="ret-airline"/>
					<jsp:param value="${data.getItineraries().get(1).getDuration()}" name="ret-duration"/>
					<jsp:param value="${data.getItineraries().get(1).getSegments().get(0).getDeparture().getAt()}" name="ret-dep-time"/>
					<jsp:param value="${data.getItineraries().get(1).getSegments().get(0).getDeparture().getIataCode()}" name="ret-dep-airport"/>
					<jsp:param value="${data.getItineraries().get(1).getSegments().get(0).getArrival().getAt()}" name="ret-arr-time"/>
					<jsp:param value="${data.getItineraries().get(1).getSegments().get(0).getArrival().getIataCode()}" name="ret-arr-airport"/>
					<jsp:param value="${data.getTravelerPricings().get(0).getPrice().getTotal()}" name="price"/>
					<jsp:param value="${data.getPrice().getTotal()}" name="total"/>
				</jsp:include>
			</c:forEach>
		</c:if>
	</div>
</body>
</html>