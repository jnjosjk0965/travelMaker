<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

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
            height: 600px;
            border: 2px solid #ccc; /* 테두리 설정 */
            padding: 10px; /* 안쪽 여백 설정 */
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
 <div class="container containerSize" style="padding:0;">
	<jsp:include page="module/header.jsp"/>
</head>
<body>
<div id="nav-container">
<h2>전반적 만족도</h2>

<div class ="star_rating">
  <span class="star on" value="1" name="score1"> </span>
  <span class="star" value="2" name="score2"> </span>
  <span class="star" value="3" name="score3"> </span>
  <span class="star" value="4" name="score4"> </span>
  <span class="star" value="5" name="score5"> </span>
</div>

<br>
<h1>청결</h1>
<div class ="star_rating">
  <span class="star on" value="1" name="rating1"> </span>
  <span class="star" value="2" name="rating2"> </span>
  <span class="star" value="3" name="rating3"> </span>
  <span class="star" value="4" name="rating4"> </span>
  <span class="star" value="5" name="rating5"> </span>
</div>

<h1>위치</h1>
<div class ="star_rating">
  <span class="star on" value="1" name="rating1"> </span>
  <span class="star" value="2" name="rating2"> </span>
  <span class="star" value="3" name="rating3"> </span>
  <span class="star" value="4" name="rating4"> </span>
  <span class="star" value="5" name="rating5"> </span>
</div>

<h1>서비스</h1>
<div class ="star_rating">
  <span class="star on" value="1" name="rating1"> </span>
  <span class="star" value="2" name="rating2"> </span>
  <span class="star" value="3" name="rating3"> </span>
  <span class="star" value="4" name="rating4"> </span>
  <span class="star" value="5" name="rating5"> </span>
</div>

<h1>시설</h1>
<div class ="star_rating">
  <span class="star on" value="1" name="rating1"> </span>
  <span class="star" value="2" name="rating2"> </span>
  <span class="star" value="3" name="rating3"> </span>
  <span class="star" value="4" name="rating4"> </span>
  <span class="star" value="5" name="rating5"> </span>
</div>

</div>
<textarea class="star_box" placeholder="리뷰 내용을 작성해주세요." ></textarea>

<input type="submit" class="btn02" value="리뷰 등록"/>
<script>
$('.star_rating > .star').click(function() {
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	})
</script>
</body>
</html>