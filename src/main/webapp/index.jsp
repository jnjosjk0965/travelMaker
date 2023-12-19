<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String parentInfo = "index.jsp";
session.setAttribute("parentInfo", parentInfo); 
%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="UTF-8">
            <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bs/bootstrap.css">
            <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mycss.css">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
            <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_blue.css">
            <title>Travel Maker</title>
            <style>
            	/*
            	main color
            	푸른 계열 #7b9acc
            	베이지 #FCF6F5
            	*/
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
				
				.card-content{
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
				.autoSuggestion-container{
					width: 20rem;
					position: absolute;
					top: 4.5rem;
				    right: 0;
				    left: 0;
				    display: block;
				    z-index: 900;
				    outline: none;
				}
				.autoSuggestion-list{
					margin-top: 0.25rem;
				    border-radius: 0.75rem;
    				box-shadow: 0 4px 14px 0 rgba(37,32,31,.25);
    				overflow: hidden;
    				height: auto;
				    margin-bottom: 0;
				    background: #fff;
				    list-style-type: none;
				    margin-inline-start: 0;
				    padding: 0;
				}
				.autoSuggestion-option{
					padding: 1rem;
					cursor: pointer;
				}
				.autoSuggestion-option:hover{
					background-color: #eee;
				}
            </style>
        </head>
        <body>
            <div id="app-root">
            	<!-- header/검색창 start -->
            	<div class="SearchContainer p-5" style="background-color: #7b9acc;">
            		<div class="container containerSize" style="padding:0;">
            			<%@ include file="module/header.jsp" %>
		                <h2 class="mt-5 mb-4" style="font-weight:bold;">당신의 여행은 지금부터</h2>
		                <form action="/TravelMaker/flightSearch.do" onsubmit="return validateForm()">
		                	<div class="SearchBar row g-3 dropdown-center">
		                        <div class="searchControl-origin c-flex" style="justify-content: center;">
		                        	<label>
		                        		<span class="Input_Label">출발지</span>
		                            	<input type="text" class="form-control none-deco-input" id="origin" name="originLocation" placeholder="출발지를 입력하세요" autocomplete="off">
		                        	</label>
		                        	<div class="autoSuggestion-container">
		                        		<ul id="suggestion-origin" class="autoSuggestion-list"></ul>
		                        	</div>
		                        </div>
		                        <div class="searchControl-destination c-flex" style="justify-content: center;">
		                            <label>
		                            	<span class="Input_Label">도착지</span>
		                            	<input type="text" class="form-control none-deco-input" id="destination" name="destinationLocation" placeholder="도착지를 입력하세요" autocomplete="off">
		                            </label>
		                            <div class="autoSuggestion-container">
		                            	<ul id="suggestion-destination" class="autoSuggestion-list"></ul>
		                            </div>
		                        </div>
		                        <div class="searchControl-date c-flex" id="checkIn" style="justify-content: center;" >
		                            <span class="Input_Label">가는 날짜</span>
		                            <input type="text" class="form-control none-deco-input" style="cursor: pointer;" id="departureDate" name="departureDate" readonly>
		                        </div>
		                        <div class="searchControl-date c-flex" id="checkOut" style="justify-content: center;">
		                            <span class="Input_Label">오는 날짜</span>
		                            <input type="text" class="form-control none-deco-input" id="returnDate" name="returnDate" style="cursor:pointer;" readonly>
		                        </div>
		                        <div class="searchControl-cabin c-flex dropdown-toggle " style="justify-content: center; position: relative;white-space:inherit;" data-bs-toggle="dropdown" aria-expanded="false">
		                        	<div id="cabin-input" class="c-flex" style="text-overflow: ellipsis; overflow: hidden;">
		                        		<span class="Input_Label">여행자 및 좌석</span>
		                            	<span id="travelInfo">1 성인, 일반석</span>
		                        	</div>
		                        </div>
	                            <!-- 여행객 및 좌석 dropdown start -->
	                            <div id="cabin-dropdown" class="dropdown-menu gap-1 p-4 rounded-3 mx-0 shadow" data-bs-theme="light" style="min-width: 20rem;z-index:50; width:23rem">
	                            	<div style="margin-bottom: 2.5rem; ">
	                            		<label class="CabinSelector_Label" style="display: block; margin-bottom: 0.5rem;">좌석 등급</label>
	                            		<select id="cabinSelector" class="CabinSelector_Select" name="travelClass" style="width: 100%; padding: 0.375rem 2rem 0.375rem 0.5rem; appearance:none; 
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
								<script>
									document.getElementById("cabin-dropdown").addEventListener("click", function (event) {
							            event.stopPropagation();
							        });
								</script>
								<!-- 여행객 및 좌석 dropdown end -->
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
		                          <img src="img/home/tokyo.jpg" alt="Danang" width="200" height="270">
		                          <div class="card-content">
		                            <h2 style="font-family:'Black Han Sans', sans-serif, Helvetica, Arial;">도쿄</h2>
		                            <p>일본의 현재</p>
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
            <script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8=" crossorigin="anonymous"></script>
    		<script src="js/bs/bootstrap.bundle.js"></script>
    		<script src="js/button.js"></script>
    		<script src="js/app.js"></script>
    		<script type="text/javascript" src="js/autoSuggest.js"></script>
    		<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    		<script type="text/javascript" src="https://npmcdn.com/flatpickr@4.6.13/dist/l10n/ko.js"></script>
		    <script>
		    	const checkIn = document.getElementById('checkIn');
		    	const checkOut = document.getElementById('checkOut');
		    	const departureDate = document.getElementById("departureDate");
		    	const returnDate = document.getElementById("returnDate");
		    	let depDefault = new Date();
		    	depDefault.setDate(depDefault.getDate() + 1);
		    	let retDefault = new Date();
		    	retDefault.setDate(retDefault.getDate() + 4);
		    	flatpickr(checkIn, {
		    		dateFormat: 'Y-m-d',
		    		enableTime: false,
		    		minDate: 'today',
		    		defaultDate: depDefault,
		    		locale: 'ko',
		    		onReady: function(selectedDates, dateStr, instance){
		                departureDate.value = instance.formatDate(depDefault, 'Y-m-d');
		            },
		    		onClose: function(selectedDates, dateStr, instance) {
		                // 선택된 날짜를 input 요소에 설정
		                departureDate.value = dateStr;
		            }
		    	});
		    	flatpickr(checkOut, {
		    		dateFormat: 'Y-m-d',
		    		enableTime: false,
		    		minDate: 'today',
		    		defaultDate: retDefault,
		    		locale: 'ko',
		    		onReady: function(selectedDates, dateStr, instance){
		                returnDate.value = instance.formatDate(retDefault, 'Y-m-d');
		            },
		    		onClose: function(selectedDates, dateStr, instance) {
		                // 선택된 날짜를 input 요소에 설정
		                returnDate.value = dateStr;
		            }
		    	});
		    </script>
        </body>
    </html>