<%@page import="com.servlet.api.beans.HotelDTO"%>
<%@page import="com.servlet.api.beans.RoomDTO"%>
<%@page import="com.servlet.api.beans.FlightDTO"%>
<%@page import="com.java.user.ReservationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
UserDTO user = (UserDTO)session.getAttribute("userinfo");
ArrayList<ReservationDTO> resvList = (ArrayList<ReservationDTO>)request.getAttribute("resvList");
ArrayList<FlightDTO> flightList = (ArrayList<FlightDTO>)request.getAttribute("flightList");
ArrayList<RoomDTO> roomList = (ArrayList<RoomDTO>)request.getAttribute("roomList");
ArrayList<HotelDTO> hotelList = (ArrayList<HotelDTO>)request.getAttribute("hotelList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bs/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mycss.css">
    <title>Travel Maker</title>
    <!-- jQuery CDN 링크 추가 -->
   	<style>
        #nav-container {
        	backgroundcolor: white;
            width: 400px; /* 큰 네모 크기 설정 */
            height: 90vh;
            border: 2px solid #ccc; /* 테두리 설정 */
            padding: 10px; /* 안쪽 여백 설정 */
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
        }
        #nav-content-reservation,
        #nav-content-review {
        	width: 40rem;
            height: 90vh;
            padding: 1px; /* 안쪽 여백 설정 */
            display: none;
        }
        #nav-content-account{
        	width: 40rem;
            height: 90vh;
            padding: 1px; /* 안쪽 여백 설정 */
        }
        .func-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .func-list-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 5px; /* 각 링크 사이의 간격 설정 */
        }

        .func-list-item a {
            display: block; /* 세로로 배치하기 위해 변경 */
            text-align: left; /* 텍스트 우측 정렬 */
            line-height: 30px; /* 세로 중앙 정렬 */
            text-decoration: none;
            color: #333; /* 텍스트 색상 설정 */
            border-radius: 5px; /* 모서리 둥글게 설정 */
            padding: 5px; /* 내부 여백 설정 */
            flex-grow: 1; /* 네모가 공간을 채우도록 설정 */
            font-size: 30px;
        }

        .func-list-item a:hover {
            background-color: #aaa; /* 호버 시 배경색 변경 */
        }
        .func-list-item span {
        	font-size: 15px;
        	display: flex;
        }
           
        .image-container {
            text-align: center;
            margin-top: 20px; /* 상단 여백 조절 */
        }

        .image-container img {
            width: 150px; /* 이미지 너비 */
            height: 150px; /* 이미지 높이 */
            display: block; /* 세로로 정렬하기 위해 블록 요소로 설정 */
            margin: 0 auto; /* 가운데 정렬 */
        }

        .text {
            margin-top: 20px; /* 이미지 아래 텍스트와의 간격 조절 */
            text-align: center;
            text-size: 15px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            font-family: Arial, sans-serif;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
   
    </style>
    <script>
        // 페이지 내용을 동적으로 로드하는 함수
       	function toggleContent(contentId) {
    	const navContentaccount = document.getElementById("nav-content-account");
    	const navContentreservation = document.getElementById("nav-content-reservation");
		const navContentreview = document.getElementById("nav-content-review"); 

	    // 모든 nav-content를 숨김
	    navContentaccount.style.display = "none";
	    navContentreservation.style.display = "none";
	    navContentreview.style.display = "none";
	    
	    // 클릭한 contentId에 해당하는 nav-content를 표시
	    var navContent = document.getElementById(contentId);
	    if (navContent.style.display === "none") {
	        navContent.style.display = "block";
	    } else {
	        navContent.style.display = "none";
	    }
}
    </script>
</head>
<body>
  	<div class="SearchContainer p-4 pb-1" style="background-color: #7b9acc;">
		<%@ include file="module/header.jsp" %>
	</div>
	<!-- 바디 -->
	<div class="r-flex p-3 mx-auto"> 
		<div id="nav-container">
			<div class="image-container">
	        	<img src="img/icon/user_icon.png" alt="User Profile">
	        	<div class="text"><%=user.getUserNName() %></div>
	        </div>
	        <!-- 항목 목록 -->
	        <div class="func-list">
	            <div class="func-list-item">
	            	<a href="#" onclick="toggleContent('nav-content-account')">
	            		<img src="img/icon/account_icon.png" alt="User Account" style="width: 40px; height: 40px;">
	            		계정
	            		<span>계정 정보를 관리하세요</span>
	            	</a>
	            </div>
	            <div class="func-list-item">
	            	<a href="#" onclick="toggleContent('nav-content-reservation')">
	            		<img src="img/icon/reservation_icon.png" alt="User Reservation" style="width: 40px; height: 40px;">
	            		내 예약
	            		<span>예약 정보를 확인하고 관리하세요</span>
	            	</a>
	            </div>
	            <div class="func-list-item">
	            	<a href="#" onclick="toggleContent('nav-content-review')">
	            		<img src="img/icon/review_icon.png" alt="User Review" style="width: 40px; height: 40px;">
	            		리뷰 관리
	            		<span>당신이 여행한 곳을 알려주세요</span>
	            	</a>
	            </div>
	        </div>
    	</div>
    	<!-- 기능들 -->
		<div class="m-3">
    		<div id="nav-content-account" class="ms-5">
    			<h1 style="text-align: center;">계정</h1>
    			<div class="c-flex">
    				<form action="">
    					<h3>이메일</h3>
    					<input type="email" name="email" readonly="readonly" value="<%=user.getUserEmail() %>" style="width: 400px; height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;">
		    			<hr>
    					<h3>계정</h3>
    					<input class="btn btn-danger" type="submit" value="계정 탈퇴" style="width:110px; height: 40px;">
    				</form>
    			</div>
    		</div>
	       	<div id="nav-content-reservation">
	    		<h1 style="text-align: center;">내 예약</h1>
	    		<form action="/TravelMaker/DeleteReservation.do" method="post">
	    			<table>
					    <thead>
					        <tr>
					        	<th></th>
					            <th>예약 번호</th>
					            <th>호텔 이름</th>
					            <th>체크인 날짜</th>
					            <th>체크아웃 날짜</th>
					            <th>출발지</th>
					            <th>도착지</th>
					        </tr>
					    </thead>
					    <tbody>
					    	<%
					    	if(resvList != null){
					    		for(int i = 0; i < resvList.size(); i++){
						    		ReservationDTO tresv = resvList.get(i);
						    		FlightDTO tflight = flightList.get(i);
						    		RoomDTO troom = roomList.get(i);
						    		HotelDTO thotel = hotelList.get(i);
						    		%>
						            <tr>
						                <td>
						                    <input type="checkbox" name="resvIdCheckbox" value="<%=tresv.getResvId()%>">
						                </td>
						                <td><%=tresv.getResvId()%></td>
						                <td><%=thotel.getHotelName()%></td>
						                <td><%=troom.getCheckInDate()%></td>
						                <td><%=troom.getCheckOutDate()%></td>
						                <td><%=tflight.getOutboundDepartureAirport()%></td>
						                <td><%=tflight.getOutboundArrivalAirport()%></td>
						            </tr>
							<%
						    	}	
					    	}
					    	%>
					    </tbody>
					</table>
					<div class="text-end mt-3">
						<input class="btn btn-danger" type="submit" value="예약 취소" style="width:100px;">
					</div>
	    		</form>    
	    	</div>
	       	<div id="nav-content-review">
	    		<h1 style="text-align: center;">작성한 리뷰</h1>
	    	</div>
		</div>
	</div>	
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="js/bs/bootstrap.bundle.js"></script>
</body>
</html>
    