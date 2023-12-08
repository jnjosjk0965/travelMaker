<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/mycss.css">
<!-- Login Modal -->
<div id="login-container" class="p-4" style="display:none;z-index:100;">
	<div class="login-content m-auto">
		<header class="d-flex">
			<span class="login-text">TravelMaker</span>
	        <button id="login-close-button" class="close-btn">
	        	<span>X</span>
	        </button>
		</header>
        <form action="/TravelMaker/login.do" method="post">
        
            <input type="text" id="userEmail" name="userEmail" placeholder="이메일" required><br>
            <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호" required><br>
            

             <p>
            계정이 없으십니까? 
            <a href="register.jsp" class="register-link">회원가입</a>
        	</p>
            <input class="btn btn-primary" type="submit" value="로그인">
            <div class="google-login-btn btn" onclick="redirectToGoogleLogin()">
            	<img src="https://developers.google.com/identity/images/g-logo.png" alt="Google 로고">
            	Google로 로그인
           </div>
        </form>
	</div>
</div>    


<!-- Login Modal end -->