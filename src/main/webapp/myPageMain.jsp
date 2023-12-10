<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Maker</title>
    <!-- jQuery CDN 링크 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    
   <style>
        #nav-container {
        	backgroundcolor: white;
            width: 400px; /* 큰 네모 크기 설정 */
            height: 720px;
            border: 2px solid #ccc; /* 테두리 설정 */
            padding: 10px; /* 안쪽 여백 설정 */
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
            position: absolute;
            top: 150px;
            left: 300px;
        }
        #nav-content-user {
            width: 400px; /* 큰 네모 크기 설정 */
            height: 720px;
            
            padding: 1px; /* 안쪽 여백 설정 */
            position: absolute;
            top: 150px;
            right: 300px;
            display: none;
        }
        #nav-content-account {
            width: 400px; /* 큰 네모 크기 설정 */
            height: 720px;
            
            padding: 1px; /* 안쪽 여백 설정 */
            position: absolute;
            top: 150px;
            right: 300px;
            display: none;
        }
        #nav-content-reservation {
            width: 400px; /* 큰 네모 크기 설정 */
            height: 720px;
            
            padding: 1px; /* 안쪽 여백 설정 */
            position: absolute;
            top: 150px;
            right: 300px;
            display: none;
        }
        #nav-content-review {
            width: 400px; /* 큰 네모 크기 설정 */
            height: 720px;
            
            padding: 1px; /* 안쪽 여백 설정 */
            position: absolute;
            top: 150px;
            right: 300px;
            display: none;
        }
     

        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        li {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 5px; /* 각 링크 사이의 간격 설정 */
        }

        li a {
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

        li a:hover {
            background-color: #aaa; /* 호버 시 배경색 변경 */
        }
        li p {
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
        
   
    </style>
    <script>
        // 페이지 내용을 동적으로 로드하는 함수
        function toggleContent(contentId) {
    var navContentuser = document.getElementById("nav-content-user");
    var navContentaccount = document.getElementById("nav-content-account");
    var navContentreservation = document.getElementById("nav-content-reservation");
    var navContentreview = document.getElementById("nav-content-review"); 

    // 모든 nav-content를 숨김
    navContentuser.style.display = "none";
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
  <div class="SearchContainer p-5" ">
		<h1>Header부분</h1>
	</div>
    <hr>
		<div id="nav-container">
		 <div class="image-container">
        <img src="img/icon/user_icon.png" alt="User Profile">
        <div class="text">[사용자]</div>
        </div>
		<br>
        <!-- 항목 목록 -->
        <ul>
            <li><a href="#" onclick="toggleContent('nav-content-user')"><img src="img/icon/user_icon.png" alt="User Profile" style="width: 40px; height: 40px;">
            회원 정보<br><p>문의하고 싶은 내용을 입력해주세요</p></a></li>
            <li><a href="#" onclick="toggleContent('nav-content-account')"><img src="img/icon/account_icon.png" alt="User Account" style="width: 40px; height: 40px;">
            계정<br><p>계정 정보를 관리하세요</p></a></li>
            <li><a href="#" onclick="toggleContent('nav-content-reservation')"><img src="img/icon/reservation_icon.png" alt="User Reservation" style="width: 40px; height: 40px;">
            내 예약<br><p>예약 정보를 확인하고 관리하세요</p></a></li>
            <li><a href="#" onclick="toggleContent('nav-content-review')"><img src="img/icon/review_icon.png" alt="User Review" style="width: 40px; height: 40px;">
            리뷰 관리<br><p>당신이 여행한 곳을 알려주세요</p></a></li>
        </ul>
    </div>
	
    
    <div id="nav-content-user">
        <h1 style="text-align: center;">여행객 상세 정보</h1>
        <br>
        <ul>
        	<h3>이름*</h3>
        	<li><input type="text" placeholder="내용을 입력해주세요" style="width: 600px; height:40px;"></li>
        	<h3>성*</h3>
        	<li><input type="text" placeholder="내용을 입력해주세요" style="width: 600px; height:40px;"></li>
        	<li><p>※여권과 일치해야합니다.</p></li>
        	<h3>성별</h3>
        	<input type="radio" name="gender">남성<input type="radio" name="gender">여성<br>
        	<h3>국가/지역</h3>
        	<li>
        	<form action="#">
  			<select name="local" id="local" placeholder="국가/지역 선택" style="width: 400px; height: 40px;">
    		<option value="GMP">대한민국/서울</option>
    		<option value="GMP">대한민국/강원도</option>
    		<option value="GMP">대한민국/대전</option>
    		<option value="GMP">대한민국/부산</option>
    		<option value="GMP">대한민국/광주</option>
    		<option value="GMP">대한민국/대구</option>
    		<option value="GMP">대한민국/충남</option>
    		<option value="GMP">대한민국/충북</option>
    		<option value="GMP">대한민국/경남</option>
    		<option value="GMP">대한민국/경북</option>
    		<option value="GMP">대한민국/전남</option>
    		<option value="GMP">대한민국/전북</option>
    		<option value="GMP">대한민국/경기도</option>
    		
  			</select>
        	</form>
        	</li>
        	<h3>생년월일</h3>
        	<li><input type="text" placeholder="내용을 입력해주세요" style="width: 600px; height:40px;"></li>
        	<br>
        	<input type="submit" value="저장하기" style="width:110px; height: 40px; position: absolute; right: 3px">
        </ul>
    </div>
    <div id="nav-content-account">
    <h1 style="text-align: center;">계정</h1>
    <h3>이메일</h3>
    <input type="email" name="email"style="width: 400px; height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;">
    <hr>
    <li>
    <h3>비밀번호</h3>
    <input type="submit" value="비밀번호 변경" style="width:110px; height: 40px; position: absolute; right: 3px">
    
   	</li>
    <input type="password" name="pwd"style="width: 400px; height:40px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; ">
    <hr>
    <h3>기기 접속 기록</h3>
    <br>
    <hr>
    <li>
    <h3>계정</h3>
    <input type="submit" value="계정 탈퇴" style="width:110px; height: 40px; position: absolute; right: 3px">
    </li>
    </div>
       <div id="nav-content-reservation">
    <h1 style="text-align: center;">내 예약</h1>
    
    </div>
       <div id="nav-content-review">
    <h1 style="text-align: center;">작성한 리뷰</h1>
    
    </div>
</body>
</html>
    