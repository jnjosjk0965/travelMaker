package com.java.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
 // 회원가입을 제공하는 메소드
    public int register(UserDTO dto) {
    	int cnt=0;
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
          		String insertsql = "INSERT INTO user (userEmail, userPwd, userNName, userEName, userPassport, userCountry, userBirth) VALUES (?, ?, ?, ?, ?, ?, ?)";
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
    public ArrayList<UserDTO> getAllUsers() {
        String sql = "SELECT * FROM user;";
        ArrayList<UserDTO> userList = new ArrayList<>();
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
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) { 
				UserDTO uto = new UserDTO();
				uto.setUserEmail(rs.getString(1));
				uto.setUserPwd(rs.getString(2));
				uto.setUserNName(rs.getString(3));
				uto.setUserEName(rs.getString(4));
				uto.setUserPassport(rs.getString(5));
				uto.setUserCountry(rs.getString(6));
				uto.setUserBirth(rs.getString(7));
				uto.setAdmin(rs.getBoolean(8));
				userList.add(uto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs,pstmt,conn);
		}
        // 모든 유저 정보 반환 (ArrayList형태로 반환 받는다.)
        return userList;
    }
     
    // 유저 이메일을 통해 정보를 받아오는 메소드
    public List<UserDTO> searchUsersByEmail(String searchEmail) {
    	List<UserDTO> userList = new ArrayList<>();
        UserDTO user = null;
        

        try {
        	conn = JDBCUtil.getConnection();
        	String searchsql = "SELECT * FROM user WHERE userEmail = ?";
        	pstmt = conn.prepareStatement(searchsql);
            pstmt.setString(1, searchEmail);
            
            rs = pstmt.executeQuery(); 
            while (rs.next()) {
            	user = new UserDTO(rs.getString("userEmail"),rs.getString("userPwd"),rs.getString("userNName"),rs.getString("userEName"),
            					rs.getString("userPassport"),rs.getString("userCountry"),rs.getString("userBirth"),rs.getBoolean("isAdmin"));
            	userList.add(user);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
        	JDBCUtil.close(rs, pstmt, conn);
        	
        }

        return userList;
    }
    
    // 유저 계정 삭제 버튼을 누르면 회원정보를 삭제하는 메소드
    public List<UserDTO> deleteUser(String deleteuser) {
        List<UserDTO> remainlist = new ArrayList<>();
 
        try {
            conn = JDBCUtil.getConnection();
            String deletesql = "DELETE FROM user WHERE userEmail = ?";
            pstmt = conn.prepareStatement(deletesql);
            pstmt.setString(1, deleteuser);
            System.out.println("deleteuser: " + deleteuser);
            int rowsAffected = pstmt.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);
            
            if (rowsAffected > 0) {
                // 회원 삭제가 성공하면 남은 회원 목록을 조회
                String selectSql = "SELECT * FROM user";
                pstmt = conn.prepareStatement(selectSql);
                ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
                    UserDTO user = new UserDTO(rs.getString("userEmail"), rs.getString("userPwd"), rs.getString("userNName"),
                            rs.getString("userEName"), rs.getString("userPassport"), rs.getString("userCountry"),
                            rs.getString("userBirth"), rs.getBoolean("isAdmin"));
                    remainlist.add(user);
                }

                JDBCUtil.close(rs, pstmt, conn);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(pstmt, conn);
        }

        return remainlist;
    }
}