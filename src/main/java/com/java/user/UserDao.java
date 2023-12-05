package com.java.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDao() {
        try {
            // 데이터베이스 연결 정보
            String dbURL = "jdbc:mysql://localhost:3306/traveldb?serverTimezone=UTC&useSSL=false&useUnicode=true&characterEncoding=utf-8";
            String dbID = "root";
            String dbPassword = "1234";

            // JDBC 드라이버 로드 및 데이터베이스 연결
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 로그인 기능을 제공하는 메소드
    public int login(String userEmail, String userPwd) {
        String SQL = "SELECT userPwd FROM USER WHERE userEmail=?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userEmail);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                // 데이터베이스에서 조회된 비밀번호와 입력된 비밀번호 비교
                if (rs.getString(1).equals(userPwd))
                    return 1; // 로그인 성공
                else
                    return 0; // 비밀번호 불일치
            } else {
                return -1; // 아이디가 없음
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 사용한 자원을 해제
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return -2; // 데이터베이스 오류
    }
    public int register(User user) {
    	String SQL = "INSERT INTO USER VALUES(?,?,?,?,?,?)";
    	try {
    		 pstmt = conn.prepareStatement(SQL);
    		 pstmt.setString(1, user.getUserEmail());
    		 pstmt.setString(2, user.getUserPwd());
    		 pstmt.setString(3, user.getUserNName());
    		 pstmt.setString(4, user.getUserEName());
    		 pstmt.setString(5, user.getUserCountry());
    		 pstmt.setString(6, user.getUserBirth());
    		 return pstmt.executeUpdate(); 
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return -1;
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