package com.java.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

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
    
    // 조회 
    public ArrayList<ReservationDTO> getResvList(UserDTO user){
    	String sql = "SELECT * FROM reservation where userEmail = ?;";
    	ArrayList<ReservationDTO> resvList = new ArrayList<>();
    	try {
    		conn = JDBCUtil.getConnection();
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, user.getUserEmail());
    		rs = pstmt.executeQuery();
    		while(rs.next()) {
    			ReservationDTO temp = new ReservationDTO();
    			temp.setResvId(rs.getString(1));
    			temp.setResvDate(rs.getString(2));
    			temp.setUserEmail(rs.getString(3));
    			temp.setFlightId(rs.getString(4));
    			temp.setRoomId(rs.getString(5));
    			temp.setAdults(rs.getInt(6));
    			temp.setChildren(rs.getInt(7));
    			resvList.add(temp);
    		}
    	}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
    	return resvList;
    }
    
    public FlightDTO getResvFlight(ReservationDTO resv){
    	String sql = "SELECT * FROM Flight where flightId = ?;";
    	FlightDTO temp = new FlightDTO();
    	try {
    		conn = JDBCUtil.getConnection();
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, resv.getFlightId());
    		rs = pstmt.executeQuery();

    		if(rs.next()) {
    			temp.setFlightId(rs.getString(1));
    			temp.setFlightPrice(rs.getInt(2));
    			temp.setOutboundFlightNo(rs.getString(3));
    			temp.setOutboundSeatClass(rs.getString(4));
    			temp.setOutboundAirline(rs.getString(5));
    			temp.setOutboundDuration(rs.getString(6));
    			temp.setOutboundDepartureTime(rs.getString(7));
    			temp.setOutboundDepartureAirport(rs.getString(8));
    			temp.setOutboundArrivalTime(rs.getString(9));
    			temp.setOutboundArrivalAirport(rs.getString(10));
    			temp.setReturnFlightNo(rs.getString(11));
    			temp.setReturnSeatClass(rs.getString(12));
    			temp.setReturnAirline(rs.getString(13));
    			temp.setReturnDuration(rs.getString(14));
    			temp.setReturnDepartureTime(rs.getString(15));
    			temp.setReturnDepartureAirport(rs.getString(16));
    			temp.setReturnArrivalTime(rs.getString(17));
    			temp.setReturnArrivalAirport(rs.getString(18));
    		}
    	}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
    	return temp;
    }
    
    public RoomDTO getResvRoom(ReservationDTO resv){
    	String sql = "SELECT * FROM room where roomId = ?;";
		RoomDTO temp = new RoomDTO();
    	try {
    		conn = JDBCUtil.getConnection();
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, resv.getRoomId());
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			temp.setRoomId(rs.getString(1));
    			temp.setHotelId(rs.getString(2));
    			temp.setCheckInDate(LocalDate.parse(rs.getString(3)));
    			temp.setCheckOutDate(LocalDate.parse(rs.getString(4)));
    			temp.setBeds(rs.getInt(5));
    			temp.setBedType(rs.getString(6));
    			temp.setRoomPrice(rs.getInt(7));
    		}
    	}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
    	return temp;
    }
    
    public HotelDTO getResvHotel(RoomDTO room){
    	String sql = "SELECT * FROM Hotel where hotelId = ?;";
    	HotelDTO temp = new HotelDTO();
    	try {
    		conn = JDBCUtil.getConnection();
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, room.getHotelId());
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			temp.setHotelId(rs.getString(1));
    			temp.setHotelName(rs.getString(2));
    			temp.setLatitude(rs.getFloat(3));
    			temp.setLongitude(rs.getFloat(4));;
    		}
    	}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
    	return temp;
    }
    
    public void deleteResv(String resvId) {
    	String select = "SELECT * FROM reservation where resvId = ?;";
    	String deleteResv = "DELETE FROM reservation where resvId = ?;";
    	String deleteFlight = "DELETE FROM Flight where flightId = ?;";
    	String deleteRoom = "DELETE FROM room where roomId = ?;";
    	ReservationDTO temp = new ReservationDTO();
    	try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(select);
			pstmt.setString(1, resvId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				temp.setResvId(rs.getString(1));
    			temp.setResvDate(rs.getString(2));
    			temp.setUserEmail(rs.getString(3));
    			temp.setFlightId(rs.getString(4));
    			temp.setRoomId(rs.getString(5));
    			temp.setAdults(rs.getInt(6));
    			temp.setChildren(rs.getInt(7));
			}
			pstmt = conn.prepareStatement(deleteResv);
			pstmt.setString(1, resvId);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(deleteFlight);
			pstmt.setString(1, temp.getFlightId());
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(deleteRoom);
			pstmt.setString(1, temp.getRoomId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
    }

}
