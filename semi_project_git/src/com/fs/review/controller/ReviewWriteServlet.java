package com.fs.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.booking.model.service.BookingService;
import com.fs.model.vo.Booking;
import com.fs.model.vo.Performance;
import com.fs.perf.model.service.PerfService;

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
		
		
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		String perfNo=request.getParameter("perfNo");
		Performance perf=new PerfService().selectPerformance(perfNo);
		String perfName=perf.getPerfName();
		//회원번호랑, 공연번호로 회원이 관람한 공연 내역 불러오기
		List<Booking> bkList=new BookingService().selectBookingRV(perfNo,memberNo);

		request.setAttribute("memberNo", memberNo);
		request.setAttribute("perf", perf);
		request.setAttribute("bkList", bkList);
		request.getRequestDispatcher("/views/review/reviewWrite.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
