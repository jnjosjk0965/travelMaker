package com.java.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
<<<<<<< HEAD
import java.util.ArrayList;
import java.util.List;
=======

import common.JDBCUtil;
>>>>>>> 267b6c11c953b10be48837329927ebe290b69682

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
 // 회원가입을 제공하는 메소드
    public int register(UserDTO dto) {
    	int cnt=0;
        String userEmail=null;
        String userPwd=null;
        String userNName=null;
        String userEName=null;
        String userPasssport=null;
        String userCountry=null;
        String userBirth=null;
        try {
            conn = JDBCUtil.getConnection();

            // 사용자가 이미 존재하는지 확인
            String selectSql = "SELECT * FROM user WHERE userEmail = ?";
            pstmt = conn.prepareStatement(selectSql);
            pstmt.setString(1, dto.getUserEmail());
            rs = pstmt.executeQuery();
            if(rs.next()) {
                cnt = -1;
             } else {
          		String insertsql = "INSERT INTO user (userEmail, userPwd, userNName, userEName, userPasssport, userCountry, userBirth) VALUES (?, ?, ?, ?, ?, ?, ?)";
            	pstmt = conn.prepareStatement(insertsql);
            	pstmt.setString(1, dto.getUserEmail());
            	pstmt.setString(2, dto.getUserPwd());
            	pstmt.setString(3, dto.getUserNName());
            	pstmt.setString(4, dto.getUserEName());
            	pstmt.setString(5, dto.getUserPassport());
            	pstmt.setString(6, dto.getUserCountry());
            	pstmt.setString(7, dto.getUserBirth());
          		cnt = pstmt.executeUpdate();
          		}
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 사용한 자원을 닫음
            JDBCUtil.close(rs, pstmt, conn);
        }

        // 결과 값을 반환
        return cnt;
    }
    
    //관리자 페이지의 모든 회원 정보 출력 DAO
    public List<User> getAllUsers() {
        String sql = "SELECT * FROM USER";
        List<User> userList = new ArrayList<>();

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    User user = new User();
                    user.setUserEmail(rs.getString("UserEmail"));
                    user.setUserPwd(rs.getString("UserPwd"));
                    user.setUserNName(rs.getString("UserNName"));
                    user.setUserEName(rs.getString("UserEName"));
                    user.setUserCountry(rs.getString("UserCountry"));
                    user.setUserBirth(rs.getString("UserBirth"));

                    userList.add(user);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return userList;
    }
    public List<User> searchUsersByEmail(String email) {
        List<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM USER WHERE UserEmail = ?";

        try {
        	PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);

            ResultSet rs = pstmt.executeQuery(); 
            while (rs.next()) {
            	User user = new User();
            	user.setUserEmail(rs.getString("UserEmail"));
            	user.setUserPwd(rs.getString("UserPwd"));
            	user.setUserNName(rs.getString("UserNName"));
            	user.setUserEName(rs.getString("UserEName"));
            	user.setUserCountry(rs.getString("UserCountry"));
            	user.setUserBirth(rs.getString("UserBirth"));

            	userList.add(user);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
        	try {
        		pstmt.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        	
        }

        return userList;
    }
}