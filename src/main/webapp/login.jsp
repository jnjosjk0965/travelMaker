<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <span class="login-text">TravelMaker</span> <!-- 로고 넣으면 좋을것 같아욤 아님 말고~~ -->
        <span class="close-btn" onclick="closeLoginForm()">X</span>
        <form action="loginAction" method="post">
            <input type="text" id="userEmail" name="userEmail" placeholder="아이디" required><br>
            <input type="password" id="userPw" name="userPw" placeholder="비밀번호" required><br>
             <p>
            계정이 없으십니까? 
            <a href="register.jsp" class="register-link">회원가입</a>
        	</p>
            <input type="submit" value="Login">
        </form>
       
    </div>

    <script>
        function closeLoginForm() {
        	//index폼과 연결하기 
            alert("LoginForm Closed");
            }
    </script>
</body>
</html>
