/**
 * 
 */
const userButton = document.getElementById("user-button");
const userDropdown = document.getElementById("user-dropdown");
let dropToggle = true;
userButton.addEventListener("click", ()=>{
	if(dropToggle){
		userDropdown.style.height = "14rem";
		userDropdown.style.paddingTop = "0.5rem";
		userDropdown.style.paddingBottom = "0.5rem";
		userDropdown.style.border = "0.8px";
		dropToggle = !dropToggle;
	}else{
		userDropdown.style.height = "0rem";
		userDropdown.style.paddingTop = "0rem";
		userDropdown.style.paddingBottom = "0rem";
		userDropdown.style.border = "0px";
		dropToggle = !dropToggle;
	}
})
