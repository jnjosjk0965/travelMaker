<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="user.UserDao" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="userPwd" />
<jsp:setProperty name="user" property="userNName" />
<jsp:setProperty name="user" property="userEName" />
<jsp:setProperty name="user" property="userNum" />
<jsp:setProperty name="user" property="userCon" />
<jsp:setProperty name="user" property="userBirth" />
<html>
<head>
    <meta charset="UTF-8">
    <title>registerAction Page</title>
</head>
<body>
	<%
	if (user.getUserEmail() == null || user.getuserPwd() == null || user.getUserNName() == null 
			|| user.getUserEName() == null || user.getUserCon() == null || user.getUserBirth() == null  ) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alter('입력 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		UserDao userDao = new UserDao();
		int result = userDao.register(user);
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디 입니다.')");
			script.println("history.back()");
			script.println("</script>");
	   }
	  else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='main.jsp'"); //로그인 성공했을시 로그인성공 넘어가게 수정하기
		script.println("</script>");
	}
  }
	
	%>
</body>
</html>
