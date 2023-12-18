<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        .update-btn{
        	border: none;
        	background: none;
        	color: blue; /* 수정 버튼 텍스트 색상을 파란색으로 설정 */
            text-decoration: underline; /* 밑줄 추가 */
            cursor: pointer;
                
        }

    </style>
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
                        <button id="back_button" class="back-btn" >
						    &lt;
						</button>
                        확인 및 결제
                    </h2>
                    <h4 style="font-weight:bold;"> 예약 정보 </h4> <br>

                    <h5 style="font-weight:bold;">날짜  
                        <button id="update_button" class="update-btn">
                             수정 
                        </button>
                    </h5>
                    <br>

                    <h5 style="font-weight:bold;">  여행자
                        <button id="update_button" class="update-btn">
                             수정 
                        </button> 
                    </h5>
                     <br>

                    <hr style="border-top: 2px solid #808080; margin: 30px 0;">

                    <h3 style="font-weight:bold;"> 
                        결제 수단 </h3>  <br>
                    <select id="paymentMethod" name="paymentMethod" class="form-control" value="결제방식">
                        <option value="creditCard">신용카드</option>
                        <option value="kbBank">국민은행</option>
					    <option value="nhBank">농협은행</option>
					    <option value="shBank">신한은행</option>
                        <!-- 원하는 결제수단 옵션 추가 -->
                    </select>
                    <br>

                    <hr style="border-top: 2px solid #808080; margin: 30px 0;">

                    <h3 style="font-weight:bold;"> 
                        환불 정책 </h3>
                    <h6> ~ 전까지 무료로 취소하실 수 있습니다. <br> 
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
                    <div class="card" >
                        <div class="flex flex-col space-y-1.5 p-6">
                            <h3 class="text-2xl font-semibold leading-none tracking-tight">왕복 항공</h3>
                            <p class="text-sm text-muted-foreground">성인 1명</p>
                        </div>
                        <div class="p-6">
                            <div class="flex justify-between items-center mb-4">
                                <div class="w-24 h-24 bg-gray-200"></div>
                                <div>
                                    <p class="font-semibold">인천 ICN</p>
                                    <p>16:40</p>
                                    <p>2시간 20분</p>
                                    <!-- PlaneIcon 컴포넌트의 HTML 구조 -->
                                    <!-- PlaneIcon은 SVG 아이콘을 렌더링하는 컴포넌트 -->
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round"
                                        strokeLinejoin="round" class="text-gray-500">
                                        <path
                                            d="M17.8 19.2 16 11l3.5-3.5C21 6 21.5 4 21 3c-1-.5-3 0-4.5 1.5L13 8 4.8 6.2c-.5-.1-.9.1-1.1.5l-.3.5c-.2.5-.1 1 .3 1.3L9 12l-2 3H4l-1 1 3 2 2 3 1-1v-3l3-2 3.5 5.3c.3.4.8.5 1.3.3l.5-.2c.4-.3.6-.7.5-1.2z">
                                        </path>
                                    </svg>
                                    <p>도쿄(나리타) NRT</p>
                                    <p>19:00</p>
                                </div>
                                <div>
                                    <p class="font-semibold">도쿄(나리타) NRT</p>
                                    <p>11:25</p>
                                    <p>2시간 40분</p>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round"
                                        strokeLinejoin="round" class="text-gray-500">
                                        <path
                                            d="M17.8 19.2 16 11l3.5-3.5C21 6 21.5 4 21 3c-1-.5-3 0-4.5 1.5L13 8 4.8 6.2c-.5-.1-.9.1-1.1.5l-.3.5c-.2.5-.1 1 .3 1.3L9 12l-2 3H4l-1 1 3 2 2 3 1-1v-3l3-2 3.5 5.3c.3.4.8.5 1.3.3l.5-.2c.4-.3.6-.7.5-1.2z">
                                        </path>
                                    </svg>
                                    <p>인천 ICN</p>
                                    <p>14:05</p>
                                </div>
                            </div>
                        </div>
                        <div class="items-center p-6 flex justify-between">
                            <div>
                                <h3 style="font-weight:bold;"> 요금 세부 정보</h3>
                                <p class="mb-1:bold"> 숙박 요금</p>
                                <!--  요숙박 요금 -->
                                <p class="mb-1:bold"> 항공권</p>
                                <!-- 항공권요금 -->
                            </div>
                            <div>
                                <h3 class="font-semibold mb-1">총 합계</h3>
                                <p class="text-xl font-bold">665,000원</p>
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
    
        <jsp:include page="module/loginModal.jsp"/>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="js/button.js"></script>
        <script src="js/app.js"></script>
    </body>

</html>
