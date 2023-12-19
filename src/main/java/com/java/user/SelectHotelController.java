package com.java.user;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.api.beans.HotelDTO;
import com.servlet.api.beans.RoomDTO;

@WebServlet("/SelectHotel.do")
public class SelectHotelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		HotelDTO hotelInfo = new HotelDTO();
		RoomDTO roomInfo =new RoomDTO();
		
		hotelInfo.setHotelId(request.getParameter("hotelId"));
		hotelInfo.setHotelName(request.getParameter("hotelName"));
		hotelInfo.setLatitude(Float.parseFloat(request.getParameter("latitude")));
		hotelInfo.setLongitude(Float.parseFloat(request.getParameter("longitude")));
		
		roomInfo.setHotelId(request.getParameter("hotelId"));
		roomInfo.setRoomId(request.getParameter("roomId"));
		roomInfo.setCheckInDate(LocalDate.parse(request.getParameter("checkInDate")));
		roomInfo.setCheckOutDate(LocalDate.parse(request.getParameter("checkOutDate")));
		roomInfo.setBeds(Integer.parseInt(request.getParameter("beds")));
		roomInfo.setBedType(request.getParameter("bedType"));
		roomInfo.setRoomPrice(Integer.parseInt(request.getParameter("roomPrice")));
		
		String description = request.getParameter("description");
		session.setAttribute("selectedHotel", hotelInfo);
		session.setAttribute("roomInfo", roomInfo);
		
		UserDTO user = (UserDTO)session.getAttribute("userinfo");
		
		boolean showDetail = Boolean.parseBoolean(request.getParameter("showDetail"));
		
		if(showDetail) {
			// 상세 페이지로
			response.sendRedirect("hotelInfo.jsp?description=" + description);
		}
		else if(user == null) {
            String errorMessage = "로그인이 필요합니다.";
            session.setAttribute("permissionError", errorMessage);
            
            // 인코딩 설정
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");

            // 
            String alertScript = "alert('" + errorMessage + "'); window.location.href='searchResult.jsp';";
            response.getWriter().println("<script>" + alertScript + "</script>");
		}
		else {
			// 결제 페이지로
			response.sendRedirect("purchase.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
