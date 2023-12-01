package ch01;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 사용자로부터 전달된 이메일과 비밀번호 파라미터 가져오기
        String userEmail = request.getParameter("userEmail");
        String userPwd = request.getParameter("userPwd");

        // UserDao 인스턴스 생성 및 로그인 처리
        UserDao userDao = new UserDao();
        boolean loginCheck = userDao.logincheck(userEmail, userPwd);
        
        // 로그인 결과에 따른 처리
        if (loginCheck) {
        	request.setAttribute("loginResult", loginCheck);
			HttpSession session = request.getSession();
			session.setAttribute("userEmailKey",userEmail);
			RequestDispatcher dispatcher = request.getRequestDispatcher("webapp/index.jsp");
			dispatcher.forward(request, response);
        } else {
        	//alter로 잘못입력함을 알려줄것임
        	response.sendRedirect("login.jsp");
        }
    }
}
