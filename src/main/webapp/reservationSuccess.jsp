<%@page import="common.Currency"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.java.mapping.CityMapper"%>
<%@page import="com.servlet.api.beans.SearchInfo"%>
<%@page import="com.servlet.api.beans.RoomDTO"%>
<%@page import="com.servlet.api.beans.HotelDTO"%>
<%@page import="com.servlet.api.beans.FlightDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
FlightDTO flight = (FlightDTO)session.getAttribute("selected");
HotelDTO hotel = (HotelDTO)session.getAttribute("selectedHotel");
RoomDTO room = (RoomDTO)session.getAttribute("roomInfo");
SearchInfo searchInfo = (SearchInfo)session.getAttribute("searchInfo");

DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("M월 d일 (E)", new Locale("ko", "KR"));
NumberFormat numFormatter = NumberFormat.getNumberInstance(Locale.getDefault());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bs/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mycss.css">
    <title>예약 성공!</title>
    <style>
        .back-btn {
            border: none;
            background: none;
            font-size: 1.5rem; /* 원하는 폰트 크기로 조절하세요 */
            cursor: pointer;
        }

        .update-btn {
            border: none;
            background: none;
            color: blue; /* 수정 버튼 텍스트 색상을 파란색으로 설정 */
            text-decoration: underline; /* 밑줄 추가 */
            cursor: pointer;
        }
        .shadow{
        	box-shadow: 0 1px 3px 0 rgba(37,32,31,.3);
        }
		.hotel-card{
			position: relative;
			align-items: stretch;
			box-shadow: 0 1px 3px 0 rgba(37,32,31,.3);
			cursor: pointer;
			border-radius: 0.75rem;
	    	z-index: 0;
		}
		.hotel-info{
			flex: 0 0 68%;
		}
		.hotel-price{
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
    </style>
     <script>
        function goBack() {
            window.history.back();
        }
    </script>
</head>
<body>
    <div id="app-root" class="mb-5">
        <!-- 헤더/검색창 시작 -->
        <div class="SearchContainer p-5" style="background-color: #7b9acc;">
            <div class="container containerSize" style="padding:0;">
                <%@ include file="module/header.jsp" %>
            </div>
        </div>
        <!-- 헤더/검색창 끝 -->

        <!-- 여행 예약 확인 섹션 및 Card 컴포넌트 -->
        <div class="container mt-4 mx-auto">
            <div class="row">
                <!-- 여행 예약 확인 섹션 -->
                <div class="col-md-5">
                    <h2 class="my-4" style="font-weight:bold;position: relative;">
                        예약에 성공했습니다!
                    </h2>
                    <div>
 						<h4 style="font-weight:bold;"> 예약 정보 </h4> <br>
						<div>
							<h5 style="font-weight:bold;">날짜</h5>
							<div class="pb-2">
								<%=room.getCheckInDate().format(outputFormatter)%>~<%=room.getCheckOutDate().format(outputFormatter)%>
							</div>
						</div>
						<div>
							<h5 style="font-weight:bold;"> 여행자	</h5>
							<div class="pb-2">
								여행객 <%=searchInfo.getNoP()%>명
							</div>
						</div>
	                    <hr style="border-top: 2px solid #808080; margin: 30px 0;">
	
	                    <h3 style="font-weight:bold;">결제 수단</h3>
	                    <select id="paymentMethod" name="paymentMethod" class="form-control">
	                        <option value="" disabled>결제 수단 선택</option>
	                        <hr>
	                        <option value="kbBank" selected>국민은행</option>
	                        <option value="nhBank">농협은행</option>
	                        <option value="shBank">신한은행</option>
	                        <!-- 원하는 결제수단 옵션 추가 -->
	                    </select>
	                    <br>
	
	                    <hr style="border-top: 2px solid #808080; margin: 30px 0;">
	
	                    <h3 style="font-weight:bold;">
	                        환불 정책 </h3>
	                    <p style="font-weight: 600;"> 일주일 전까지 무료로 취소하실 수 있습니다. 
	                        그 후에 취소하시면 예약 대금이 환불되지 않습니다. </p> 						                   
                    </div>
				</div> <!-- 여행 예약 확인 섹션 끝 -->

                <!-- Card 컴포넌트 시작 -->
                <div class="col-md-7 mb-4">
                    <div class="card shadow p-4">
                    	<div>
                    		<div>
                    			<svg xmlns="http://www.w3.org/2000/svg" xml:space="preserve" viewBox="0 0 12 12" class="mb-3" style="height:20px;background-color: transparent;display: inline-block;">
									<path fill="#898294" d="M3.922 12h.499a.52.52 0 0 0 .444-.247L7.949 6.8l3.233-.019A.8.8 0 0 0 12 6a.8.8 0 0 0-.818-.781L7.949 5.2 4.866.246A.525.525 0 0 0 4.421 0h-.499a.523.523 0 0 0-.489.71L5.149 5.2H2.296l-.664-1.33a.523.523 0 0 0-.436-.288L0 3.509 1.097 6 0 8.491l1.196-.073a.523.523 0 0 0 .436-.288l.664-1.33h2.853l-1.716 4.49a.523.523 0 0 0 .489.71" transform="rotate(315 6 6)">
									</path>
								</svg>
                    			<span style="font-size: 20px;font-weight: bold" >항공편 정보</span>
                    		</div>
	                        <jsp:include page="module/flightCard.jsp">
								<jsp:param value="<%= flight.getOutboundAirline()%>" name="out-airline"/>
								<jsp:param value="<%= flight.getOutboundFlightNo()%>" name="out-number"/>
								<jsp:param value="<%= flight.getOutboundDuration()%>" name="out-duration"/>
								<jsp:param value="<%= flight.getOutboundDepartureTime()%>" name="out-dep-time"/>
								<jsp:param value="<%= flight.getOutboundDepartureAirport()%>" name="out-dep-airport"/>
								<jsp:param value="<%= flight.getOutboundArrivalTime()%>" name="out-arr-time"/>
								<jsp:param value="<%= flight.getOutboundArrivalAirport()%>" name="out-arr-airport"/>
								<jsp:param value="<%= flight.getReturnAirline()%>" name="ret-airline"/>
								<jsp:param value="<%= flight.getReturnFlightNo()%>" name="ret-number"/>
								<jsp:param value="<%= flight.getReturnDuration()%>" name="ret-duration"/>
								<jsp:param value="<%= flight.getReturnDepartureTime()%>" name="ret-dep-time"/>
								<jsp:param value="<%= flight.getReturnDepartureAirport()%>" name="ret-dep-airport"/>
								<jsp:param value="<%= flight.getReturnArrivalTime()%>" name="ret-arr-time"/>
								<jsp:param value="<%= flight.getReturnArrivalAirport()%>" name="ret-arr-airport"/>
								<jsp:param value="<%= flight.getFlightPrice()%>" name="price"/>
								<jsp:param value="<%= flight.getFlightPrice() * searchInfo.getNoP() %>" name="total"/>
								<jsp:param value="purchase" name="isModal"/>
							</jsp:include>
                    	</div>
                    	<div class="mt-3">
                    		<div>
	                   			<span style="font-size: 20px;font-weight: bold" >호텔 정보</span>
	                   		</div>
	                    	<div class="hotel-card r-flex p-3">
	                    		<div class="hotel-info c-flex me-2">
	                    			<div class="mb-1">
	                    				<span style="font-size: 1rem;line-height: 1.5rem;font-weight: 700;">
	                    					<%= hotel.getHotelName() %>
	                    				</span>
		                    		</div>
		                    		<div class="mb-1">
		                    			<span>객실 1개</span>
		                    			<span> <%=room.getCheckInDate().format(outputFormatter)%>~<%=room.getCheckOutDate().format(outputFormatter)%></span>
		                    			<span> <%=CityMapper.getName(CityMapper.getAirportCode(searchInfo.getDestinationLocation()))%></span>  
		                    		</div>
		                    		<div class="border border-1 rounded p-2 bg-secondary-subtle r-flex me-2"	>
		                    			<div class="me-2" style="width: 70px;height: 70px;">
		                    				<div class="w-100 h-100">
		                    					<img class="w-100 h-100" src="https://www.expedia.co.kr/stories/wp-content/uploads/2022/07/3%EC%BB%B4%ED%8F%AC%ED%8A%B8.jpg" alt="Thumbnail 1">
		                    				</div>
		                    			</div>
		                    			<div class="c-flex">
		                    				<div>여행객 <%=searchInfo.getNoP()%>명</div>
		                    				<div><%=room.getBedType()%> 사이즈 침대 <%=room.getBeds()%>개</div>
		                    			</div>
		                    		</div>
	                    		</div>
	                    		<div class="hotel-price">
	                    			<div>
										<div class="main-price">
											<span class="price">
												￦<%= numFormatter.format(room.getRoomPrice() * Currency.JPY) %>
											</span>
										</div>
									</div>
	                    		</div>
	                    	</div>
                    	</div>
                    	<div class="mt-4 r-flex justify-content-md-between">
                    		<div>
	                   			<span style="font-size: 20px;font-weight: bold" >총 합계</span>
	                   		</div>
	                   		<div>
	                   			<span style="font-size: 24px;font-weight: bold" ><%=numFormatter.format((flight.getFlightPrice() * searchInfo.getNoP()) + (room.getRoomPrice() * Currency.JPY))%>원</span>
	                   		</div>
                    	</div>
                    </div>
                </div> <!-- Card 컴포넌트 끝 -->
            </div>
        </div>
    </div>

    <!-- 푸터 시작 -->
    <jsp:include page="module/footer.jsp" flush="false" />
    <!-- 푸터 끝 -->

    <jsp:include page="module/loginModal.jsp" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="js/bs/bootstrap.bundle.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="js/button.js"></script>
    <script src="js/app.js"></script>
</body>

</html>
