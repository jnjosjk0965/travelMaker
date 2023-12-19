package com.java.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.java.review.ReviewDTO;

import common.JDBCUtil;

public class ReviewDao {
	    private Connection conn;
	    private PreparedStatement pstmt;
	    private ResultSet rs;
	    
	    // review내용을 등록하는 메소드
	    public int reviewRegister(ReviewDTO rdto) {
	        int cnt = 0;

	        try {
	            conn = JDBCUtil.getConnection();

	            // 이 부분은 필요 없으므로 주석 처리
	            // rs = pstmt.executeQuery();

	            String insertsql = "INSERT INTO review (userEmail, hotelID, userAllrate, userClean, userLocation, userService, userFacility, userContents) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
	            pstmt = conn.prepareStatement(insertsql);
	            pstmt.setString(1, rdto.getUserEmail());
	            pstmt.setString(2, rdto.getHotelID());
	            pstmt.setString(3, rdto.getUserAllrate());
	            pstmt.setString(4, rdto.getUserClean());
	            pstmt.setString(5, rdto.getUserLocation());
	            pstmt.setString(6, rdto.getUserService());
	            pstmt.setString(7, rdto.getUserFacility());
	            pstmt.setString(8, rdto.getUserContents());
	            cnt = pstmt.executeUpdate();

	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println("Exception: " + e.getMessage());
	        } finally {
	            // 사용한 자원을 닫음
	            JDBCUtil.close(rs, pstmt, conn);
	        }

	        // 결과 값을 반환
	        return cnt;
	    }
	}