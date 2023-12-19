<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .header {
            background-color: #7b9acc;
            padding: 20px;
            color: #fff;
            text-align: center;
        }

        .header img {
            width: 180px;
        }

        .header h3 {
            margin-top: 10px;
        }

        .header ul {
            list-style-type: none;
            padding: 0;
            margin: 10px 0 0;
        }

        .header ul li {
            display: inline-block;
            margin-right: 10px;
        }

        .nav-container {
            display: flex;
            justify-content: space-between;
            padding: 20px;
        }

        .nav-container nav {
            display: flex;
        }

        .nav-container h3 {
            margin-right: 20px;
        }

        .footer {
            background-color: #7b9acc;
            padding: 20px;
            color: #fff;
            text-align: center;
        }

        .footer ul {
            list-style-type: none;
            padding: 0;
            margin: 10px 0 0;
        }

        .footer ul li {
            display: inline-block;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="header">
        <a href="/">
            <img src="img/logo/TM_Logo.png" alt="Team Travel Maker Logo">
        </a>
        <h3>Team Travel Maker</h3>
        <ul>
            <li>주재석</li>
            <li>전진우</li>
            <li>홍주이</li>
        </ul>
    </div>

    <!-- Footer -->
    <div class="footer">
        <ul>
        	<li>기능 </li>
        	<li> |  </li>
            <li>로그인 </li>
            <li>예약관리 </li>
            <li>개인정보 </li>
            <li>리뷰관리 </li>
            <li>호텔예약 </li>
            <li>비행기예약 </li>
        </ul>
        <p>&copy; 2023 Team Travel Maker. All rights reserved.</p>
    </div>
</body>
</html>
