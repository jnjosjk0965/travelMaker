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
            width: 500px;
            text-align: center;
            padding: 30px;
        }

        .signup-header {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .signup-form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .form-input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .split-input {
            display: flex;
            gap: 10px;
        }

        .split-input input {
            flex: 1;
        }

        .form-select {
            width: 32%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-button {
            background-color: #4B89DA;
            color: #fff;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .signup-link {
            font-size: 14px;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <div class="signup-header">회원가입</div>
        
        <form class="signup-form" action="/register.do" method="get">
            <input class="form-input" type="text" id="userEmail" name="userEmail" placeholder="이메일" required>
            <input class="form-input" type="password" id="userPwd" name="userPwd" placeholder="비밀번호" required>
            <input class="form-input" type="password" id="confirmPwd" name="confirmPwd" placeholder="비밀번호 확인" required>
            <input class="form-input" type="text" id="userNName" name="userNName" placeholder="닉네임" required>
             <div class="split-input"> <!-- 영어이름 --> 
                <input class="form-input" type="text" id="lastName" name="lastName" placeholder="성" required>
                <input class="form-input" type="text" id="firstName" name="firstName" placeholder="이름" required>
            </div>
            <input class="form-input" type="text" id="userPassport" name="userPassport" placeholder="여권 번호" required>
            <input class="form-input" type="text" id="userCon" name="userCon" placeholder="국가/지역" required>
            <div class="split-input">
            
                <select class="form-select" name="birthYear" required>
                    <option value="" disabled selected>년</option>
                    <% 
                        int currentYear = java.time.Year.now().getValue();
                        for (int year = currentYear - 80; year <= currentYear; year++) {
                    %>
                    <option value="<%= year %>"><%= year %></option>
                    <% } %>
                </select>
                <select class="form-select" name="birthMonth" required>
                    <option value="" disabled selected>월</option>
                    <% for (int month = 1; month <= 12; month++) { %>
                    <option value="<%= month %>"><%= month %></option>
                    <% } %>
                </select>
                <select class="form-select" name="birthDay" required>
                    <option value="" disabled selected>일</option>
                    <% for (int day = 1; day <= 31; day++) { %>
                    <option value="<%= day %>"><%= day %></option>
                    <% } %>
                </select>
                
            </div>
            <button class="form-button" type="submit">가입하기</button>
        </form>
        <div class="signup-link">
            계정이 이미 있으신가요? <a href="login.jsp">로그인</a>
        </div>
    </div>
</body>
</html>
