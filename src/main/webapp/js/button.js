/**
 * 
 */
// 좌석 등급이 변경될 때마다 텍스트 업데이트
document.getElementById('cabinSelector').addEventListener('change', updateTravelInfo);
// 좌석 정보 창을 누르면 dropdown이 toggle
const cabinInput = document.getElementById('cabin-input');
cabinInput.addEventListener('click',()=>{
	const dropdown = document.getElementById('cabin-dropdown');
	dropdown.style.display = (dropdown.style.display === 'none' || dropdown.style.display === '') ? 'block' : 'none';
});
// 모달 on off
const loginOpen = document.getElementById("login-button");
const loginClose = document.getElementById("login-close-button");
const loginForm = document.getElementById("login-container");
loginOpen.addEventListener('click', () => {
	loginForm.style.display = 'block';
});
loginClose.addEventListener('click', () => {
	loginForm.style.display = 'none';
});


function decrementCount(nudgerId) {
	// 해당 너저의 현재 값 가져오기
    const nudger = document.getElementById(nudgerId);
    let currentValue = parseInt(nudger.value, 10);
	let minValue;
	if (nudgerId === "children-nudger")
		minValue = 0;
	else if(nudgerId === "adult-nudger")
		minValue = 1;
    // 최소값 확인
    if (currentValue > minValue) {
      // 값 감소
      nudger.value = currentValue - 1;

      // 업데이트된 값을 표시하는 span 업데이트
      updateTravelInfo();
    }
}

function incrementCount(nudgerId) {
    // 해당 너저의 현재 값 가져오기
    const nudger = document.getElementById(nudgerId);
    let currentValue = parseInt(nudger.value, 10);

    // 최대값 확인 (여기서는 일단 무제한으로 설정)
    // 값 증가
    nudger.value = currentValue + 1;

    // 업데이트된 값을 표시하는 span 업데이트
    updateTravelInfo();
}
function updateTravelInfo() {
    // 선택된 좌석 등급 가져오기
    const cabinSelector = document.getElementById('cabinSelector');
    const selectedCabin = cabinSelector.options[cabinSelector.selectedIndex].text;

    // 선택된 성인 및 어린이 수 가져오기
    const adultCount = parseInt(document.getElementById('adult-nudger').value, 10);
    const childCount = parseInt(document.getElementById('children-nudger').value, 10);
    // 업데이트된 정보를 표시하는 span 업데이트
	if(childCount > 0){
		document.getElementById('travelInfo').innerText = `${adultCount + childCount} 승객, ${selectedCabin}`;
	}else{
		document.getElementById('travelInfo').innerText = adultCount + ' 성인, ' + selectedCabin;	
	}
}

