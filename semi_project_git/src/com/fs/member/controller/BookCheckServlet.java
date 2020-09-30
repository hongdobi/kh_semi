package com.fs.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fs.booking.model.service.BookingService;
import com.fs.member.model.service.MemberService;
import com.fs.model.vo.Booking;
import com.fs.model.vo.Member;

/**
 * Servlet implementation class BookCheckServlet
 */
@WebServlet("/member/bookChecker")
public class BookCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 세션에서 아이디 값 받아와서 performance service에게 전달
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		int memberNo = Integer.parseInt(new MemberService().memberNo(memberId));
		Booking b = new BookingService().findBooking(memberNo);
		System.out.println("서블릿 : 예매내역 확보" + b);
		request.setAttribute("bookingInfo", b);
		request.getRequestDispatcher("/views/member/bookCheck.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
