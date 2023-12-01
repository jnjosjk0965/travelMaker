<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="UTF-8">
            <link rel="stylesheet" href="css/bs/bootstrap.css">
            <link rel="stylesheet" href="css/mycss.css">
            <title>Travel Maker</title>
            <style>
            	/*
            	main color
            	푸른 계열 #7b9acc
            	베이지 #FCF6F5
            	*/
                .origin-input{
                    flex: 0 0 auto;
                    width: 10.125rem;
                }
                .date-input,
                .cabin-input{
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
                .origin-input,
				.date-input,
				.cabin-input{
				  	flex: 1;
				  	height: 4.5rem;
				  	cursor: pointer;
				}
                .SearchBar>div:not(:last-child){
                	background-color: white;
                }
                .custom-card {
				    position: relative;
				    overflow: hidden;
				    border: 1px solid #ddd;
				    border-radius: 8px;
				    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
				    transition: transform 0.3s ease-in-out;
				}
				
				.custom-card:hover {
				    transform: scale(1.05);
				}
				
				.custom-card img {
				    width: 100%;
				    height: auto;
				    border-bottom: 1px solid #ddd;
				}
				
				.card-content {
				    padding: 0.8rem;
				}
				
				.card-content h2 {
				    font-size: 1.5rem;
				    margin-bottom: 0.5rem;
				}
				
				.card-content p {
				    font-size: 1rem;
				    color: #777;
				    margin-bottom: 0.5rem;
				    text-overflow: ellipsis;
				    white-space: nowrap;
				    overflow: hidden;
				}
				.CabinSelector_Label,
				.Input_Label{
				    color: #05203c;
				    font-size: 1rem;
				    line-height: 1.5rem;
				    font-weight: 700;
				}
				.input_Label{
					cursor: pointer;
				}
				.CabinSelector_Select{
					height: 3rem;
    				border-color: #c2c9cd;
    				border-radius: 0.75rem;
				}
				.BpkButton{
					min-height: 2.25rem;
					padding-right: 0.625rem;
    				padding-left: 0.625rem;
    				border-radius: 0.5rem;
    				border: none;
					display:inline-block;
					background-color: #e0e3e5;
				}
				.BpkNudger{
					width: 2.5rem;
					padding: 0.5rem 0;
					display:inline-block;
					border: none;
					text-align: center;
					font-size: 1rem;
    				line-height: 1.25rem;
    				font-weight: 700;
				}
				#travelInfo {
					text-overflow: ellipsis;
				    white-space: nowrap;
				    overflow: hidden;
				}
            </style>
        </head>
        <body>
            <div id="app-root">
            	<!-- header/검색창 start -->
            	<div class="SearchContainer p-5" style="background-color: #7b9acc;">
	                <jsp:include page="module/header.jsp" flush="false"/>
	                <h2 class="mt-5 mb-4" style="font-weight:bold;">당신의 여행은 지금부터</h2>
	                <form action="/TravelMaker/amadeus.do" method="get">
	                	<div class="SearchBar row g-3">
	                        <div class="origin-input firstSearchBar c-flex" style="justify-content: center;">
	                            <span class="Input_Label">출발지</span>
	                            <input type="text" class="form-control none-deco-input" id="origin" name="origin" placeholder="출발지를 입력하세요">
	                        </div>
	                        <div class="origin-input c-flex" style="justify-content: center;">
	                            <span class="Input_Label">도착지</span>
	                            <input type="text" class="form-control none-deco-input" id="destination" name="destination" placeholder="도착지를 입력하세요">
	                        </div>
	                        <div class="date-input c-flex" style="justify-content: center;">
	                            <span class="Input_Label">가는 날짜</span>
	                            <input type="date" class="form-control none-deco-input" id="checkIn" name="checkIn">
	                        </div>
	                        <div class="date-input c-flex" style="justify-content: center;">
	                            <span class="Input_Label">오는 날짜</span>
	                            <input type="date" class="form-control none-deco-input" id="checkOut" name="checkOut">
	                        </div>
	                        <div class="cabin-input lastSearchBar c-flex" style="justify-content: center; position: relative;">
	                        	<div id="cabin-input" style="text-overflow: ellipsis; overflow: hidden;">
	                        		<span class="Input_Label">여행자 및 좌석</span>
	                            	<span id="travelInfo">1 성인, 일반석</span>
	                        	</div>
	                            <!-- 여행객 및 좌석 dropdown start -->
	                            <div id="cabin-dropdown" class="dropdown-menu gap-1 p-4 rounded-3 mx-0 shadow w-220px" data-bs-theme="light" style="position: absolute; top:5rem; left:-5rem; min-width: 20rem; ">
	                            	<div style="margin-bottom: 2.5rem; ">
	                            		<label class="CabinSelector_Label" style="display: block; margin-bottom: 0.5rem;">좌석 등급</label>
	                            		<select id="cabinSelector" class="CabinSelector_Select" style="width: 100%; padding: 0.375rem 2rem 0.375rem 0.5rem; appearance:none; 
	                            			background: #fff url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCIgd2lkdGg9IjE2IiBoZWlnaHQ9IjE2Ij48c3R5bGU+PC9zdHlsZT48cGF0aCBkPSJNMTYuNTM3IDguMjVINy40NjNhMS4zNTggMS4zNTggMCAwMC0xLjExIDIuMjUxbDQuMzU0IDQuNzdhMS41MyAxLjUzIDAgMDAyLjE4NC4wNGw0LjcxOC00Ljc3YTEuMzU3IDEuMzU3IDAgMDAtMS4wNzItMi4yOTF6IiBmaWxsPSIjMTYxNjE2Ii8+PC9zdmc+) no-repeat right 0.5rem center;background-size: 1.125rem;">
	                            			<option value="ECONOMY">일반석</option>
	                            			<option value="PREMIUM_ECONOMY">프리미엄 일반석</option>
	                            			<option value="BUSINESS">비즈니스석</option>
	                            			<option value="FIRST">일등석</option>
	                            		</select>
	                            	</div>
	                            	<div class="">
								    	<div class="r-flex mb-4" style="justify-content: space-between;">
								    		<label class="BpkLabel" for="adult-nudger">
								    			<span class="c-flex" role="text">
								    				<span class="CabinSelector_Label">
								    					성인
								    				</span>
								    				<span class="BpkText">
								    					만 16세 이상
								    				</span>
								    			</span>
								    		</label>
								    		<div class="">
								    			<div class="bpk-nudger">
								    				<button type="button" class="BpkButton" title="인원 줄이기 성인" onclick="decrementCount('adult-nudger')">
								    					<span style="line-height: 1rem; display: inline-block; margin-top: 0.25rem; vertical-align: top;">
								    						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" aria-hidden="true" class="" style="width: 1rem; height: 1rem;">
								    							<path d="M1.5 12A1.5 1.5 0 013 10.5h18a1.5 1.5 0 010 3H3A1.5 1.5 0 011.5 12z"/>
									    					</svg>
									    				</span>
									    			</button>
									    			<input type="text" aria-live="polite" readonly="" id="adult-nudger" name="adults" class="BpkNudger" tabindex="0" value="1">
								    				<button type="button" class="BpkButton" title="인원 늘리기 성인" onclick="incrementCount('adult-nudger')">
								    					<span style="line-height: 1rem; display: inline-block; margin-top: 0.25rem; vertical-align: top;">
								    						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" aria-hidden="true" class="" style="width: 1rem; height: 1rem;">
								    							<path d="M12 1.5A1.5 1.5 0 0010.5 3v7.5H3a1.5 1.5 0 000 3h7.5V21a1.5 1.5 0 003 0v-7.5H21a1.5 1.5 0 000-3h-7.5V3A1.5 1.5 0 0012 1.5z"/>
							    							</svg>
							    						</span>
							    					</button>
												</div>
											</div>
										</div>
										<div class="r-flex mb-4" style="justify-content: space-between;">
											<label class="BpkLabel" for="children-nudger">
												<span class="c-flex" role="text">
													<span class="CabinSelector_Label">
														유/소아
													</span>
													<span class="BpkText">
														만 0~15세 
													</span>
												</span>
											</label>
											<div class="">
												<div class="bpk-nudger">
													<button type="button" class="BpkButton" title="인원 줄이기 유/소아" onclick="decrementCount('children-nudger')">
														<span style="line-height: 1rem; display: inline-block; margin-top: 0.25rem; vertical-align: top;">
															<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" aria-hidden="true" class="" style="width: 1rem; height: 1rem;">
																<path d="M1.5 12A1.5 1.5 0 013 10.5h18a1.5 1.5 0 010 3H3A1.5 1.5 0 011.5 12z"/>
															</svg>
														</span>
													</button>
													<input type="text" aria-live="polite" readonly="" id="children-nudger" name="" class="BpkNudger" tabindex="0" value="0">
													<button type="button" class="BpkButton" title="인원 늘리기 유/소아" onclick="incrementCount('children-nudger')">
														<span style="line-height: 1rem; display: inline-block; margin-top: 0.25rem; vertical-align: top;">
															<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" aria-hidden="true" class="" style="width: 1rem; height: 1rem;">
																<path d="M12 1.5A1.5 1.5 0 0010.5 3v7.5H3a1.5 1.5 0 000 3h7.5V21a1.5 1.5 0 003 0v-7.5H21a1.5 1.5 0 000-3h-7.5V3A1.5 1.5 0 0012 1.5z"/>
															</svg>
														</span>
													</button>
												</div>
											</div>
										</div>
									</div>
									<div class="" style="width: 100%;">
	                            		<button type="submit" class="btn btn-primary w-100 h-100">검색</button>
	                        		</div>
								</div>
								<!-- 여행객 및 좌석 dropdown end -->
	                        </div>
	                        <div class="" style="width: fit-content;">
	                            <button type="submit" class="btn btn-primary w-100 h-100">검색</button>
	                        </div>
	                	</div>
	                </form>
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
		        <jsp:include page="module/footer.jsp" flush="false"/>
		        <!-- footer end -->
		    </div>
		    <jsp:include page="module/loginModal.jsp"/>
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    		<script src="js/button.js"></script>
        </body>
    </html>
    