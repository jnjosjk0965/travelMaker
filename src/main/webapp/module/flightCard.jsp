<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="com.servlet.api.beans.SearchInfo"%>
<%@page import="com.servlet.api.beans.FlightDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.flight-card{
		position: relative;
		align-items: stretch;
		box-shadow: 0 1px 3px 0 rgba(37,32,31,.3);
		cursor: pointer;
		border-radius: 0.75rem;
    	z-index: 0;
	}
	.ticket-info{
		padding: 1rem;
		border-radius: 0.75rem 0 0 0.75rem;
		flex: 2 1 auto;
		position: relative;
    	background-color: #eee;
	}
	.price-info{
		position: relative;
		display: flex;
		flex: 0 0 32%;
    	padding: 1rem;
    	justify-content: center;
    	align-items: center;
    	min-width: 30%;
    	border-radius: 0 0.75rem 0.75rem 0;
    	box-shadow: inset 0.0625rem 0 0 #c2c9cd;
	}
	.ticket-container{
    	justify-content: space-evenly;
    	height: 100%;
	}
	.ticket-detail{
		display: flex;
    	flex-wrap: wrap;
    	justify-content: center;
	}
	.airline-logo-container{
		margin-top: 0.25rem;
    	flex: 1 1 22%;
	}
	.airline-logo-img{
		max-width: 3.75rem;
		position: absolute;
	    top: 0;
	    right: 0;
	    bottom: 0;
	    left: 0;
	    display: block;
	    width: 100%;
	    transition: opacity .4s ease-in-out;
	}
	.price-container{
    	justify-content: center;
    	align-items: center;
	}
	.main-price{
		display: flex;
    	justify-content: center;
    	align-items: center;
	}
	.total-price{
		color: #545860;
		font-size: .75rem;
    	line-height: 1rem;
    	font-weight: 400;
    	margin: 0;
	}
	.price{
		font-size: 1.25rem;
    	line-height: 1.75rem;
    	font-weight: 400;
	}
	.ticket-button{
		margin-top: 0.25rem;
		display: inline-block;
	    min-height: 2.25rem;
	    margin: 0;
	    padding: 0.375rem 1rem;
	    border: 0;
	    border-radius: 0.5rem;
	    text-align: center;
	    text-decoration: none;
	    cursor: pointer;
	    vertical-align: middle;
	    user-select: none;
    	font-size: 1rem;
    	line-height: 1.5rem;
    	font-weight: 700
	}
	.flight-info{
		display: flex;
    	flex-flow: row wrap;
    	flex: 1 1 78%;
    	text-align: center;
	}
	.time-airport{
		display: flex;
    	max-width: 32%;
    	flex-direction: column;
    	align-items: flex-end;
    	flex: 1;
	}.atleft{
		padding-right: 0.25rem;
		text-align: right;
		align-items: flex-end;
	}.atright{
		padding-left: 0.25rem;
		text-align: left;
		align-items: flex-start;
	}.mid-info{
		max-width: 36%;
    	padding: 0 0.25rem;
    	flex: 1;
    	text-align: center;
	}.plane-pointer{
		position: relative;
    	display: block;
    	width: 90%;
    	height: 0.125rem;
    	margin: 0.25rem auto;
    	padding: 0;
    	border-radius: 0.5rem;
    	background-color: #545860;
    	line-height: 0;
    	text-align: center;
	}.plane-icon{
		position: absolute;
    	top: 50%;
    	right: -0.9rem;
    	display: block;
    	width: 1rem;
    	height: 1rem;
    	margin-top: -0.5rem;
    	padding-left: 0.25rem;
    	background-color: transparent;
	}
	.oneway-info{
		display: flex;
    	flex-wrap: wrap;
    	justify-content: center;
    	align-items: baseline;
	}
	.time-info-text{
		font-size: 1rem;
    	line-height: 1.5rem;
    	font-weight: 700;
	}
	.airport-code-text{
		font-size: 1rem;
    	line-height: 1.5rem;
    	font-weight: 400;
	}
	.ticket-btn{
		background-color: #7b9acc;
    	min-height: 2.25rem;
    	margin: 0;
    	padding: 0.375rem 1rem;
    	border: 0;
    	border-radius: 0.5rem;
    	text-align: center;
    	text-decoration: none;
    	vertical-align: middle;
    	font-size: 1rem;
    	line-height: 1.5rem;
    	font-weight: 700;
	}
