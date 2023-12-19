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
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bs/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mycss.css">
    <title>결제</title>
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
<<<<<<< HEAD
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
=======
>>>>>>> 0ee7c2f7b79a1acf3fe20522865a918f091e347c
    </style>
     <script>
        function goBack() {
            window.history.back();
        }
    </script>
</head>
<body>
    <div id="app-root">
        <!-- 헤더/검색창 시작 -->
        <div class="SearchContainer p-5" style="background-color: #7b9acc;">
            <div class="container containerSize" style="padding:0;">
                <%@ include file="module/header.jsp" %>
            </div>
        </div>
        <!-- 헤더/검색창 끝 -->

        <!-- 여행 예약 확인 섹션 및 Card 컴포넌트 -->
        <div class="container mt-5">
            <div class="row">
                <!-- 여행 예약 확인 섹션 -->
                <div class="col-md-6">
                    <h2 class="mt-5 mb-4" style="font-weight:bold;">
                        <button id="back_button" class="back-btn" onclick="goBack()">
                            &lt;
                        </button>
                        확인 및 결제
                    </h2>
                    <h4 style="font-weight:bold;"> 예약 정보 </h4> <br>

                    <h5 style="font-weight:bold;">날짜
                        <button id="update_button" class="update-btn" onclick="toggleDateEdit('editDate')">
                            가는날 수정
                        </button>
                        <input type="date" id="editDate" style="display: none;"> ~
                        <button id="update_button2" class="update-btn" onclick="toggleDateEdit('editDate2')">
                            오는날 수정
                        </button>
                        <input type="date" id="editDate2" style="display: none;">
                    </h5>
                    <br>

                    <h5 style="font-weight:bold;"> 여행자
					    <button id="update_button2" class="update-btn" onclick="toggleTravelerEdit()">
					        수정
					    </button>
					    <div id="travelerEdit" style="display: none;">
					        성인: <input type="number" id="adultsInput" value="1" min="1"><br>
					        유아: <input type="number" id="childrenInput" value="0" min="0">
					        <button id="confirmTraveler" class="update-btn" onclick="confirmTravelerEdit()">확인</button>
					    </div>
					</h5>
                    <br>

                    <hr style="border-top: 2px solid #808080; margin: 30px 0;">

                    <h3 style="font-weight:bold;">
                        결제 수단 </h3> <br>
                    <select id="paymentMethod" name="paymentMethod" class="form-control" value="결제방식">
                        <option> </option>
                        <option value="kbBank">국민은행</option>
                        <option value="nhBank">농협은행</option>
                        <option value="shBank">신한은행</option>
                        <!-- 원하는 결제수단 옵션 추가 -->
                    </select>
                    <br>

                    <hr style="border-top: 2px solid #808080; margin: 30px 0;">

                    <h3 style="font-weight:bold;">
                        환불 정책 </h3>
                    <h6> 일주일 전까지 무료로 취소하실 수 있습니다. <br>
                        그 후에 취소하시면 예약 대금이 환불되지 않습니다. </h6>
                    <br>

                    <button id="login-button" type="button" class="btn my-button1">
                        <span style="font-size:1rem; line-height:1.5rem; text-overflow: ellipsis; white-space: nowrap;overflow: hidden; ">
                            확인 및 결제
                        </span>
                    </button>
                </div> <!-- 여행 예약 확인 섹션 끝 -->

                <!-- Card 컴포넌트 시작 -->
                <div class="col-md-6 mb-4">
<<<<<<< HEAD
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
                    	<div>
                    		<div>
	                   			<span style="font-size: 20px;font-weight: bold" >호텔 정보</span>
	                   		</div>
	                    	<div class="hotel-card r-flex">
	                    		<div class="hotel-info c-flex">
	                    			<div>
		                    			호텔이름
		                    		</div>
		                    		<div>
		                    			객실 1개 일정 도쿄
		                    		</div>
		                    		<div>
		                    			사진 및 방 설명
		                    		</div>
	                    		</div>
	                    		<div class="hotel-price">
	                    			대충 가격
	                    		</div>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="js/button.js"></script>
    <script src="js/app.js"></script>
	<script>
	    function toggleDateEdit() {
	        var dateInput1 = document.getElementById("editDate");
	        var dateInput2 = document.getElementById("editDate2");
	
	        if (dateInput1.style.display === "none" || dateInput1.style.display === "") {
	            dateInput1.style.display = "inline-block";
	            dateInput2.style.display = "inline-block";
	        } else {
	            dateInput1.style.display = "none";
	            dateInput2.style.display = "none";
	        }
	    }
	</script>
	<script>
	    function toggleTravelerEdit() {
	        var travelerEdit = document.getElementById("travelerEdit");
	
	        if (travelerEdit.style.display === "none" || travelerEdit.style.display === "") {
	            travelerEdit.style.display = "block";
	        } else {
	            travelerEdit.style.display = "none";
	        }
	    }
	
	    function confirmTravelerEdit() {
	        var adultsInput = document.getElementById("adultsInput").value;
	        var childrenInput = document.getElementById("childrenInput").value;
	
	        // Perform any additional logic or validation as needed
	
	        // Update the display or perform other actions with the new values
	        alert("성인: " + adultsInput + ", 유아: " + childrenInput);
	
	        // Hide the traveler edit section after confirming
	        toggleTravelerEdit();
	    }
	</script>
</body>

</html>
