<%@page import="com.servlet.api.beans.SearchInfo"%>
<%@page import="com.servlet.api.beans.FlightOffer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
SearchInfo searchInfo = (SearchInfo)session.getAttribute("searchInfo");
FlightOffer flightOffers = (FlightOffer)session.getAttribute("flightOffers");
flightOffers.getFlightData().get(0).getFlightDTO(searchInfo.getTravelClass());
%>
<div>
	<c:if test="${not empty flightOffers }">
		<c:forEach var="data" items="${flightOffers.getFlightData()}">
			<jsp:include page="flightCard.jsp">
				<jsp:param value="${data.getFlightDTO(searchInfo.getTravelClass()).getOutboundAirline()}" name="out-airline"/>
				<jsp:param value="${data.getFlightDTO(searchInfo.getTravelClass()).getOutboundFlightNo()}" name="out-number"/>
				<jsp:param value="${data.getFlightDTO(searchInfo.getTravelClass()).getOutboundDuration()}" name="out-duration"/>
				<jsp:param value="${data.getFlightDTO(searchInfo.getTravelClass()).getOutboundDepartureTime()}" name="out-dep-time"/>
				<jsp:param value="${data.getFlightDTO(searchInfo.getTravelClass()).getOutboundDepartureAirport()}" name="out-dep-airport"/>
				<jsp:param value="${data.getFlightDTO(searchInfo.getTravelClass()).getOutboundArrivalTime()}" name="out-arr-time"/>
				<jsp:param value="${data.getFlightDTO(searchInfo.getTravelClass()).getOutboundArrivalAirport()}" name="out-arr-airport"/>
				<jsp:param value="${data.getFlightDTO(searchInfo.getTravelClass()).getReturnAirline()}" name="ret-airline"/>
				<jsp:param value="${data.getFlightDTO(searchInfo.getTravelClass()).getReturnFlightNo()}" name="ret-number"/>
				<jsp:param value="${data.getFlightDTO(searchInfo.getTravelClass()).getReturnDuration()}" name="ret-duration"/>
				<jsp:param value="${data.getFlightDTO(searchInfo.getTravelClass()).getReturnDepartureTime()}" name="ret-dep-time"/>
				<jsp:param value="${data.getFlightDTO(searchInfo.getTravelClass()).getReturnDepartureAirport()}" name="ret-dep-airport"/>
				<jsp:param value="${data.getFlightDTO(searchInfo.getTravelClass()).getReturnArrivalTime()}" name="ret-arr-time"/>
				<jsp:param value="${data.getFlightDTO(searchInfo.getTravelClass()).getReturnArrivalAirport()}" name="ret-arr-airport"/>
				<jsp:param value="${data.getFlightDTO(searchInfo.getTravelClass()).getFlightPrice()}" name="price"/>
				<jsp:param value="${data.getFlightDTO(searchInfo.getTravelClass()).getFlightPrice() * searchInfo.getNoP()}" name="total"/>
				<jsp:param value="select" name="isModal"/>
			</jsp:include>
		</c:forEach>
	</c:if>
</div>