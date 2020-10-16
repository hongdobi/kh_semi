package com.fs.booking.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		String perfNo=request.getParameter("perfNo");
//		java.util.Date bookDate=new java.util.Date();
		String date=request.getParameter("day");
		System.out.println(date);
		Date bookDate=Date.valueOf(date);
		
		
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
//		bookDate=sdf.parse(date);
//		try {
//			bookDate=sdf.parse(request.getParameter("day"));
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		int memberNo=1;
//		String perfNo="M1";
//		String date="2020-11-15";
//		Date bookDate=Date.valueOf(date);

		
//	      //선택가능일자 기능 추가 
//	      int memberNo=Integer.parseInt(request.getParameter("memberNo"));
//	      String perfNo=request.getParameter("perfNo");
//	      Date bookDate=null;
//	      List dateList=new ArrayList();
//	      //parameter로 받아온 dateList string-> List로 변환
//	      if(request.getParameter("dateList")!=null) {
//	         String date=request.getParameter("day");
//	         bookDate=Date.valueOf(date);
//	         String dates=request.getParameter("dateList");      
//	         dates=dates.replaceAll("\\[", "");
//	         dates=dates.replaceAll("\\]", "");
//	         dates=dates.replaceAll(" ", "");   
//	         String []arr=dates.split(",");
//	         for(int i=0;i<arr.length;i++) {
//	            dateList.add(arr[i]);
//	         }
//	      }


		
		System.out.println("이거됩니까?: "+bookDate);
		
		
		if(bookDate!=null) {
			Performance perf=new BookingService().selectBookingDate(perfNo,bookDate);
			List<PerfSsn> list=new PerfSsnService().selectSsnTime(perfNo,bookDate);	
			//공연 날짜만 가져오기
			List dateList=new PerfSsnService().selectDateTime(perfNo);	

			System.out.println("perf: "+perf);
			
			request.setAttribute("memberNo", memberNo);
			request.setAttribute("perfNo", perfNo);
			request.setAttribute("bookDate", bookDate);
			request.setAttribute("perf", perf);
			request.setAttribute("list", list);
			request.setAttribute("dateList", dateList);
			System.out.println(list);
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
