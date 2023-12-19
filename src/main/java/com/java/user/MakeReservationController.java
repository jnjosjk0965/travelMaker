package com.java.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.api.beans.FlightDTO;
import com.servlet.api.beans.HotelDTO;
import com.servlet.api.beans.RoomDTO;
import com.servlet.api.beans.SearchInfo;

@WebServlet("/MakeReservation.do")
public class MakeReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		SearchInfo searchInfo = (SearchInfo)session.getAttribute("searchInfo");
		UserDTO user = (UserDTO)session.getAttribute("userinfo");
		HotelDTO hotel = (HotelDTO)session.getAttribute("selectedHotel");
		FlightDTO flight = (FlightDTO)session.getAttribute("selected");
		RoomDTO room = (RoomDTO)session.getAttribute("roomInfo");
		
		ReservationDTO reservation = new ReservationDTO();
		reservation.setUserEmail(user.getUserEmail());
		reservation.setFlightId(flight.getFlightId());
		reservation.setRoomId(room.getRoomId());
		reservation.setAdults(Integer.parseInt(searchInfo.getAdults()));
		reservation.setChildren(Integer.parseInt(searchInfo.getChildren()));
				
		ReservationDAO resvDAO = new ReservationDAO();
		// 호텔 정보 입력
		if(resvDAO.insertHotel(hotel) < 0) { // 실패시
			System.out.println("호텔 정보 입력 실패");
			
			String errorMessage = "예약에 실패했습니다.";
	        session.setAttribute("reservationError", errorMessage);
	        
	        response.setCharacterEncoding("UTF-8");
	        response.setContentType("text/html;charset=UTF-8");

	        String alertScript = "alert('" + errorMessage + "'); window.location.href='index.jsp';";
	        response.getWriter().println("<script>" + alertScript + "</script>");

		// 항공편 정보 입력
		}else if(resvDAO.insertFlight(flight) < 0) {
			System.out.println("항공편 정보 입력 실패");
			String errorMessage = "예약에 실패했습니다.";
	        session.setAttribute("reservationError", errorMessage);
	        
	        response.setCharacterEncoding("UTF-8");
	        response.setContentType("text/html;charset=UTF-8");

	        String alertScript = "alert('" + errorMessage + "'); window.location.href='index.jsp';";
	        response.getWriter().println("<script>" + alertScript + "</script>");

		// 방 정보 입력
		}else if(resvDAO.insertRoom(room) < 0) {
			System.out.println("방 정보 입력 실패");
			String errorMessage = "예약에 실패했습니다.";
	        session.setAttribute("reservationError", errorMessage);
	        
	        response.setCharacterEncoding("UTF-8");
	        response.setContentType("text/html;charset=UTF-8");

	        String alertScript = "alert('" + errorMessage + "'); window.location.href='index.jsp';";
	        response.getWriter().println("<script>" + alertScript + "</script>");

		}else {
			// 예약 정보 입력
			resvDAO.insertReservation(reservation);
		}
		
		
		response.sendRedirect("reservationSuccess.jsp");
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
