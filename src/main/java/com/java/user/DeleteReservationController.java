package com.java.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteReservation.do")
public class DeleteReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReservationDAO resvDAO = new ReservationDAO();
		String[] targets =  request.getParameterValues("resvIdCheckbox");
		if (targets != null) {
		    for (String resvId : targets) {
		    	resvDAO.deleteResv(resvId);
		    }
		}
		request.getRequestDispatcher("myPageMain.jsp").forward(request, response);
	}

}
