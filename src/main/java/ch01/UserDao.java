package ch01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import ch01.User;

import common.JDBCUtil;


public class UserDao {

    public boolean logincheck(String userEmail, String userpwd) {
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
			conn = JDBCUtil.getConnection();
            String strQuery = "select userEmail, userpwd from users where userEmail = ? and userpwd = ?";

            pstmt = conn.prepareStatement(strQuery);
            pstmt.setString(1, userEmail);
            pstmt.setString(2, userpwd);
            rs = pstmt.executeQuery();
            loginCon = rs.next();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
        	JDBCUtil.close(rs, pstmt, conn);
        }
        return loginCon;
    }	

public boolean userInsert(User uDTO) {
	Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    boolean flag = false;
	try {
		String strQuery = "insert into users values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(strQuery);
		pstmt.setString(1, uDTO.getUserEmail());
		pstmt.setString(2, uDTO.getUserPwd());
		pstmt.setString(3, uDTO.getUserNName());
		pstmt.setString(4, uDTO.getUserEName());
		pstmt.setString(5, uDTO.getUserPassport());
		pstmt.setString(6, uDTO.getUserCountry());
		pstmt.setString(7, uDTO.getUserBirth());
		
		 int count = pstmt.executeUpdate();

         if (count == 1) {
             flag = true;
         }

     } catch (Exception ex) {
         System.out.println("Exception" + ex);
     } finally {
     	JDBCUtil.close(rs, pstmt, conn);
     }
     return flag;
 }		
    
}