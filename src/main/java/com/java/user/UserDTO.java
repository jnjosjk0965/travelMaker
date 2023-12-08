package com.java.user;

public class UserDTO {
	private String userEmail;
	private String userPwd;
	private String userNName;
	private String userEName;
	private String userPassport;
	private String userCountry;
	private String userBirth;
	private boolean isAdmin;
	
	public UserDTO() {
		
	}
	
	public UserDTO(String userEmail, String userPwd) {
		this.userEmail = userEmail;
		this.userPwd = userPwd;
	}
	
	public UserDTO(String userEmail, String userPwd, String userNName, String userEName, String userPassport,
			String userCountry, String userBirth,boolean isAdmin) {
		
		this.userEmail = userEmail;
		this.userPwd = userPwd;
		this.userNName = userNName;
		this.userEName = userEName;
		this.userPassport = userPassport;
		this.userCountry = userCountry;
		this.userBirth = userBirth;
		this.isAdmin=isAdmin;
	}

	public UserDTO(String userEmail, String userPwd, String userNName, String userEName, String userPassport,
			String userCountry, String userBirth) {
		super();
		this.userEmail = userEmail;
		this.userPwd = userPwd;
		this.userNName = userNName;
		this.userEName = userEName;
		this.userPassport = userPassport;
		this.userCountry = userCountry;
		this.userBirth = userBirth;
	}

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

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}	

}
