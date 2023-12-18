<%@page import="java.util.Locale"%>
<%@page import="common.Currency"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.hotel-card{
		display: flex;
		padding: 1.5rem;
		background-color: #eee;
		box-shadow: 0 1px 3px 0 rgba(37,32,31,.3);
		border-radius: 0.75rem;
	}
	.hotel-card .hotelImg{
		width: 192px;
		height: 192px;
		position: relative;
		display: inline-flex;
		flex-shrink: 0;
		cursor: pointer;
	}.hotel-card .hotelInfo{
		display: flex;
    	flex-direction: column;
    	flex-grow: 1;
    	padding-right: 16px;
    	border-right: 1px solid #dadfe6;
    	justify-content: space-between;
	}.title-info{
		
	}
</style>
<% 
String hotelId = request.getParameter("hotelId");
String hotelName = request.getParameter("hotelName");
String latitude = request.getParameter("latitude"); 
String longitude = request.getParameter("longitude");
String roomId = request.getParameter("roomId");
String checkInDate = request.getParameter("checkInDate");
String checkOutDate = request.getParameter("checkOutDate");
String roomType = request.getParameter("roomType");
String roomPrice = request.getParameter("roomPrice");

String queryString = "?hotelId=" + hotelId +"&hotelName=" + hotelName + "&latitude=" + latitude +"&longitude=" + longitude +
					"&roomId=" + roomId + "&checkInDate=" + checkInDate + "&checkOutDate=" + checkOutDate + 
					"&roomType=" + roomType + "&roomPrice=" + roomPrice;

NumberFormat numFormatter = NumberFormat.getNumberInstance(Locale.getDefault());
int krwPrice = Integer.parseInt(roomPrice) * Currency.JPY;
%>

<div class="hotel-card mb-1">
	<div class="hotelImg">
		<div style="width: 100%;height: 100%;">
			<img src="https://ak-d.tripcdn.com/images/220j0u000000jbzbr714C_C_300_225_R5.jpg" style="width: 100%; height: 100%; object-fit: cover;object-position: center center;background-color: rgb(240, 242, 245);">
		</div>
	</div>
	<div class="hotelInfo mx-3">
		<div style="cursor: pointer;">
			<div class="title-info">
				<a href="/TravelMaker/SelectHotel.do<%=queryString + "&showDetail=True"%>">
					<span style="font-size: 18px;font-weight: bold">
						<%= hotelName %>
					</span>
				</a>
			</div>
		</div>
	</div>
	<div class="c-flex justify-content-md-between">
		<span><%= numFormatter.format(krwPrice) %> 원</span>
		<a href="/TravelMaker/SelectHotel.do<%=queryString + "&showDetail=False"%>" class="btn my-button1 ticket-btn" >
			예약&nbsp;
			<span style="line-height: 1rem; display: inline-block; margin-top: 0.1rem; vertical-align: top;">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" aria-hidden="true" class="BpkIcon_bpk-icon--rtl-support__YWE2M" fill="white" style="width: 1rem; height: 1rem;">
					<path d="M3 12a1.5 1.5 0 001.5 1.5h11.379l-4.94 4.94a1.5 1.5 0 002.122 2.12l7.5-7.5a1.5 1.5 0 000-2.12l-7.5-7.5a1.5 1.5 0 00-2.122 2.12l4.94 4.94H4.5A1.5 1.5 0 003 12z" clip-rule="evenodd">
					</path>
				</svg>
			</span>
		</a>
	</div>
</div>