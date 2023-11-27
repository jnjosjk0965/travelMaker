<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="UTF-8">
            <link rel="stylesheet" href="css/bootstrap.css">
            <title>Travel Maker</title>
            <style>
            	/*
            	main color
            	푸른 계열 #7b9acc
            	베이지 #FCF6F5
            	*/
            	.none-deco-input{
            		border: none;
            		padding: 0;
            	}
                .departure-input{
                    flex: 0 0 auto;
                    width: 10.125rem;
                }
                .date-input{
                	flex: 0 0 auto;
                	width: 6rem;
    				max-width: 10.125rem;
                }
                .firstSearchBar{
                	border-radius: 0.75rem 0 0 0.75rem;
                }
                .lastSearchBar{
    	            width: 10rem;
    				max-width: 13rem;
                	border-radius: 0 0.75rem 0.75rem 0;
                }
                .SearchBar{
                	display: flex;
                	flex-wrap: wrap;
                	grid-column-gap: 0.25rem;
    				column-gap: 0.25rem;
    				flex-wrap: wrap;
                }
                .departure-input,
				.date-input,
				.lastSearchBar {
				  	flex: 1;
				  	height: 4.5rem;
				}
                .SearchBar>div:not(:last-child){
                	background-color: white;
                }
                .containerSize{
                	margin: 0 auto;
    				max-width: 76.5rem;
                }
                .c-flex {
					display: flex;
				  	flex-direction: column;
				}
				.r-flex {
				  	display: flex;
				  	flex-direction: row;
				}
            </style>
        </head>
        <body>
            <div id="app-root">
            	<!-- header/검색창 start -->
                <div class="SearchContainer p-5" style="background-color: #7b9acc;">
                    <div class="container containerSize">
                        <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between pt-2 mb-4">
                            <div class="col-md-3 mb-2 mb-md-0">
                                <a href="/" class="d-inline-flex link-body-emphasis text-decoration-none">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="100" height="45" viewBox="0 0 100 45">
										<image href="img/logo/logo_text.png" width="100" height="45"/>
									</svg>
                                </a>
                            </div>            
                            <div class="col-md-3 text-end">
                                <button type="button" class="btn btn-primary">로그인</button>
                            </div>
                        </header>
                        <h2 class="mt-5 mb-4" style="font-weight:bold;">당신의 여행은 지금부터</h2>
                        <form>
                        	<div class="SearchBar row g-3">
                            
                                <div class="departure-input firstSearchBar c-flex" style="justify-content: center;">
                                    <label for="departure">출발지</label>
                                    <input type="text" class="form-control none-deco-input" id="departure" placeholder="출발지를 입력하세요">
                                </div>
                                <div class="departure-input c-flex" style="justify-content: center;">
                                    <label for="destination">도착지</label>
                                    <input type="text" class="form-control none-deco-input" id="destination" placeholder="도착지를 입력하세요">
                                </div>
                                <div class="date-input c-flex" style="justify-content: center;">
                                    <label for="departDate">가는 날짜</label>
                                    <input type="date" class="form-control none-deco-input" id="departDate">
                                </div>
                                <div class="date-input c-flex" style="justify-content: center;">
                                    <label for="returnDate">오는 날짜</label>
                                    <input type="date" class="form-control none-deco-input" id="returnDate">
                                </div>
                                <div class="date-input lastSearchBar c-flex" style="justify-content: center;">
                                    <label for="travelers">여행자 수</label>
                                    <input type="number" class="form-control none-deco-input" id="travelers" min="1">
                                </div>
                                <div class="" style="width: fit-content;">
                                    <button type="submit" class="btn btn-primary w-100 h-100">검색</button>
                                </div>
                        	</div>
                        </form>
                    </div>
                </div>
                <!-- header/검색창 end -->
                <!-- body start -->
                <div>
                    <section class="my-5">
                            
                        <div class="container mt-5">
                            <h2 class="mt-5 mb-4" style="font-weight:bold;">인기 있는 여행지</h2>
                            <div class="row">
                              <div class="col-md-3 mb-4 px-4">
                                <div class="custom-card">
                                  <img src="img/home/osaka.jpg" alt="Osaka" width="200" height="270">
                                  <div class="card-content">
                                    <h2 style="font-family:'Black Han Sans', sans-serif, Helvetica, Arial;">오사카</h2>
                                    <p>다양한 매력의 도시</p>
                                  </div>
                                </div>
                              </div>
                          
                              <div class="col-md-3 mb-4 px-4">
                                <div class="custom-card">
                                  <img src="img/home/fukuoka.jpg" alt="Fukuoka" width="200" height="270">
                                  <div class="card-content">
                                    <h2 style="font-family:'Black Han Sans', sans-serif, Helvetica, Arial;">후쿠오카</h2>
                                    <p>원하는 대로 즐기는 일본</p>
                                  </div>
                                </div>
                              </div>
                          
                              <div class="col-md-3 mb-4 px-4">
                                <div class="custom-card">
                                  <img src="img/home/jeju.jpg" alt="jeju" width="200" height="270">
                                  <div class="card-content">
                                    <h2 style="font-family:'Black Han Sans', sans-serif, Helvetica, Arial;">제주</h2>
                                    <p>신비로운 자연과 푸른 바다</p>
                                  </div>
                                </div>
                              </div>
                          
                              <div class="col-md-3 mb-4 px-4">
                                <div class="custom-card">
                                  <img src="img/home/danang.jpg" alt="Danang" width="200" height="270">
                                  <div class="card-content">
                                    <h2 style="font-family:'Black Han Sans', sans-serif, Helvetica, Arial;">다낭</h2>
                                    <p>즐거움이 넘치는 휴양지</p>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                    </section>
                </div>
                <!-- body end -->
                <!-- footer start -->
                <div class="p-5" style="background-color: #7b9acc;">
				    <div class="r-flex p-4" style="justify-content: space-between;">
				        <div>
				 	    	<a href="/">
				        		<img src="img/logo/logo_pictext.png" style="width:180px">
				          	</a>
				          	<h3>Team Travel Maker</h3>
				          	<ul>
								<li>주재석</li>
								<li>전진우</li>
								<li>홍주이</li>				          	
				          	</ul>
					        
				        </div>
				        <!--전체 링크-->
				        <div class="r-flex">
				            <nav class="c-flex mx-4">
				              	<ul class="c-flex m-0 p-0">
				                	<li>로그인</li>
				                	<li>예약관리</li>
				                	<li>개인정보</li>
				                	<li>리뷰관리</li>
				              	</ul>
				            </nav>
				            <nav class="c-flex mx-4 m-0 p-0">
				            	
				            </nav>
				            <nav class="c-flex ms-4">
				            	<h3>기능</h3>
				              	<ul class="c-flex m-0 p-0">
				                	<li>호텔예약</li>
				                	<li>비행기예약</li>
				              	</ul>
				            </nav>
				        </div>
				    </div>
                </div>
                <!-- footer end -->
            </div>
        </body>
    </html>
    