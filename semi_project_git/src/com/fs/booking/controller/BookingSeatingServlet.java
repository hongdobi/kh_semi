package com.fs.booking.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.booking.model.service.BookingService;
import com.fs.model.vo.PerfSsn;
import com.fs.model.vo.Performance;
import com.fs.perfSsn.model.service.PerfSsnService;


@WebServlet("/book/seating")
public class BookingSeatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BookingSeatingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String perfNo=request.getParameter("perfNo");
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		String dateTime=request.getParameter("dateTime");
		int nofTicket=Integer.parseInt(request.getParameter("nofTicket"));
		
		System.out.println(perfNo+" "+memberNo+" "+dateTime+" 티켓수:"+nofTicket);
		
		String bDate=dateTime.substring(4,14);
		Date bookDate=Date.valueOf(bDate);
		
		System.out.println("dateTime: "+dateTime+" bookDate: "+bookDate);
		
		//perf는 startDate와 endDate를 알기위해 가져옴
		Performance perf=new BookingService().selectBookingDate(perfNo,bookDate);
		//list에는 nthPerf, perfNo, dateTime이 들어있음
		List<PerfSsn> list=new PerfSsnService().selectSsnTime(perfNo,bookDate);			
		
		System.out.println("perfssn: "+list);
		System.out.println("perf: "+perf);
		
		//여기서 bookDate를 다시 시간까지 해서 준다면?
		bDate=dateTime.substring(4);
		java.util.Date bkDate=new java.util.Date();
		try {
			bkDate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(bDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		request.setAttribute("perfNo", perfNo);
		request.setAttribute("memberNo", memberNo);
//		request.setAttribute("dateTime", dateTime);
		request.setAttribute("bookDate", bkDate);
		request.setAttribute("nofTicket", nofTicket);
		System.out.println("이거잘봐 bookDate= "+bkDate);
		request.setAttribute("perf", perf);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/book/seating.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
