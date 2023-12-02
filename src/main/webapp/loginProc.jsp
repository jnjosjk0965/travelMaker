<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<jsp:useBean id="userDao" class="ch01.UserDao" />
<jsp:useBean class="ch01.User" id="user" scope="session" />
<jsp:setProperty name="user" property="*" />
<%
	boolean loginCheck = userDao.logincheck(user.getUserEmail(), user.getUserPwd()); 
%>
<%
   if(loginCheck){
	  session.setAttribute("userEmail",user.getUserEmail());
	  response.sendRedirect("index.jsp");
   } else{
%>
       <script>
           alert('로그인 실패하셨습니다.');
           window.location.href = 'login.jsp';
       </script>
<%
   }
%>

