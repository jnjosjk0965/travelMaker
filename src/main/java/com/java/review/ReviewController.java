package com.java.review;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.user.UserDTO;
import com.servlet.api.beans.HotelDTO;
/**
 * Servlet implementation class ReviewController
 */
@WebServlet("/review.do")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//세션 값 받아오기. <userinfo>, <selectedHotel>
		HttpSession usersession = request.getSession();
		UserDTO userinfo = (UserDTO) usersession.getAttribute("userinfo");
		String userEmail = userinfo.getUserEmail(); // UserDTO에 있는 userEmail 속성을 가져옴
			
		HttpSession hotelsession = request.getSession();
		HotelDTO selectedHotel = (HotelDTO) hotelsession.getAttribute("selectedHotel");
		String hotelID = selectedHotel.getHotelId(); // HotelDTO에 있는 hotelID 속성을 가져옴
		
		// 별점 값 받아오기
        String allRating = request.getParameter("allRating");
        String cleanRating = request.getParameter("cleanRating");
        String locationRating = request.getParameter("locationRating");
        String serviceRating = request.getParameter("serviceRating");
        String faciRating = request.getParameter("faciRating");
        
        //리뷰 내용 받아오기
        String contents = request.getParameter("contents");

        // 받아온 값 확인
        System.out.println("arateRating: " + allRating);
        System.out.println("cleanRating: " + cleanRating);
        System.out.println("locationRating: " + locationRating);
        System.out.println("serviceRating: " + serviceRating);
        System.out.println("faciRating: " + faciRating);
        System.out.println("contents : "+ contents);
        
        ReviewDTO rdto = new ReviewDTO(userEmail, hotelID, allRating, cleanRating, locationRating, 
        		serviceRating, faciRating, contents);
        ReviewDao rdao = new ReviewDao();    

	}

}
