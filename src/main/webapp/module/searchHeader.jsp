<%@page import="com.servlet.api.beans.SearchInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_blue.css">
<% SearchInfo info =(SearchInfo)session.getAttribute("searchInfo"); %>
<style>
	.search-header-root{
		min-height: 3.5rem;
		padding: 0;
		background-color: #7b9acc;
		font-size: 1rem;
		cursor: pointer;
		box-shadow: 0 1px 3px 0 rgba(37,32,31,.3);
	}
	.search-container{
		margin: 0;
    	padding: 0.25rem 0.5rem 0.5rem 0;
    	flex-direction: row;
    	align-items: center;
	}
	.dateNudger{
		justify-content: flex-end;
		flex-grow: 5;
		align-items: flex-start;
	}
	.dateContainer{
		display: flex;
	    width: 12rem;
	    justify-content: space-evenly;
	    align-items: center;
	}
	.dateButton{
		background-color: rgba(0,0,0,0);
		display: inline-block;
	    min-height: 2.25rem;
	    margin: 0;
	    padding: 0.375rem 0.625rem;
	    border: 0;
	    border-radius: 0.5rem;
	    text-align: center;
	    text-decoration: none;
	    cursor: pointer;
	    vertical-align: middle;	
	}
	.date-input{
		cursor: pointer;
		height: 2.25rem;
	}
</style>
<div class="search-header-root">
	<section class="r-flex search-container">
		<div class="mx-3 pt-1">
			<button class="btn btn-primary">
				<span class="" style="line-height: 1rem; display: inline-block; vertical-align: top; margin-top:2.3px">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" style="width: 1rem; height: 1rem;">
						<path d="M10.5 4.5a6 6 0 100 12 6 6 0 000-12zm-9 6a9 9 0 1116.336 5.215l4.225 4.224a1.5 1.5 0 01-2.122 2.122l-4.224-4.225A9 9 0 011.5 10.5z"/>
					</svg>
				</span>
			</button>
		</div>
		<div class="r-flex" style="order:2; flex-grow: 1;">
			<div class="pt-1">
				<div class="r-flex">
					<span>서울</span>
					<span>(ICN)</span>
					<span>-</span>
					<span>도쿄</span>
					<span>(HND)</span>
				</div>
				<div class="r-flex mt-1">
					<span class="me-1 pe-1" style="box-shadow: inset -1px 0 0 0 #e0e3e5;">1 성인</span>
					<span>일반석</span>
				</div>
			</div>
			<nav class="r-flex dateNudger">
				<div class="dateContainer">
					<button class="dateButton">
						<span class="mt-1" style="line-height: 1rem;display: inline-block;vertical-align: top;">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" style="width: 1rem; height: 1rem;">
								<path d="M15.75 16.537V7.463a1.358 1.358 0 00-2.251-1.11l-4.77 4.354a1.53 1.53 0 00-.04 2.184l4.77 4.718a1.357 1.357 0 002.291-1.072z" />
							</svg>
						</span>
					</button>
					<div>
						<input type="text" id="departureDate" class="p-0 " style="background-color: transparent;border: none;color: rgb(255, 255, 255);text-align: center;">
					</div>
					<button class="dateButton">
						<span class="mt-1" style="line-height: 1rem;display: inline-block;vertical-align: top;">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" class="DateNudgers_buttonIcon__ZDg4N BpkIcon_bpk-icon--rtl-support__NjcwN" style="width: 1rem; height: 1rem;">
								<path d="M8.25 7.463v9.074a1.358 1.358 0 002.251 1.11l4.77-4.354a1.53 1.53 0 00.04-2.184l-4.77-4.718A1.357 1.357 0 008.25 7.463z"/>
							</svg>
						</span>						
					</button>
				</div>
				<div class="dateContainer">
					<button class="dateButton">
						<span class="mt-1" style="line-height: 1rem;display: inline-block;vertical-align: top;">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" style="width: 1rem; height: 1rem;">
								<path d="M15.75 16.537V7.463a1.358 1.358 0 00-2.251-1.11l-4.77 4.354a1.53 1.53 0 00-.04 2.184l4.77 4.718a1.357 1.357 0 002.291-1.072z" />
							</svg>
						</span>
					</button>
					<div>
						<input type="text" id="returnDate" class="p-0 " style="background-color: transparent;border: none;color: rgb(255, 255, 255);text-align: center;">
					</div>
					<button class="dateButton">
						<span class="mt-1" style="line-height: 1rem;display: inline-block;vertical-align: top;">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" class="DateNudgers_buttonIcon__ZDg4N BpkIcon_bpk-icon--rtl-support__NjcwN" style="width: 1rem; height: 1rem;">
								<path d="M8.25 7.463v9.074a1.358 1.358 0 002.251 1.11l4.77-4.354a1.53 1.53 0 00.04-2.184l-4.77-4.718A1.357 1.357 0 008.25 7.463z"/>
							</svg>
						</span>						
					</button>
				</div>
			</nav>
		</div>
	</section>
</div>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script type="text/javascript" src="https://npmcdn.com/flatpickr@4.6.13/dist/l10n/ko.js"></script>
<script>
	const dep = new Date('<%= info.getDepartureDate() %>')
	const ret = new Date('<%= info.getReturnDate() %>')
	const departureDate = document.getElementById('departureDate');
	const returnDate = document.getElementById('returnDate');
	flatpickr(departureDate, {
		dateFormat: 'Y-m-d',
		enableTime: false,
		minDate: 'today',
		defaultDate: dep,
		locale: 'ko',
		onReady: function(selectedDates, dateStr, instance){
			departureDate.value = instance.formatDate(dep, 'Y-m-d');
	    },
		onClose: function(selectedDates, dateStr, instance) {
	        // 선택된 날짜를 input 요소에 설정
	        departureDate.value = dateStr;
	    }
	});
	flatpickr(returnDate, {
		dateFormat: 'Y-m-d',
		enableTime: false,
		minDate: 'today',
		defaultDate: ret,
		locale: 'ko',
		onReady: function(selectedDates, dateStr, instance){
	        returnDate.value = instance.formatDate(ret, 'Y-m-d');
	    },
		onClose: function(selectedDates, dateStr, instance) {
	        // 선택된 날짜를 input 요소에 설정
	        returnDate.value = dateStr;
	    }
	});
</script>