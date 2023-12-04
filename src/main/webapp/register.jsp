<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입 페이지</title>
    <style>
        body {
            font-family: 'Nanum Gothic', sans-serif;
            background-color: #f6f6f6;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .signup-container {
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            width: 400px;
            text-align: center;
            padding: 20px;
        }

        .signup-header {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .signup-form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .form-input {
            width: 95%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .split-input {
            display: flex;
            gap: 10px;
        }

        .split-input input {
            flex: 1;
        }

        .form-button {
            background-color: #4B89DA; /* 조절된 색상 */
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .signup-link {
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <div class="signup-header">회원가입</div>
        <form class="signup-form" action="/TravelMaker/register.do" method="post">
            <input class="form-input" type="text" id="userEmail" name="userEmail" placeholder="이메일" required>
            <input class="form-input" type="password" id="userPwd" name="userPwd" placeholder="비밀번호" required>
            <input class="form-input" type="password" id="confirmPwd" name="confirmPwd" placeholder="비밀번호 확인" required>
            <input class="form-input" type="text" id="userNName" name="userNName" placeholder="닉네임" required>
            <div class="split-input">
                <input class="form-input" type="text" id="userEName" name="userEName" placeholder="이름" required>
            </div>
            <input class="form-input" type="text" id="userPasssport" name="Passsport" placeholder="여권번호" required>
            <input class="form-input" type="text" id="userCountry" name="userCountry" placeholder="국가/지역" required>
            <div class="split-input">
            	<input class="form-input" type="text" id="userBirth" name="userBirth" placeholder="생년월일" required>
                <!-- <input class="form-input" type="text" id="birthYear" name="birthYear" placeholder="년" required>
                <input class="form-input" type="text" id="birthMonth" name="birthMonth" placeholder="월" required>
                <input class="form-input" type="text" id="birthDay" name="birthDay" placeholder="일" required>  -->
            </div>
            <button class="form-button" type="submit">가입하기</button>
        </form>
        <div class="signup-link">
            계정이 이미 있으신가요? <a href="index.jsp">로그인</a>
        </div>
    </div>
</body>
</html>