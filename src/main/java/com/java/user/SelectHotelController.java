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
		hotelInfo.setLatitude(Double.parseDouble(request.getParameter("latitude")));
		hotelInfo.setLongitude(Double.parseDouble(request.getParameter("longitude")));
		
		roomInfo.setHotelId(request.getParameter("hotelId"));
		roomInfo.setRoomId(request.getParameter("roomId"));
		roomInfo.setCheckInDate(LocalDate.parse(request.getParameter("checkInDate")));
		roomInfo.setCheckOutDate(LocalDate.parse(request.getParameter("checkOutDate")));
		roomInfo.setRoomType(request.getParameter("roomType"));
		roomInfo.setRoomPrice(Integer.parseInt(request.getParameter("roomPrice")));
		
		session.setAttribute("selectedHotel", hotelInfo);
		session.setAttribute("roomInfo", roomInfo);
		
		boolean showDetail = Boolean.parseBoolean(request.getParameter("showDetail"));
		
		if(showDetail) {
			// 상세 페이지로
			response.sendRedirect("hotelInfo.jsp");
		}else {
			// 결제 페이지로
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
