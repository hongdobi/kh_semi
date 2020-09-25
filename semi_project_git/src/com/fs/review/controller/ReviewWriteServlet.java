package com.fs.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.model.vo.Booking;

/**
 * Servlet implementation class ReviewWriteServlet
 */
@WebServlet("/review/reviewWrite")
public class ReviewWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/*
		 * String memberNo=request.getParameter("memberNo");
		 * 
		 * String result=new MemberService().selectMemberId(userId);
		 * 
		 * request.setAttribute("result",result);
		 * request.getRequestDispatcher("/views/member/checkIdDuplicate.jsp").forward(
		 * request, response);
		 */
//		String perfNo=request.getParameter("perfNo");
//		String memberId=request.getParameter("memberId");
//		Booking book=new BookingSevice().selectBooking(memberId);
//		request.setAttribute("perfNo", perfNo);
//		request.setAttribute("Book", book);
		request.getRequestDispatcher("/views/perf/reviewWrite.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
