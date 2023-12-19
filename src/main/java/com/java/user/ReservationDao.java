package com.java.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.servlet.api.beans.FlightDTO;
import com.servlet.api.beans.HotelDTO;
import com.servlet.api.beans.RoomDTO;

import common.JDBCUtil;

public class ReservationDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    
    //호텔 정보 입력
    // 1 : 입력 성공  2 : 이미 존재  0 : 실패
    public int insertHotel(HotelDTO hotel) {
    	try {
    		conn = JDBCUtil.getConnection();
    		
    		String check = "SELECT * FROM Hotel WHERE hotelId = ?;";
    		pstmt = conn.prepareStatement(check);
    		pstmt.setNString(1, hotel.getHotelId());
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			return 2;
    		}else {
    			String insertsql = "INSERT INTO Hotel VALUES(?,?,?,?);";
    			pstmt = conn.prepareStatement(insertsql);
    			pstmt.setString(1, hotel.getHotelId());
    			pstmt.setString(2, hotel.getHotelName());
    			pstmt.setFloat(3, hotel.getLatitude());
    			pstmt.setFloat(4, hotel.getLongitude());
    			return pstmt.executeUpdate();
    		}
    	}catch (SQLException e) {
			e.printStackTrace();
    	}finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
    	return 0;
    }
    
    public int insertFlight(FlightDTO flight) {
    	try {
    		conn = JDBCUtil.getConnection();
    		
    		String check = "SELECT * FROM Flight WHERE flightId = ?;";
    		pstmt = conn.prepareStatement(check);
    		pstmt.setNString(1, flight.getFlightId());
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			return 2;
    		}else {
    			String insertsql = "INSERT INTO Flight VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
    			pstmt = conn.prepareStatement(insertsql);
    			pstmt.setString(1, flight.getFlightId());
    			pstmt.setInt(2, flight.getFlightPrice());
    			pstmt.setString(3, flight.getOutboundFlightNo());
    			pstmt.setString(4, flight.getOutboundSeatClass());
    			pstmt.setString(5, flight.getOutboundAirline());
    			pstmt.setString(6, flight.getOutboundDuration());
    			pstmt.setString(7, flight.getOutboundDepartureTime());
    			pstmt.setString(8, flight.getOutboundDepartureAirport());
    			pstmt.setString(9, flight.getOutboundArrivalTime());
    			pstmt.setString(10, flight.getOutboundArrivalAirport());
    			pstmt.setString(11, flight.getReturnFlightNo());
    			pstmt.setString(12, flight.getReturnSeatClass());
    			pstmt.setString(13, flight.getReturnAirline());
    			pstmt.setString(14, flight.getReturnDuration());
    			pstmt.setString(15, flight.getReturnDepartureTime());
    			pstmt.setString(16, flight.getReturnDepartureAirport());
    			pstmt.setString(17, flight.getReturnArrivalTime());
    			pstmt.setString(18, flight.getReturnArrivalAirport());
    			return pstmt.executeUpdate();
    		}
    	}catch (SQLException e) {
			e.printStackTrace();
    	}finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
    	return 0;
    }
    
    public int insertRoom(RoomDTO room) {
    	try {
    		conn = JDBCUtil.getConnection();
    		
    		String check = "SELECT * FROM room WHERE roomId = ?;";
    		pstmt = conn.prepareStatement(check);
    		pstmt.setString(1, room.getRoomId());
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			return 2;
    		}else {
    			String insertsql = "INSERT INTO room(roomId,hotelId,checkInDate,checkOutDate,beds,bedType,roomPrice) VALUES(?,?,?,?,?,?,?);";
    			pstmt = conn.prepareStatement(insertsql);
    			pstmt.setString(1, room.getRoomId());
    			pstmt.setString(2, room.getHotelId());
    			pstmt.setString(3, room.getCheckInDate().toString());
    			pstmt.setString(4, room.getCheckOutDate().toString());
    			pstmt.setInt(5, room.getBeds());
    			pstmt.setString(6, room.getBedType());
    			pstmt.setInt(7, room.getRoomPrice());
    			
    			return pstmt.executeUpdate();
    		}
    	}catch (SQLException e) {
			e.printStackTrace();
    	}finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
    	return 0;
    }
    
    public int insertReservation(ReservationDTO reservation) {
    	try {
    		conn = JDBCUtil.getConnection();
    		
    		String check = "SELECT * FROM reservation WHERE resvId = ?;";
    		pstmt = conn.prepareStatement(check);
    		pstmt.setString(1, reservation.getResvId());
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			return 2;
    		}else {
    			String insertsql = "INSERT INTO reservation(userEmail,flightId,roomId,adults,children) VALUES(?,?,?,?,?);";
    			pstmt = conn.prepareStatement(insertsql);
    			pstmt.setString(1, reservation.getUserEmail());
    			pstmt.setString(2, reservation.getFlightId());
    			pstmt.setString(3, reservation.getRoomId());
    			pstmt.setInt(4, reservation.getAdults());
    			pstmt.setInt(5, reservation.getChildren());
    			
    			return pstmt.executeUpdate();
    		}
    	}catch (SQLException e) {
			e.printStackTrace();
    	}finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
    	return 0;
    }
}