</style>
<%  
SearchInfo searchInfo = (SearchInfo)session.getAttribute("searchInfo");
NumberFormat numFormatter = NumberFormat.getNumberInstance(Locale.getDefault());
FlightDTO flight = new FlightDTO();

int flightPrice = Integer.parseInt(request.getParameter("price")); // 인당 가격
flight.setFlightPrice(flightPrice);
String outNumber = request.getParameter("out-number");
String retNumber = request.getParameter("ret-number");
String flightId = searchInfo.getDepFormatDate() + outNumber + searchInfo.getRetFormatDate() + retNumber;

String outboundAirline = request.getParameter("out-airline");
String outboundDuration = request.getParameter("out-duration");
String outboundDepartureTime = request.getParameter("out-dep-time");
String outboundDepartureAirport = request.getParameter("out-dep-airport");
String outboundArrivalTime = request.getParameter("out-arr-time");
String outboundArrivalAirport = request.getParameter("out-arr-airport");

String returnAirline = request.getParameter("ret-airline");
String returnDuration = request.getParameter("ret-duration");
String returnDepartureTime = request.getParameter("ret-dep-time");
String returnDepartureAirport = request.getParameter("ret-dep-airport");
String returnArrivalTime = request.getParameter("ret-arr-time");
String returnArrivalAirport = request.getParameter("ret-arr-airport");

flight.setOutboundAirline(outboundAirline);
flight.setOutboundSeatClass(searchInfo.getTravelClass());
flight.setOutboundFlightNo(outNumber);
flight.setOutboundDuration(outboundDuration);
flight.setOutboundDepartureTime(outboundDepartureTime);
flight.setOutboundDepartureAirport(outboundDepartureAirport);
flight.setOutboundArrivalTime(outboundArrivalTime);
flight.setOutboundArrivalAirport(outboundArrivalAirport);

flight.setReturnAirline(returnAirline);
flight.setReturnSeatClass(searchInfo.getTravelClass());
flight.setReturnFlightNo(retNumber);
flight.setReturnDuration(returnDuration);
flight.setReturnDepartureTime(returnDepartureTime);
flight.setReturnDepartureAirport(returnDepartureAirport);
flight.setReturnArrivalTime(returnArrivalTime);
flight.setReturnArrivalAirport(returnArrivalAirport);

flight.setFlightId(flightId);

