package com.java.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.api.beans.FlightDTO;

@WebServlet("/SelectFlight.do")
public class SelectFlightController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		FlightDTO selected = new FlightDTO();
		
		selected.setFlightId(request.getParameter("flightId")); 
		selected.setFlightPrice(Integer.parseInt(request.getParameter("flightPrice")));
	    
	    selected.setOutboundFlightNo(request.getParameter("outboundFlightNo"));
	    selected.setOutboundSeatClass(request.getParameter("outboundSeatClass")); 
	    selected.setOutboundAirline(request.getParameter("outboundAirline"));
	    selected.setOutboundDuration(request.getParameter("outboundDuration"));
	    selected.setOutboundDepartureTime(request.getParameter("outboundDepartureTime"));
	    selected.setOutboundDepartureAirport(request.getParameter("outboundDepartureAirport"));
	    selected.setOutboundArrivalTime(request.getParameter("outboundArrivalTime"));
	    selected.setOutboundArrivalAirport(request.getParameter("outboundArrivalAirport"));
	    
	    selected.setReturnFlightNo(request.getParameter("returnFlightNo"));
	    selected.setReturnSeatClass(request.getParameter("returnSeatClass"));
	    selected.setReturnAirline(request.getParameter("returnAirline"));
	    selected.setReturnDuration(request.getParameter("returnDuration"));
	    selected.setReturnDepartureTime(request.getParameter("returnDepartureTime"));
	    selected.setReturnDepartureAirport(request.getParameter("returnDepartureAirport"));
	    selected.setReturnArrivalTime(request.getParameter("returnArrivalTime"));
	    selected.setReturnArrivalAirport(request.getParameter("returnArrivalAirport"));
	    
	    session.setAttribute("selected", selected);
	    
	    request.getRequestDispatcher("searchResult.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
