<%@page import="common.Currency"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="com.apiKeys.APIKey"%>
<%@page import="com.servlet.api.beans.RoomDTO"%>
<%@page import="com.servlet.api.beans.HotelDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%HotelDTO thisHotel = (HotelDTO)session.getAttribute("selectedHotel"); 
RoomDTO thisRoom = (RoomDTO)session.getAttribute("roomInfo");
long daysDifference = ChronoUnit.DAYS.between(thisRoom.getCheckInDate(), thisRoom.getCheckOutDate());
int totalPrice = thisRoom.getRoomPrice() * Currency.JPY;
int dayPrice = (int)(totalPrice / daysDifference);
NumberFormat numFormatter = NumberFormat.getNumberInstance(Locale.getDefault());
String bed;
if(thisRoom.getBeds() > 1){
	bed = thisRoom.getBeds() + " " + thisRoom.getBedType() + " Beds";
}else
	bed = thisRoom.getBedType() + " " + "Bed";
String googleApiKey = APIKey.getGoogleAPiKey();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<title><%=thisHotel.getHotelName() %></title>
  	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bs/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mycss.css">
	<script src="https://maps.googleapis.com/maps/api/js?key=<%=googleApiKey %>&callback=initMap" async defer></script>
  	<script>
    	function initMap() {
      		// 초기 위치 설정 (예시로 서울의 위도와 경도 사용)
     	 	const myLatLng = {lat: <%= thisHotel.getLatitude()%>, lng: <%= thisHotel.getLongitude()%>};

     	 	// 지도 생성
     		const map = new google.maps.Map(document.getElementById('map'), {
     	   		center: myLatLng,
    	    	zoom: 10
   	   		});

      		// 마커 생성
      		const marker = new google.maps.Marker({
        		position: myLatLng,
        		map: map,
        		title: '<%= thisHotel.getHotelName()%>'
      		});
    	}
  </script>
  	<style>
    	#hotel-container {
      		display: flex;
      		flex-direction: column; /* 세로로 배치 */
    	}
		#main-image {
  			max-width: 100%;
  			margin: auto;
  			justify-content: center; /* 가운데 정렬 */
  			border-radius: 5px; /* 모서리를 둥글게 (선택적) */
  			box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
  			margin-bottom: 10px; /* 적절한 간격 설정 */
		}

		#thumbnail-container {
		  	display: flex;
		  	flex-direction: row;
		  	justify-content: center; /* 가운데 정렬 */
		  	margin-top: 20px; /* 적절한 간격 설정 */
		}
		
		.thumbnail {
		  	width: 200px; /* 적절한 크기 지정 */
		  	margin: 0 5px; /* 간격 지정 */
		  	cursor: pointer;
		  	display: flex; /* Flex Container로 설정 */
		  	justify-content: center; /* 가운데 정렬 */
		  	align-items: center; /* 수직 가운데 정렬 */
		  	border: 1px solid #ccc; /* 테두리 추가 (선택적) */
		  	border-radius: 3px; /* 모서리를 둥글게 (선택적) */
		}
		#hotel-section2{
		  display: flex;
		  justify-content: center; /* 가운데 정렬 */
		  margin: 20px;
		}
		#hotel-info{
			width: 60%;
		  	height: 50%;
		  	margin-bottom: 20px; /* 텍스트 블록 간격 조절 */
		  	padding: 20px;
	      
		}
		#hotel-payment{
			margin-left:9%;
			width: 40%;
		 	border-radius: 0.75rem;
		 	box-shadow: 0 1px 3px 0 rgba(37,32,31,.3);
		 	height: 50%;
	     	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
		}
		 #user-reviews {
	      max-width: 100%;
	      margin: auto;
	      padding: 20px;
	      display: flex;
	      flex-wrap: wrap;
	      justify-content: space-around; /* 중앙 정렬을 위해 space-around로 변경 */
	    }
	
	    .review-box{
	      width: 30%; /* 각 리뷰 박스의 너비, 여유분을 주기 위해 30%로 설정 */
	      margin-bottom: 20px;
	      border: 1px solid #ccc;
	      padding: 10px;
	      box-sizing: border-box;
	    }
	    
	    .review-box img,.review-box h4 {
	  	  display: inline-block;
	  	  vertical-align: middle;
		}
	
		.review-box h4 {
	  	  margin-left: 10px; /* 이미지와 제목 사이에 간격을 조절할 수 있습니다. */
		}
	
	
	     #write-review-button {
	      width: 100%; /* 버튼이 한 줄을 차지하도록 100%로 설정 */
	      padding: 10px;
	      background-color: #18b9c7;
	      color: #fff;
	      cursor: pointer;
	      border: none;
	    }
	
	 
	    .amenity {
	  		display: flex; /* 가로로 나열 */
	 	 	align-items: center; /* 수직 가운데 정렬 */
	  		margin-bottom: 12px; /* 아래쪽으로 10px의 마진 추가 */
	  		float: left;
	  		
		}
	
		.amenity img {
	  		margin-right: 10px; /* 이미지 오른쪽에 10px의 마진 추가 */
	  		
		}
		.hotel-description {
	 		 margin-up: 20px; /* 텍스트 블록 간격 조절 */
	 		 
		}
		.modal {
		    display: none;
		    position: fixed;
		    z-index: 1;
		    width: 100%; /* 또는 원하는 크기로 조절 */
		    max-width: 70%;
		    height: 50%; /* 또는 원하는 최대 크기로 조절 */
		    background-color: rgba(0, 0, 0, 0.5);
		    right: 0; /* 오른쪽 끝에 위치하도록 함 */
		    top: 0; /* 상단에 위치하도록 함 */
		    margin-right: 0; /* 오른쪽 여백을 0으로 설정하여 오른쪽으로 배치되도록 함 */
		}
		
		.modal-content {
		  background-color: white;
		  padding: 20px;
		  border-radius: 10px;
		  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		  width: 100%;
		  margin: 15% auto;
		  position: relative;
		}
		
		.close {
		  position: absolute;
		  top: 10px;
		  right: 10px;
		  font-size: 24px;
		  cursor: pointer;
		}
		
		.rating-box,
		.review-text-box {
		  margin-top: 15px;
		  width: 60%;
		  height: 20%;
		}
		
		#hotel-verification-button,
		#submitReviewButton {
		  background-color: #18b9c7;
		  color: white;
		  padding: 10px;
		  border: none;
		  border-radius: 5px;
		  cursor: pointer;
		  margin-top: 15px;
		}
		#map{
			width:100%;
			height:400px;
		}
  	</style>
