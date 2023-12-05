<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.java.user.UserDao" %>
	<%@ page import="com.java.user.User" %>
	<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 style="text-align: center;">header</h1>
<hr>
<h2 style="text-align: center;">Admin Page</h2>
<div id="nav-container">

<h3>이메일로 검색하기</h3>
<form method="post" action="/searchusr">
    <input type="text" id="searchEmail" name="searchEmail" placeholder="검색어 입력">
    <button type="submit">검색</button>
</form>

<%
    String searchEmail = request.getParameter("searchEmail");
    UserDao userDao = new UserDao();
    List<User> searchResults = userDao.searchUsersByEmail(searchEmail);
%>

<!-- 검색 결과를 표시하는 부분 추가 -->
<div>
    <h2>검색 결과</h2>
    <% for (User user : searchResults) { %>
        <p><%= user.getUserEmail() %></p>
        <!-- 다른 필요한 정보들을 추가로 표시할 수 있음 -->
    <% } %>
</div>
</body>
</html>