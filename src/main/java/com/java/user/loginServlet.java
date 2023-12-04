package com.java.user;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login.do")
public class loginServlet extends HttpServlet {
	  private static final long serialVersionUID = 1L;


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userEmail = request.getParameter("userEmail");
		String userPwd = request.getParameter("userPwd");
		
		UserDao uDao = new UserDao();
		UserDTO udto = new UserDTO(userEmail,userPwd);
		UserDTO login = uDao.login(udto);
		
		if(login != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userinfo", login);
			response.sendRedirect("index.jsp");
			
		} else {
			
		}
	}

}
