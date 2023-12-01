package ch01;

/* 유저
이메일 ( primary key )
비밀번호
닉네임
영어이름 (성, 이름)
여권번호
국가/지역
생년월일 */

public class User {
	private String userEmail;
	private String userPwd;
	private String userNName;
	private String userEName;
	private String userPassport;
	private String userCountry;
	private String userBirth;
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserNName() {
		return userNName;
	}
	public void setUserNName(String userNName) {
		this.userNName = userNName;
	}
	public String getUserEName() {
		return userEName;
	}
	public void setUserEName(String userEName) {
		this.userEName = userEName;
	}
	public String getUserPassport() {
		return userPassport;
	}
	public void setUserPassport(String userPassport) {
		this.userPassport = userPassport;
	}
	public String getUserCountry() {
		return userCountry;
	}
	public void setUserCountry(String userCountry) {
		this.userCountry = userCountry;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	
	
	
	
	
	
}
