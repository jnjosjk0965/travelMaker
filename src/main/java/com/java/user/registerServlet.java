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
public class registerServlet extends HttpServlet {
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
        String userEName = request.getParameter("userEName");
        String userPasssport = request.getParameter("userPasssport");
        String userCountry = request.getParameter("userCountry");
        String userBirth = request.getParameter("userBirth");

        UserDTO rdto = new UserDTO(userEmail,userPwd,userNName,userEName,userPasssport,userCountry,userBirth);
        UserDao rdao = new UserDao();
        int cnt = rdao.register(rdto);
        if(cnt>0) {
        	out.println("<script>alert('회원가입에 성공했습니다.'); location.href='register.jsp';</script>");
        	
        } else if(cnt == -1) {
            out.println("<script>alert('이미 등록된 이메일입니다.'); location.href='register.jsp';</script>"); 
            
        } else {
           out.println("<script>alert('회원가입에 실패했습니다.'); location.href='register.jsp';</script>"); 
           
        }
        out.close();
     }

}

