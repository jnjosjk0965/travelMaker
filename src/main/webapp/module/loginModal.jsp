<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/mycss.css">

<!-- Login Modal -->
<div id="login-container" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">    
        <div class="login-content modal-content">
            <header class="d-flex align-items-center justify-content-center"> <!-- Centering header content -->

				<a href="index.jsp" class="d-inline-flex link-body-emphasis text-decoration-none">
                    <svg xmlns="http://www.w3.org/2000/svg" width="100" height="70" viewBox="0 0 100 45">
                        <image href="img/logo/TM_TextOnly.png" width="100" height="70" ></image>
                    </svg>
                </a>
                <button id="login-close-button" class="close-btn" data-bs-dismiss="modal" aria-label="Close">
                    <span>X</span>
                </button>
            </header>
            <div style="margin-top: 20px;"> <!-- Added margin-top to the form -->
                <form action="/TravelMaker/login.do" method="post">        
                    <div style="margin-bottom: 10px;">
                        <input type="text" id="userEmail" name="userEmail" placeholder="이메일" required>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호" required>
                    </div>
                    
                    <p style="margin-bottom: 10px;">
                        계정이 없으십니까? 
                        <a href="register.jsp" class="register-link">회원가입</a>
                    </p>
                    <input class="btn" type="submit" value="로그인" style="background-color: #8AADE6;">
                    <div class="google-login-btn btn" onclick="redirectToGoogleLogin()" content="AIzaSyDL-RX5Zc3TX-CU3-i-WJbftVQiwY4ZiBI" style="margin-top: 10px;">
                        <img src="https://developers.google.com/identity/images/g-logo.png" alt="Google 로고">
                        Google로 로그인
                    </div>
                </form>
            </div>
        </div>
    </div>        
</div>
<!-- Login Modal end -->
