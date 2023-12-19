<%@page import="com.servlet.api.beans.FlightDTO"%>
<%@page import="com.servlet.api.beans.Hotel"%>
<%@page import="com.servlet.api.beans.FlightOffer.*"%>
<%@page import="com.servlet.api.beans.FlightOffer"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
SearchInfo searchInfo = (SearchInfo)session.getAttribute("searchInfo");
FlightOffer flightOffers = (FlightOffer)session.getAttribute("flightOffers");
Hotel hotelOffers = (Hotel)session.getAttribute("hotelOffers");
FlightDTO selectedFlight;
if(session.getAttribute("selected") == null){
	selectedFlight = flightOffers.getCheapestFlight(searchInfo.getTravelClass());
	session.setAttribute("selected", selectedFlight);	
}else{
	selectedFlight = (FlightDTO)session.getAttribute("selected");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bs/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mycss.css">
<script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8=" crossorigin="anonymous"></script>
<style type="text/css">
	.flight-container{
		border-radius: 0.75rem;
		background-color: #fff;
		padding: 1rem;
		margin-bottom: 0.5rem;
	}
	.hotel-container{
		border-radius: 0.75rem;
		background-color: #fff;
		padding: 1rem;
	}
</style>
</head>
<body>
<div style="max-width:70%;margin:auto;">
	<div class="SearchContainer p-4">
		<%@ include file="module/header.jsp" %>
		<%@	include file="module/searchHeader.jsp" %>
	</div>
	<div class="container p-4">
		<div class="flight-container">
			<div>선택 항공편</div>
			<jsp:include page="module/flightCard.jsp">
				<jsp:param value="<%= selectedFlight.getOutboundAirline()%>" name="out-airline"/>
				<jsp:param value="<%= selectedFlight.getOutboundFlightNo()%>" name="out-number"/>
				<jsp:param value="<%= selectedFlight.getOutboundDuration()%>" name="out-duration"/>
				<jsp:param value="<%= selectedFlight.getOutboundDepartureTime()%>" name="out-dep-time"/>
				<jsp:param value="<%= selectedFlight.getOutboundDepartureAirport()%>" name="out-dep-airport"/>
				<jsp:param value="<%= selectedFlight.getOutboundArrivalTime()%>" name="out-arr-time"/>
				<jsp:param value="<%= selectedFlight.getOutboundArrivalAirport()%>" name="out-arr-airport"/>
				<jsp:param value="<%= selectedFlight.getReturnAirline()%>" name="ret-airline"/>
				<jsp:param value="<%= selectedFlight.getReturnFlightNo()%>" name="ret-number"/>
				<jsp:param value="<%= selectedFlight.getReturnDuration()%>" name="ret-duration"/>
				<jsp:param value="<%= selectedFlight.getReturnDepartureTime()%>" name="ret-dep-time"/>
				<jsp:param value="<%= selectedFlight.getReturnDepartureAirport()%>" name="ret-dep-airport"/>
				<jsp:param value="<%= selectedFlight.getReturnArrivalTime()%>" name="ret-arr-time"/>
				<jsp:param value="<%= selectedFlight.getReturnArrivalAirport()%>" name="ret-arr-airport"/>
				<jsp:param value="<%= selectedFlight.getFlightPrice()%>" name="price"/>
				<jsp:param value="<%= selectedFlight.getFlightPrice() * searchInfo.getNoP() %>" name="total"/>
				<jsp:param value="change" name="isModal"/>
			</jsp:include>
		</div>
		<div class="hotel-container">
			<div>호텔 선택</div>
			<c:if test="${ not empty hotelOffers }">
				<c:forEach var="hotel" items="${ hotelOffers.getData() }">
					<jsp:include page="module/hotelCard.jsp">
						<jsp:param value="${hotel.getHotelDetailData().getHotelId()}" name="hotelId"/>
						<jsp:param value="${hotel.getHotelDetailData().getName()}" name="hotelName"/>
						<jsp:param value="${hotel.getHotelDetailData().getLatitude()}" name="latitude"/>
						<jsp:param value="${hotel.getHotelDetailData().getLongitude()}" name="longitude"/>
						<jsp:param value="${hotel.getOffers().get(0).getId()}" name="roomId"/>
						<jsp:param value="${hotel.getOffers().get(0).getCheckInDate()}" name="checkInDate"/>
						<jsp:param value="${hotel.getOffers().get(0).getCheckOutDate()}" name="checkOutDate"/>
						<jsp:param value="${hotel.getOffers().get(0).getRoom().getTypeEstimated().getBeds()}" name="beds"/>
						<jsp:param value="${hotel.getOffers().get(0).getRoom().getTypeEstimated().getBedType()}" name="bedType"/>
						<jsp:param value="${hotel.getOffers().get(0).getPrice().getTotal()}" name="roomPrice"/>
						<jsp:param value="${hotel.getOffers().get(0).getRoom().getDescription().getText()}" name="description"/>
					</jsp:include>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<!-- 모달 -->
	<div class="modal fade modal-right" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document" style="margin:0; margin-left:auto;max-width:70%;">
	        <div class="modal-content" style="height:100%;	">
	            <!-- 모달 내용 -->
	            <header class="d-flex">
					<span class="login-text">항공편 변경</span>
			        <button id="login-close-button" class="close-btn" data-bs-dismiss="modal" aria-label="Close">
			        	<span>X</span>
			        </button>
				</header>
	            <div class="modal-body">
	                <jsp:include page="module/flightModal.jsp"/>
	            </div>
	        </div>
	    </div>
	</div>
</div>
	<jsp:include page="module/loginModal.jsp"/>
	<script src="js/bs/bootstrap.bundle.js"></script>
	<script src="js/app.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script type="text/javascript" src="https://npmcdn.com/flatpickr@4.6.13/dist/l10n/ko.js"></script>
	<script>
		function openModal(){
			$('#myModal').modal('show');
			$('html, body').animate({ scrollTop: 0 }, 'fast');
		}
	</script>
</body>
</html>