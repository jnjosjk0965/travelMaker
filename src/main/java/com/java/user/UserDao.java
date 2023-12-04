package com.java.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCUtil;

public class UserDao {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    // 로그인 기능을 제공하는 메소드
    public UserDTO login (UserDTO dto) {
        UserDTO udto = null;
        
        String userEmail=null;
        String userPwd=null;
        String userNName=null;
        String userEName=null;
        String userPassport=null;
        String userCountry=null;
        String userBirth=null;
        boolean isAdmin = false;
        
    	try {
        	conn = JDBCUtil.getConnection();
        	String sql = "select * from user where userEmail = ? and userPwd = ?";
        	pstmt = conn.prepareStatement(sql);
        	pstmt.setString(1,dto.getUserEmail());
        	pstmt.setString(2,dto.getUserPwd());
        	rs = pstmt.executeQuery(); 
        	
        	if(rs.next()) {
        		userEmail = rs.getString(1);
        		userPwd = rs.getString(2);
        		userNName = rs.getString(3);
        		userEName = rs.getString(4);
        		userPassport = rs.getString(5);
        		userCountry = rs.getString(6);
        		userBirth = rs.getString(7);
        		isAdmin = rs.getBoolean(8);
        		udto = new UserDTO(userEmail,userPwd,userNName,userEName,userPassport,userCountry,userBirth,isAdmin);
        	}
        	
        } catch(SQLException e) {
        	e.printStackTrace();
        }
		return udto;
      
    }
    public String getUserInfo(String colName, String Email) {
    	Connection conn = JDBCUtil.getConnection();
    	PreparedStatement ps = null;
    	ResultSet rs = null;
    	String result = "";
    	try {
			ps = conn.prepareStatement("select ? from user where userEmail= ?;");
			ps.setString(1, colName);
			ps.setString(2, Email);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return "";
    }
//    public int register(User user) {
//    	String SQL = "INSERT INTO USER VALUES(?,?,?,?,?,?)";
//    	try {
//    		 pstmt = conn.prepareStatement(SQL);
//    		 pstmt.setString(1, user.getUserEmail());
//    		 pstmt.setString(2, user.getUserPwd());
//    		 pstmt.setString(3, user.getUserNName());
//    		 pstmt.setString(4, user.getUserEName());
//    		 pstmt.setString(5, user.getUserCountry());
//    		 pstmt.setString(6, user.getUserBirth());
//    		 return pstmt.executeUpdate(); 
//    	} catch (Exception e) {
//    		e.printStackTrace();
//    	}
//    	return -1;
//    }
}