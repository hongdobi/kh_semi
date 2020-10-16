package com.fs.booking.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fs.booking.model.service.BookingService;
import com.fs.model.vo.Booking;
import com.fs.model.vo.PerfSsn;
import com.fs.model.vo.Performance;
import com.fs.model.vo.Seat;
import com.fs.perfSsn.model.service.PerfSsnService;
import com.fs.seat.model.dao.SeatService;


@WebServlet("/book/promo")
public class BookingPromoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public BookingPromoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String perfNo=request.getParameter("perfNo");
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));		
		String dateChoice=request.getParameter("date_choice");		
		String ssnChoice=request.getParameter("ssn_choice");
		Date bDate=Date.valueOf(ssnChoice.substring(4,14));
		int nofTicket=Integer.parseInt(request.getParameter("nofTicket"));
		
		
//		SimpleDateFormat sd=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//		java.util.Date dateTime=new java.util.Date();
//		try {
//			dateTime=sd.parse(ssnChoice.substring(4));
//		} catch (ParseException e) {			
//			e.printStackTrace();
//		}
//		String date_time=sd.format(dateTime);
//				
//		java.sql.Date ssn_choice=Date.valueOf(date_time);
//		System.out.println("Look at this: "+ssn_choice);
		
		//perf는 공연명을 가져오기 위해
		Performance perf=new BookingService().selectBookingDate(perfNo,bDate);
		List<PerfSsn> list=new PerfSsnService().selectSsnTime(perfNo,bDate);
		
		System.out.println(list);
		
		
		//seatNo(좌석번호) 불러오기
		List seatNum=new ArrayList();		
		int rNo=0;
		for(int i=0;i<nofTicket;i++) {
			rNo++;
			seatNum.add(request.getParameter("seat_row"+rNo)+request.getParameter("seat_column"+rNo));					
		}
		String seatNo="";
		for(int i=0;i<nofTicket;i++) {
			seatNo+=seatNum.get(i)+", ";
			if(i+1==nofTicket) {
				seatNo=seatNo.substring(0,seatNo.lastIndexOf(","));
			}
		}
		System.out.println("좌석번호: "+seatNo);
		
		
		
		//seatRank(좌석등급) 불러오기
		List seatR=new ArrayList();
		for(int i=1;i<=nofTicket;i++) {
			seatR.add(request.getParameter("priceInfo"+i));
		}
		String seatRank="";
		for(int i=0;i<nofTicket;i++) {
			seatRank+=seatR.get(i)+", ";
			if(i+1==nofTicket) {
				seatRank=seatRank.substring(0,seatRank.lastIndexOf(","));
			}
		}
		System.out.println("좌석등급: "+seatRank);
		
		
		//seatPrice(좌석가격) 불러오기
		List price=new ArrayList();
		for(int i=0;i<nofTicket;i++) {						
			String ori=perf.getPerfPriceInfo().substring(perf.getPerfPriceInfo().indexOf((String)seatR.get(i)));						
			price.add(((ori.substring(0,ori.indexOf("원"))).substring((ori.substring(0,ori.indexOf("원"))).indexOf(" "))).trim());
		}
		String seatPrice="";
		for(int i=0;i<nofTicket;i++) {
			seatPrice+=price.get(i)+", ";
			if(i+1==nofTicket) {
				seatPrice=seatPrice.substring(0,seatPrice.lastIndexOf(","));
			}
		}
		int totalPrice=0;
		for(int i=0;i<nofTicket;i++) {
			totalPrice+=Integer.parseInt(((String)price.get(i)).replace(",", ""));
		}
		System.out.println("좌석가격: "+seatPrice);
		System.out.println("최종가격: "+totalPrice);
		
		
		
		//회차번호 뽑아오기
		String nthPerf="";
		for(PerfSsn ssn:list) {
			nthPerf=ssn.getNthPerf();
			if(ssn.getDateTime().equals((Object)dateChoice)) {
				return;
			}
		}
		
		//sql Date로 오늘날짜 만들기
		java.util.Date day=new java.util.Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date today=Date.valueOf(sdf.format(day));
		
		System.out.println("sql 오늘Date: "+today);
		
		//예약번호 생성
		StringBuffer temp=new StringBuffer();
		Random rnd=new Random();
		for(int i=0;i<8;i++) {
			int r=(int)(Math.random()*3);
			switch(r) {
			case 0: temp.append((char)((int)(rnd.nextInt(26))+97)); break;//소문자 랜덤
			case 1: temp.append((char)((int)(rnd.nextInt(26))+65)); break;//대문자 랜덤
			case 2: temp.append((int)(Math.random()*10)); break;//숫자 랜덤
			}
		}		
		String bookNo=new String(perfNo+temp);
		
		System.out.println(bookNo);
		
		//Booking 객체생성
		Booking book=new Booking(bookNo,memberNo,perfNo,nthPerf,nofTicket,totalPrice,today,"");
		//예약넣기
//		int result=new BookingService().insertBooking(bookNo,memberNo,perfNo,nthPerf,nofTicket,totalPrice,today);
//		Booking book=new Booking();
//		if(result>0) {
//			book=new BookingService().selectBooking(bookNo);		
//		}else {
//			String msg="";
//			String loc="/";
//			request.setAttribute("msg", "oops, something went wrong! please close this window and try again");
//			request.setAttribute("loc", loc);
//			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//		}
		
		//Seat 객체생성
		Seat seat=new Seat(bookNo,seatNo,seatRank,seatPrice);
		//seat객체 생성해서 DB에 저장하기
//		int result1=new SeatService().insertSeatDetail(bookNo,seatNo,seatRank,seatPrice);
//		Seat seat=new Seat();
//		if(result1>0) {
//			seat=new SeatService().selectSeating(bookNo);
		
		HttpSession session=request.getSession();		
		
			session.setAttribute("book", book);
			session.setAttribute("perf", perf);
			session.setAttribute("list", list);
			session.setAttribute("seat", seat);
			request.setAttribute("dateChoice", dateChoice);
			request.setAttribute("ssnChoice", ssnChoice);
			
			request.getRequestDispatcher("/views/book/promo.jsp").forward(request, response);
//		}else {
//			String msg="";
//			String loc="/";
//			request.setAttribute("msg", "oops, something went wrong! please close this window and try again");
//			request.setAttribute("loc", loc);
//			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//		}
		
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
