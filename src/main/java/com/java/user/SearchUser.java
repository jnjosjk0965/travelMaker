package com.java.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.java.user.UserDao;
import com.java.user.UserDTO;

@WebServlet("/search.do")
public class SearchUser extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		String searchEmail = request.getParameter("searchEmail");
		
		UserDao userdao = new UserDao();
		List<UserDTO> userList = userdao.searchUsersByEmail(searchEmail);
		
		
		request.setAttribute("userList", userList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("AdminPage.jsp");
		dispatcher.forward(request, response);
        
    }
}
