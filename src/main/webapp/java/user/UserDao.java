package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDao() {
        try {
            // 데이터베이스 연결 정보
            String dbURL = "jdbc:mysql://localhost:3306/traveldb";
            String dbID = "root";
            String dbPassword = "1234";

            // JDBC 드라이버 로드 및 데이터베이스 연결
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 로그인 기능을 제공하는 메소드
    public int login(String userEmail, String userPasswd) {
        String SQL = "SELECT userPasswd FROM USER WHERE userEmail=?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userEmail);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                // 데이터베이스에서 조회된 비밀번호와 입력된 비밀번호 비교
                if (rs.getString(1).equals(userPasswd))
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
}