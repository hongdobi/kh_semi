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


@WebServlet("/book/booking")
public class BookingViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BookingViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
//		String perfNo=request.getParameter("perfNo");
//		Date bookDate=null;
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
//		try {
//			bookDate=sdf.parse(request.getParameter("bookDate"));
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
		int memberNo=1;
		String perfNo="M1";
		String date="2020-11-15";
		Date bookDate=Date.valueOf(date);
//		bookDate=null;

		
		System.out.println(bookDate);
		
		if(bookDate!=null) {
			Performance perf=new BookingService().selectBookingDate(perfNo,bookDate);
			List<PerfSsn> list=new PerfSsnService().selectSsnTime(perfNo,bookDate);			

			System.out.println("perf: "+perf);
			
			request.setAttribute("memberNo", memberNo);
			request.setAttribute("perfNo", perfNo);
			request.setAttribute("bookDate", bookDate);
			request.setAttribute("perf", perf);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/book/booking.jsp").forward(request, response);
			
		}else {		
			
			request.setAttribute("memberNo", memberNo);
			request.setAttribute("perfNo", perfNo);

			request.getRequestDispatcher("/views/book/booking.jsp").forward(request, response);
		}
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