%>
<div class="flight-card r-flex mb-2">
	<div class="ticket-info">
		<div style="display: block;flex-grow: 1;">
			<div class="ticket-container c-flex">
				<div class="ticket-detail">
					<div class="airline-logo-container">
						<img alt="항공사 로고" src="https://via.placeholder.com/60x30" class="">
						<%= outboundAirline %>
					</div>
					<div class="flight-info">
						<div class="time-airport atleft">
							<span class="time-info-text"><%= outboundDepartureTime %></span>
							<span class="airport-code-text">
								<div>
									<%= outboundDepartureAirport %>
								</div>
							</span>
						</div>
						<div class="mid-info">
							<span class="" style="font-size: .75rem;line-height: 1rem;font-weight: 400;">
								<%= outboundDuration %>
							</span>
							<div class="plane-pointer">
								<svg xmlns="http://www.w3.org/2000/svg" xml:space="preserve" viewBox="0 0 12 12" class="plane-icon">
									<path fill="#898294" d="M3.922 12h.499a.52.52 0 0 0 .444-.247L7.949 6.8l3.233-.019A.8.8 0 0 0 12 6a.8.8 0 0 0-.818-.781L7.949 5.2 4.866.246A.525.525 0 0 0 4.421 0h-.499a.523.523 0 0 0-.489.71L5.149 5.2H2.296l-.664-1.33a.523.523 0 0 0-.436-.288L0 3.509 1.097 6 0 8.491l1.196-.073a.523.523 0 0 0 .436-.288l.664-1.33h2.853l-1.716 4.49a.523.523 0 0 0 .489.71">
									</path>
								</svg>
							</div>
							<div class="oneway-info" >
								<span class="" style="color: #0c838a;font-size: .75rem;line-height: 1rem;font-weight: 400;style=width:24px;height:16px;">
									직항
								</span>
							</div>
						</div>
						<div class="time-airport atright">
							<span class="time-info-text"><%= outboundArrivalTime %></span>
							<span class="airport-code-text">
								<div>
									<%= outboundArrivalAirport %>
								</div>
							</span>
						</div>
					</div>
				</div>
				<c:if test="${ returnAirline eq null }">
				<div class="ticket-detail">
					<div class="airline-logo-container">
						<img alt="항공사 로고" src="https://via.placeholder.com/60x30" class="">
						<%= returnAirline %>
					</div>
					<div class="flight-info">
						<div class="time-airport atleft">
							<span class="time-info-text"><%= returnDepartureTime %></span>
							<span class="airport-code-text">
								<div>
									<%= returnDepartureAirport %>
								</div>
							</span>
						</div>
						<div class="mid-info">
							<span class="" style="font-size: .75rem;line-height: 1rem;font-weight: 400;">
								<%= returnDuration %>
							</span>
							<div class="plane-pointer">
								<svg xmlns="http://www.w3.org/2000/svg" xml:space="preserve" viewBox="0 0 12 12" class="plane-icon">
									<path fill="#898294" d="M3.922 12h.499a.52.52 0 0 0 .444-.247L7.949 6.8l3.233-.019A.8.8 0 0 0 12 6a.8.8 0 0 0-.818-.781L7.949 5.2 4.866.246A.525.525 0 0 0 4.421 0h-.499a.523.523 0 0 0-.489.71L5.149 5.2H2.296l-.664-1.33a.523.523 0 0 0-.436-.288L0 3.509 1.097 6 0 8.491l1.196-.073a.523.523 0 0 0 .436-.288l.664-1.33h2.853l-1.716 4.49a.523.523 0 0 0 .489.71">
									</path>
								</svg>
							</div>
							<div class="oneway-info" >
								<span class="" style="color: #0c838a;font-size: .75rem;line-height: 1rem;font-weight: 400;width:24px;height:16px;">
									직항
								</span>
							</div>
						</div>
						<div class="time-airport atright">
							<span class="time-info-text"><%= returnArrivalTime %></span>
							<span class="airport-code-text">
								<div>
									<%= returnArrivalAirport %>
								</div>
							</span>
						</div>
					</div>
				</div>
				</c:if>
			</div>
		</div>
	</div>
	<div class="price-info">
		<div class="price-container c-flex">
			<div>
				<div class="main-price">
					<span class="price">
						￦<%= numFormatter.format(flightPrice) %>
					</span>
				</div>
				<span class="total-price">총 가격 ￦<%= numFormatter.format(Integer.parseInt(request.getParameter("total")))%></span>
			</div>
			<c:set var="isModal" value="${param.isModal}"/>
			<c:if test="${ isModal eq 'select' }">
				<a href="/TravelMaker/SelectFlight.do<%=flight.getQueryString() %>" class="btn my-button1 ticket-btn">
					선택하기&nbsp;
					<span style="line-height: 1rem; display: inline-block; margin-top: 0.1rem; vertical-align: top;">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" aria-hidden="true" class="BpkIcon_bpk-icon--rtl-support__YWE2M" fill="white" style="width: 1rem; height: 1rem;">
							<path d="M3 12a1.5 1.5 0 001.5 1.5h11.379l-4.94 4.94a1.5 1.5 0 002.122 2.12l7.5-7.5a1.5 1.5 0 000-2.12l-7.5-7.5a1.5 1.5 0 00-2.122 2.12l4.94 4.94H4.5A1.5 1.5 0 003 12z" clip-rule="evenodd">
							</path>
						</svg>
					</span>
				</a>
			</c:if>
			<c:if test="${ isModal eq 'change' }">
				<button type="button" class="btn my-button1 ticket-btn"  onclick="openModal()">
					변경하기&nbsp;
					<span style="line-height: 1rem; display: inline-block; margin-top: 0.1rem; vertical-align: top;">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" aria-hidden="true" class="BpkIcon_bpk-icon--rtl-support__YWE2M" fill="white" style="width: 1rem; height: 1rem;">
							<path d="M3 12a1.5 1.5 0 001.5 1.5h11.379l-4.94 4.94a1.5 1.5 0 002.122 2.12l7.5-7.5a1.5 1.5 0 000-2.12l-7.5-7.5a1.5 1.5 0 00-2.122 2.12l4.94 4.94H4.5A1.5 1.5 0 003 12z" clip-rule="evenodd">
							</path>
						</svg>
					</span>
				</button>
			</c:if>
			<c:if test="${ isModal eq 'purchase' }"></c:if>
		</div>
	</div>
</div>
