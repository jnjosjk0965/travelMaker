<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.java.user.UserDao" %>
<%@ page import="com.java.user.UserDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="kr">
<head>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bs/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mycss.css">
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <style>
   
     .search-button {
            background-color: #4CAF50;
            color: white;
            border-radius: 12px;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }
        .table- container{
        justify-content: center; /* 가운데 정렬 */
        padding: 10px;
        }
    
    
    </style>
</head>
<body>
<div class="container containerSize" style="padding:0;">
	<%@ include file="module/header.jsp" %>
	<h2 style="text-align: center;">Admin Page</h2>
</div>
<div id="nav-container">


<form method="post" action="search.do" style="display: flex; align-items: center; justify-content: flex-end; margin-right: 20px;">
    <input type="text" id="searchEmail" name="searchEmail" placeholder="회원 이메일 입력" style="width: 30%;  margin-right: 10px;">
    <button class="search-button" type="submit">검색</button>
</form>
 <br>
 <form action="check.do" method="post">
    <button type="submit" name="checkuser" style="margin-left: 5px; width: 90px; height: 40px; margin-bottom: 10px;">조회</button>
</form>
<%
    // DAO 클래스 및 메서드 호출
    UserDao userDao = new UserDao();
	
    List<UserDTO> userList = userDao.getAllUsers();
    
    List<UserDTO> usersByEmail = (List<UserDTO>)request.getAttribute("userList");
    if(usersByEmail != null) {
        userList = usersByEmail;
    }
    
    List<UserDTO> usersDelete = (List<UserDTO>)request.getAttribute("remainlist");
%>

<div class="table-container">
<form method="post" action="delete.do">
<table style="border: 1px solid #000;" >
    <thead>
        <tr>
            <th>회원 이메일</th>
            <th>회원 비밀번호</th>
            <th>회원 닉네임</th>
            <th>회원 여권이름</th>
            <th>회원 국가</th>
            <th>회원 생년월일</th>
            <th>권한 부여</th>
            <th>회원 탈퇴</th>
        </tr>
    </thead>
    <tbody>
      <% for (UserDTO user : userList) { %>
            <tr>
                <td><%= user.getUserEmail() %></td>
                <td><%= user.getUserPwd() %></td>
                <td><%= user.getUserNName() %></td>
                <td><%= user.getUserEName() %></td>
                <td><%= user.getUserCountry() %></td>
                <td><%= user.getUserBirth() %></td>
                <td><%= String.valueOf(user.isAdmin()) %></td>
                <td>
                <button name="deleteuser" value="<%= user.getUserEmail() %>" style="background-color: red; width: 90px;">계정 삭제</button></td>
            </tr>
        <% } %>
    </tbody>
</table>
</form>
</div>
</div>
</body>
</html>
    