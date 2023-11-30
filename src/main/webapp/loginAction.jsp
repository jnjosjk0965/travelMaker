<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.UserDao" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="java.User" scope="page" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="userPwd" />
<html>
<head>
    <meta charset="UTF-8">
    <title>loginAction Page</title>
</head>
<body>
	<%
	UserDao userDao = new UserDao();
	int result = userDao.login(user.getUserEmail(), user.getuserPwd());
	if (result == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("response.sendRedirect('main.jsp');"); //로그인 성공시 main 으로 넘어감
		script.println("</script>");
	}
	else if (result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀렸습니다.')"); 
		script.println("history.back()"); 
		script.println("</script>");
	}
	else if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디 입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if (result == -2) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	
	%>
</body>
</html>