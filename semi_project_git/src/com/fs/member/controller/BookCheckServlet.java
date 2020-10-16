package com.fs.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fs.booking.model.service.BookingService;
import com.fs.model.vo.Booking;
import com.fs.model.vo.Member;
import com.fs.perf.model.service.PerfService;

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
		System.out.println("BookCheckServlet 접속");
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();
		System.out.println("회원번호:" + memberNo);
		/*
		 * String memberId = loginMember.getMemberId(); int memberNo =
		 * Integer.parseInt(new MemberService().memberNo(memberId)); // 정상
		 */		
		List<Booking> list = new BookingService().findBooking(memberNo);
		System.out.println("서블릿 : 예매내역 확보" + list);
		String perfName = "";
		PerfService ps = new PerfService();
		for(int i=0; i <list.size(); i++) {
			perfName += ps.selectPerformance(list.get(i).getPerfNo()).getPerfName() +",";
		}
		/* System.out.println(perfNo[0]); */
		request.setAttribute("perfName", perfName);
		System.out.println("perfNo: " + perfName);
		request.setAttribute("bookingList", list);
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