</head>
<body>
<div style="max-width:70%;margin:auto;">
  	<div class="SearchContainer p-4">
		<%@ include file="module/header.jsp" %>
		<%@	include file="module/searchHeader.jsp" %>
	</div>
	<div id="hotel-container">
		<h1 style="display: flex; justify-content: center;"><%= thisHotel.getHotelName() %></h1>
    	<!-- Hotel Images Section -->
    	<div id="main-image">
      		<img src="https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/c0/03/ab/caption.jpg?w=1200&h=-1&s=1" 
      		alt="Main Hotel Image" style="width: 600px; height: 500px;">
    	</div>

    	<!-- Thumbnails Section -->
	    <div id="thumbnail-container">
	      	<img class="thumbnail" src="https://www.expedia.co.kr/stories/wp-content/uploads/2022/07/3%EC%BB%B4%ED%8F%AC%ED%8A%B8.jpg" alt="Thumbnail 1" onclick="showImage(1)">
	      	<img class="thumbnail" src="https://www.hotelrestaurant.co.kr/data/photos/20220520/art_16526598683297_5557a0.jpg" alt="Thumbnail 2" onclick="showImage(2)">
	      	<img class="thumbnail" src="https://m.shilla.net/images/contents/retreat/INPOOL/R00000009M89_KR.jpg" alt="Thumbnail 3" onclick="showImage(3)">
	      	<img class="thumbnail" src="https://wehotel.co.kr/wp-content/uploads/sites/35/2023/07/WE-Hotel-Superior-Floor-OceanSFO_m-1.jpg" alt="Thumbnail 4" onclick="showImage(4)">
	    </div>
   	</div>
   	<!-- 여기서부터 Hotel-information 영역 -->
	<div id="hotel-section2">
    	<div id="hotel-info" class="c-flex">
      		<h1>숙소 정보</h1>
      		<hr>
  			<div class="amenity">
    			<img src="img/icon/sleeping.png" alt="Sleeping PNG" style="width: 24px; height: 24px;">
    			<h3><%= bed %></h3>
    			
  			</div>
    		<div class="amenity" style="flex-wrap: wrap;">
    			<div class="r-flex me-2" style="flex:1;">
    				<img src="img/icon/wifi.png" alt="Wi-Fi PNG" style="width: 24px; height: 24px;">
    				<h4>Wi-Fi 무료</h4>
    			</div>
    			<div class="r-flex me-2" style="flex:1;">
    				<img src="img/icon/parking-area.png" alt="Parking PNG" style="width: 24px; height: 24px">
    				<h4>전용 주차공간</h4>
    			</div>
    			<div class="r-flex me-2" style="flex:1;">
    				<img src="img/icon/breakfast.png" alt="Breakfast PNG" style="width: 24px; height: 24px">
    				<h4>조식</h4>
    			</div>
    			<div class="r-flex" style="flex:1;">
    				<img src="img/icon/aircon.png" alt="Aircon PNG" style="width: 24px; height: 24px">
    				<h4>에어컨</h4>
    			</div>
  			</div>
  			<div id="hotel-description">
  				<p><%= request.getParameter("description") %></p>
  			</div>
  		</div>
    	<!-- 여기서부터 호텔 결제 부분 -->
    	<div id="hotel-payment" class="p-4">
    		<div>
    			<h3><%=numFormatter.format(dayPrice)%> 원/박</h3>
    		</div>
      		
     		<hr>
      		<div class="date-input c-flex" style="justify-content: center;">
		    	<span class="">체크인</span>
		      	<div>
		      		<%= thisRoom.getCheckInDate() %>
		      	</div>
		    </div>
     		<div class="date-input c-flex" style="justify-content: center;">
				<span class="">체크아웃</span>
				<div>
					<%= thisRoom.getCheckOutDate() %>
				</div>
			</div>	
      		<hr>
      		<h3><%=numFormatter.format(dayPrice)%>원 x <%=daysDifference %>박</h3><h3><%=numFormatter.format(totalPrice) %> 원</h3>
      		<a href="#" class="btn my-button1" style="background-color: #7b9acc">예약하기</a>
    	</div>
	</div>
	
	<div>
		<div id="map"></div>
	</div>
    <!-- 여기서부터 UserReview 부분 -->
   
    <div id="user-reviews">
	    <!-- Review Box 1 -->
	    <div class="review-box"> 
	      	<img src="img/flag/south-korea.png" alt="south-korea" style="width: 32px; height: 32px;">
	      	<h4>jinwoo-Jeon</h4>
		  	<img src="img/icon/star.png" alt="star-rating" style="width: 24px; height: 24px; margin-left: 120px;">
	  	  	<img src="img/icon/star.png" alt="star-rating" style="width: 24px; height: 24px;">
	      	<img src="img/icon/star.png" alt="star-rating" style="width: 24px; height: 24px;">
	      	<img src="img/icon/star.png" alt="star-rating" style="width: 24px; height: 24px;">
	      	<hr>
	      	<p>깔끔하고 좋아요! 조식이 아쉽지만 에어컨도 잘 나오고 무엇보다 프론트가 24시간란 점이 참 좋았던 것 같아요!</p>
	    </div>
	    <!-- Review Box 2 -->
	    <div class="review-box">
	    <img src="img/flag/united-states-of-america.png" alt="usa" style="width: 32px; height: 32px;">
	      	<h4>Robert Downey Jr</h4>
	      	<img src="img/icon/star.png" alt="star-rating" style="width: 24px; height: 24px; margin-left: 30px;">
	  	  	<img src="img/icon/star.png" alt="star-rating" style="width: 24px; height: 24px;">
	      	<img src="img/icon/star.png" alt="star-rating" style="width: 24px; height: 24px;">
	      	<img src="img/icon/star.png" alt="star-rating" style="width: 24px; height: 24px;">
	      	<img src="img/icon/star.png" alt="star-rating" style="width: 24px; height: 24px;">
	      	<hr>
	      	<p>This is great hotel. I've ever seen before like this hotel!! wonderful!!</p>
	    </div>

	    <!-- Review Box 3 -->
	    <div class="review-box">
	    <img src="img/flag/china.png" alt="china" style="width: 32px; height: 32px;">
	      	<h4>Li Yuanhao</h4>
	      	<img src="img/icon/star.png" alt="star-rating" style="width: 24px; height: 24px; margin-left: 100px;">
	  	  	<img src="img/icon/star.png" alt="star-rating" style="width: 24px; height: 24px;">
	      	<img src="img/icon/star.png" alt="star-rating" style="width: 24px; height: 24px;">
	      	<img src="img/icon/star.png" alt="star-rating" style="width: 24px; height: 24px;">
	      	<img src="img/icon/half-star.png" alt="half-star" style="width: 24px; height: 24px;">
	      	<hr>
	      	<p>非常好的设施！ 您的设施状况良好。</p>
	    </div>
    </div>
    	<!-- 리뷰 작성은 모달로 전해집니다! -->
    <div id="review-button-box">
 		 <button id="write-review-button" onclick="openModal()">이용후기 더보기</button>
	</div>
</div>
</body>
</html>
    