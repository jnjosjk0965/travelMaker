/**
 * 
 */
// 입력 체크
function validateForm() {
        const origin = document.getElementById('origin');
        const destination = document.getElementById('destination');
        const departureDate = document.getElementById('departureDate');
        const returnDate = document.getElementById('returnDate');

        // 필수 입력란이 비어있으면 포커스 이동
        if (origin.value === "") {
            origin.focus();
            return false;
        }

        if (destination.value === "") {
            destination.focus();
            return false;
        }
		
		if (departureDate.value === ""){
			departureDate.focus();
			return false;
		}
		
		if (returnDate.value === ""){
			returnDate.focus();
			return false;
		}
        // 모든 조건을 통과하면 true 반환하여 폼이 submit 됨
        return true;
    }
