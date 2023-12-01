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

@WebServlet("/register.do")
public class RegisterServlet extends HttpServlet {
    protected void doget(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 사용자로부터 전달된 회원가입 정보 파라미터 가져오기
        String userEmail = request.getParameter("userEmail");
        String userPwd = request.getParameter("userPwd");
        String userNName = request.getParameter("userNName");
        String userEName = request.getParameter("userEName");
        String userPassport = request.getParameter("userPassport");
        String userCountry = request.getParameter("userCountry");
        String userBirth = request.getParameter("userBirth");
        
        User uDto = new User();
		uDto.setUserEmail(userEmail);
		uDto.setUserPwd(userPwd);
		uDto.setUserNName(userNName);
		uDto.setUserEName(userEName);
		uDto.setUserPassport(userPassport);
		uDto.setUserCountry(userCountry);
		uDto.setUserBirth(userBirth);
		
		UserDao uDao = new UserDao();	
		boolean insertCheck = uDao.userInsert(uDto);

		 if(insertCheck){
		    	request.setAttribute("RegisterResult", insertCheck);
				HttpSession session = request.getSession();
				session.setAttribute("userEmail",userEmail );
				RequestDispatcher dispatcher = request.getRequestDispatcher("/Index.jsp");
				dispatcher.forward(request, response);

			}else{
		    	request.setAttribute("RegisterResult", 0);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/Register.jsp");
				dispatcher.forward(request, response);
			}
			   

			  
		}


		
	}



