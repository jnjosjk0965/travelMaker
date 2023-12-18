/**
 * 공항 입력 자동 완성 기능
 */
const originInput = document.getElementById("origin");
const destinationInput = document.getElementById("destination");

let originInputItem = -1;
let destinationInputItem = -1;

originInput.addEventListener('input', ()=>{
	showSuggestion(originInput,originInput.value,'suggestion-origin');
});
destinationInput.addEventListener('input', ()=>{
	showSuggestion(destinationInput,destinationInput.value,'suggestion-destination');
});

function showSuggestion(input ,value, suggestionId){
	const inputElement = input;
	const airport = ["대한민국 인천국제공항","대한민국 제주국제공항","도쿄 하네다","도쿄 나리타","오사카 칸사이인터내셔널",
		"오사카 이타미","삿포로 신치토세","후쿠오카","나고야 주부","오키나와 나하","센다이"];
	// 추천 목록을 표시할 엘리먼트 가져오기
	const suggestElement = document.getElementById(suggestionId);
	
	// 입력 값이 비어있으면 추천 목록 숨기고 함수 종료
	if (value.trim() === ''){
		suggestElement.innerHTML = "";
		return;
	}
	
	const matchingAirports = airport.filter(airport => airport.includes(value));
	
	
	// 추천 목록 초기화
	suggestElement.innerHTML = "";
	
	// 추천 목록에 매칭되는 항목 추가
	matchingAirports.forEach(function(airport){
		let suggestionItem = document.createElement("li");
		suggestionItem.classList.add("autoSuggestion-option");
		suggestionItem.textContent = airport;
		suggestionItem.addEventListener("click", ()=>{
			// 추천 목록에서 선택한 항목을 입력 필드에 설정
			inputElement.value = airport;
			// 항목을 클릭하면 추천 목록 숨김
			suggestElement.innerHTML = "";
		});
		suggestElement.appendChild(suggestionItem);
	});
}