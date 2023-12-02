<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
   
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border-radius: 8px;
            width: 300px;
            text-align: center;
            position: relative;
        }

        .close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
        }

        .login-text {
            display: inline-block;
            margin-right: 20px;
        }

        .register-link {
            color: #4285f4;
            text-decoration: underline;
            cursor: pointer;
            font-size: 14px; /* 추가: 폰트 크기 조절 */
        }

        input[type="text"],
        input[type="password"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4B89DA;
            color: white;
            cursor: pointer;
        }

        .google-login-btn
         {
            background-color: #ffffff;
            border: 1px solid #ccc;
            border-radius: 4px;
            color: #333;
            cursor: pointer;
            display: inline-block;
            font-size: 14px;
            margin-top: 10px;
            padding: 10px;
            text-align: center;
            width: 100%;
            box-sizing: border-box; /* 추가: 패딩과 보더를 포함한 전체 크기로 설정 */
        }

        /* 수정된 스타일: 로그인 버튼 아이콘 */
        .google-login-btn img
         {
            margin-right: 5px; /* 수정: 마진을 조금 줄임 */
            vertical-align: middle;
            width: 20px; /* 추가: 이미지 크기를 조절 */
            height: 20px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <span class="login-text">TravelMaker</span>
        <span class="close-btn" onclick="closeLoginForm()">X</span>
        <form method="post" action="loginProc.jsp">
            <div style="position: relative; display: flex; align-items: center;">
                <span style="margin-right: 5px;">&#128100;</span>
                <input type="text" id="userEmail" name="userEmail" placeholder="이메일" required>
            </div><br>

            <!-- 비밀번호 칸에 키 이모티콘 왼쪽에 추가 -->
            <div style="position: relative; display: flex; align-items: center;">
                <span style="margin-right: 5px;">&#128273;</span>
                <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호" required>
            </div><br>

            <p>
                계정이 없으십니까? 
                <a href="register.jsp" class="register-link"> 회원가입 </a>
            </p>
            <input type="submit" value="Login">

            <!-- Google 로그인 버튼 -->
            <div class="google-login-btn" onclick="redirectToGoogleLogin()">
                <img src="https://developers.google.com/identity/images/g-logo.png" alt="Google 로고">
                Google로 로그인
            </div>

        </form>
    </div>

    <script>
        // Google 로그인 페이지로 리다이렉트하는 함수
        function redirectToGoogleLogin() {
            window.location.href = 'URL_TO_GOOGLE_LOGIN'; // 구글 API를 이용하여 제공되는 URL로 변경 필요
        }

        function closeLoginForm() {
        	window.location.href = 'index.jsp'; 
            alert("LoginForm Closed");
        }
    </script>
</body>
</html>
