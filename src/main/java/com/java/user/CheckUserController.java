package com.java.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/check.do")
public class CheckUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	            UserDao userdao = new UserDao();
	            ArrayList<UserDTO> userList = userdao.getAllUsers();
	            System.out.println(userList.get(0).getUserBirth());
	            // 조회된 정보를 request에 설정
	            request.setAttribute("userList", userList);
	            System.out.println("데이터 받아서 userdao시키기");
	            // AdminPage.jsp로 포워딩
	            RequestDispatcher dispatcher = request.getRequestDispatcher("AdminPage.jsp");
	            dispatcher.forward(request, response);
	            System.out.println("이거 나오면 데이터 뿌리는거 되는건데 ㅋ");
	}
}
