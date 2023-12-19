<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bs/bootstrap.css">
            <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mycss.css">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
            <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_blue.css">
<style>





.starpoint_wrap{display:inline-block;}
.star_rating {
  width: 100%; 
  box-sizing: border-box; 
  display: inline-flex; 
  float: left;
  flex-direction: row; 
  justify-content: flex-start;
}
.star_rating .star {
  width: 50px; 
  height: 50px; 
  margin-right: 10px;
  display: inline-block; 
  background: url(img/rating/blankstar.png) no-repeat; 
  background-size: 100%; 
  box-sizing: border-box; 
}
.star_rating .star.on {
  width: 50px; 
  height: 50px;
  margin-right: 10px;
  display: inline-block; 
  background: url(img/rating/star.png) no-repeat;
  background-size: 100%; 
  box-sizing: border-box; 
}

.star_box {
  width: 400px;
  box-sizing: border-box;
  display: inline-block;
  margin: 15px 0;
  background: #F3F4F8;
  border: 0;
  border-radius: 10px;
  height: 100px;
  resize: none;
  padding: 15px;
  font-size: 13px;
  font-family: sans-serif;
}
.btn02 {
  display:block;
  width: 400px;
  font-weight: bold;
  border: 0;
  border-radius: 10px;
  max-height: 50px;
  padding: 15px 0;
  font-size: 1.1em;
  text-align: center;
  background:bisque;
}
#nav-container{
			backgroundcolor: white;
            width: 400px; /* 큰 네모 크기 설정 */
            height: 660px;
            border: 2px solid #ccc; /* 테두리 설정 */
            padding: 10px; /* 안쪽 여백 설정 */
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
 <div class="container containerSize" style="padding:0;">
	<jsp:include page="module/header.jsp"/>
</div>
</head>
<body>

<div id="nav-container">
<h2>전반적 만족도</h2>
<form name="allRating" method="post" action="review.do">
    <div class="star_rating">
        <span class="star" name="arate1" onclick="setRating('all',1)"></span>
        <span class="star" name="arate2" onclick="setRating('all',2)"></span>
        <span class="star" name="arate3" onclick="setRating('all',3)"></span>
        <span class="star" name="arate4" onclick="setRating('all',4)"></span>
        <span class="star" name="arate5" onclick="setRating('all',5)"></span>
    </div>
    <div id="allRating"></div>
    <input type="hidden" id="allRatingInput" name="allRating" value="">
</form>


<form name="cleanRating" method="post" action="review.do">
    <h1>청결</h1>
    <div class="star_rating">
        <span class="star" value="1" name="clean1" onclick="setRating('clean', 1)"></span>
        <span class="star" value="2" name="clean2" onclick="setRating('clean', 2)"></span>
        <span class="star" value="3" name="clean3" onclick="setRating('clean', 3)"></span>
        <span class="star" value="4" name="clean4" onclick="setRating('clean', 4)"></span>
        <span class="star" value="5" name="clean5" onclick="setRating('clean', 5)"></span> 
    </div>
  <div id="cleanRating"></div>  
  <input type="hidden" id="cleanRatingInput" name="cleanRating" value="">
</form>

<form name="locationRating" method="post" action="review.do">
    <h1>위치</h1>
    <div class="star_rating">
        <span class="star" value="1" name="location1" onclick="setRating('location', 1)"></span>
        <span class="star" value="2" name="location2" onclick="setRating('location', 2)"></span>
        <span class="star" value="3" name="location3" onclick="setRating('location', 3)"></span>
        <span class="star" value="4" name="location4" onclick="setRating('location', 4)"></span>
        <span class="star" value="5" name="location5" onclick="setRating('location', 5)"></span>
    </div>
    <div id="locationRating"></div>
    <input type="hidden" id="locationRatingInput" name="locationRating" value="">
</form>

<form name="serviceRating" method="post" action="review.do">
    <h1>서비스</h1>
    <div class="star_rating">
        <span class="star" value="1" name="service1" onclick="setRating('service', 1)"></span>
        <span class="star" value="2" name="service2" onclick="setRating('service', 2)"></span>
        <span class="star" value="3" name="service3" onclick="setRating('service', 3)"></span>
        <span class="star" value="4" name="service4" onclick="setRating('service', 4)"></span>
        <span class="star" value="5" name="service5" onclick="setRating('service', 5)"></span>

    </div>
    <div id="serviceRating"></div>
    <input type="hidden" id="serviceRatingInput" name="serviceRating" value="">
</form>

<form name="faciRating" method="post" action="review.do">
    <h1>시설</h1>
    <div class="star_rating">
        <span class="star" value="1" name="faci1" onclick="setRating('faci', 1)"></span>
        <span class="star" value="2" name="faci2" onclick="setRating('faci', 2)"></span>
        <span class="star" value="3" name="faci3" onclick="setRating('faci', 3)"></span>
        <span class="star" value="4" name="faci4" onclick="setRating('faci', 4)"></span>
        <span class="star" value="5" name="faci5" onclick="setRating('faci', 5)"></span>
		
    </div>
    <div id="faciRating"></div>
    <input type="hidden" id="faciRatingInput" name="faciRating" value="">
</form>

</div>
<form name="contents" method="post" action="review.do">
<textarea class="star_box" placeholder="리뷰 내용을 작성해주세요." ></textarea>

<input type="submit" class="btn02" value="리뷰 등록" name="contents" />
</form>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
$('.star_rating > .star').click(function() {
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	})
function setRating(category, rating) {
    // 선택된 별점에 해당하는 숫자를 표시
    document.getElementById(category + 'Rating').innerText = '선택한 별점 : ' + rating + '점';
    
    document.getElementById(category + 'RatingInput').value = rating;
}

</script>


</body>
</html>