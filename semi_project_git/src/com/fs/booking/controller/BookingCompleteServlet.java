package com.fs.booking.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fs.booking.model.service.BookingService;
import com.fs.model.vo.Booking;
import com.fs.model.vo.Performance;
import com.fs.model.vo.Seat;
import com.fs.perfSsn.model.service.PerfSsnService;
import com.fs.seat.model.dao.SeatService;


@WebServlet("/book/bookingEnd")
public class BookingCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public BookingCompleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session=request.getSession(false);
		Booking book=(Booking)session.getAttribute("book");
		Performance perf=(Performance)session.getAttribute("perf");
		List list=(List)session.getAttribute("list");
		Seat seat=(Seat)session.getAttribute("seat");
		
		
		//today만들어서 집어넣기
		java.util.Date day=new java.util.Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date today=Date.valueOf(sdf.format(day));
		
		
		String msg="";
		String loc="";
		String script="";
		
		//book객체 DB에 넣기(예약하기)
		int result=new BookingService().insertBooking(book.getBookNo(),book.getMemberNo(),book.getPerfNo(),book.getNthPerf(),book.getBuyTicket(),book.getTotalPrice(),today);		
		if(result>0) {
			book=new BookingService().selectBooking(book.getBookNo());		
		}else {
			msg="";
			loc="/";
			session.invalidate();
			request.setAttribute("msg", "oops, something went wrong! please close this window and try again(error_code:book)");
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
		//seat객체 DB에 넣기(좌석예약)
		int result1=new SeatService().insertSeatDetail(seat.getBookNo(),seat.getSeatChoice(),seat.getSeatRank(),seat.getSeatPrice());		
		if(result1>0) {
			seat=new SeatService().selectSeating(book.getBookNo());
			msg="예약이 성공적으로 완료되었습니다! myPage에서 예매내역을 확인하세요.";
			loc="/";
			script="self.close()";			
			session.invalidate();
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.setAttribute("script", script);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			msg="";
			loc="/";
			session.invalidate();
			request.setAttribute("msg", "oops, something went wrong! please close this window and try again(error_code:seat)");
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
