<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
	 border: 4px dashed #bcbcbc;
	 width: 30%;
	 height: 50%;
	 padding: 10px; /* 안쪽 여백 설정 */
     box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);

	}
  .youtube-video {
    width: 67.5%;
    padding: 5px; /* 안쪽 여백 설정 */
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

  </style>

</head>
<body>

  <div class="container containerSize" style="padding:0;">
	<jsp:include page="module/header.jsp"/>
</div>
	<div id="hotel-container">
	<h1 style="display: flex; justify-content: center;">Mitsui Garden Hotel</h1>
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
	
    <div id="hotel-info">
      <h1>숙소 정보</h1>
      <hr>
  <div class="amenity">
    <img src="img/icon/sleeping.png" alt="Sleeping PNG" style="width: 24px; height: 24px;">
    <h3>더블 베드</h3>
  </div>

    <div class="amenity">
    <img src="img/icon/wifi.png" alt="Wi-Fi PNG" style="width: 24px; height: 24px;">
    <h3>Wi-Fi 무료</h3>
  
    <img src="img/icon/parking-area.png" alt="Parking PNG" style="width: 24px; height: 24px">
    <h3>전용 주차공간</h3>
  
    <img src="img/icon/breakfast.png" alt="Breakfast PNG" style="width: 24px; height: 24px">
    <h3>조식</h3>
  
    <img src="img/icon/aircon.png" alt="Aircon PNG" style="width: 24px; height: 24px">
    <h3>에어컨</h3>
  </div>
  <br>
  <br>
  <br>
  	<div id="hotel-description">
  		<p>도쿄 내 타이토 구역의 매력적인 곳에 자리한 Toyoko Inn Tokyo Asakusa Kuramae No.2에서 머물러보세요. 
  		</p>
  		    <p>숙소는
  			Kuramae Jinja Shrine에서 2분 거리, Kuramae Mizu no Yakata에서 400m, World Bags and Luggage Museum에서<br> 
  			8분 거리에 있습니다.
  			
  			</p>
  			<p> 해당 3성급 호텔에는 24시간 프런트 데스크,조식 등이 완비되어 있습니다. 
  			</p>
  		</p>
  		<p>무료 Wi-Fi, 조식 및 유료 전용 주차장 이용이 가능합니다.
  		</p>
  			<div class="youtube-video">
    		<iframe width="560" height="315" src="https://www.youtube.com/embed/E87JmA7zqyU?si=q4QXAzzNKvQZZFS0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen>
    		</iframe>
			
  			</div>
  		</div>
  		
    </div>
    
    
    <!-- 여기서부터 호텔 결제 부분 -->
    
    
    	<div id="hotel-payment">
      <h3 style="position: absolute; right: 7%">140,800원/박</h3>
      <h4>★ 4.9</h4>
     
      <hr>
      <p>출발일</p>
      <div class="date-input c-flex" style="justify-content: center;">
		      <span class="Input_Label"></span>
		      <input type="date" class="form-control none-deco-input" id="checkIn" name="departureDate">
		      </div>
      <p>도착일</p>
     <div class="date-input c-flex" style="justify-content: center;">
		             <span class="Input_Label"></span>
		             <input type="date" class="form-control none-deco-input" id="checkOut" name="returnDate">
		</div>	
      <hr>
      
      <h3>140,800원 / 3박</h3><h3 style="position: absolute;  right: 7%; top: 146%;">422,400 원</h3>
      <button type="submit" style="text-align: center; width: 415px; height: 30px; border-radius: 3px; text-size: 50px;
      background-color: #4CAF50;
      ">추가</button>
    </div>
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

		
 
</body>
</html>
    