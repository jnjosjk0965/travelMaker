package com.java.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.api.beans.FlightDTO;
import com.servlet.api.beans.HotelDTO;
import com.servlet.api.beans.RoomDTO;

@WebServlet("/LoadMyPage.do")
public class LoadMyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	UserDTO user =  (UserDTO)session.getAttribute("userinfo");
    	ReservationDAO resvDAO = new ReservationDAO();
    	
    	ArrayList<ReservationDTO> resvList = resvDAO.getResvList(user);
    	ArrayList<FlightDTO> flightList = new ArrayList<>();
    	ArrayList<RoomDTO> roomList = new ArrayList<>();
    	ArrayList<HotelDTO> hotelList = new ArrayList<>();
    	
    	for (ReservationDTO reservationDTO : resvList) {
    		flightList.add(resvDAO.getResvFlight(reservationDTO));
    		RoomDTO room = resvDAO.getResvRoom(reservationDTO);
    		roomList.add(room);
    		hotelList.add(resvDAO.getResvHotel(room));
		}
    	if(resvList != null) {
    		request.setAttribute("resvList", resvList);
        	request.setAttribute("flightList", flightList);
        	request.setAttribute("roomList", roomList);
        	request.setAttribute("hotelList", hotelList);
    	}
    	request.getRequestDispatcher("myPageMain.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
