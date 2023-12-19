package com.java.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/register.do")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        PrintWriter out = response.getWriter();

        String userEmail = request.getParameter("userEmail");
        String userPwd = request.getParameter("userPwd");
        String userNName = request.getParameter("userNName");
        
        // 이름을 성과 이름으로 나눠 입력
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String userEName = firstName + lastName;
        
        String userPassport = request.getParameter("userPassport");
        String userCountry = request.getParameter("userCountry");
        // 년,월,일 버튼 3개로 나눈걸 userBirth에 합쳐 userBith 입력
        String birthYear = request.getParameter("birthYear");
        String birthMonth = request.getParameter("birthMonth");
        String birthDay = request.getParameter("birthDay");
        String userBirth = birthYear + "-" + birthMonth + "-" + birthDay;

        UserDTO rdto = new UserDTO(userEmail,userPwd,userNName,userEName,userPassport,userCountry,userBirth);
        UserDao rdao = new UserDao();
        int cnt = rdao.register(rdto);
        if(cnt>0) {
        	
        	
        	out.println("<script>alert('회원가입에 성공했습니다.'); location.href='index.jsp';</script>");
        	
        } else if(cnt == -1) {
            out.println("<script>alert('이미 등록된 이메일입니다.'); location.href='register.jsp';</script>"); 
            
        } else {
           out.println("<script>alert('회원가입에 실패했습니다.'); location.href='register.jsp';</script>"); 
           
        }
        out.close();
     }

}

