package com.fs.booking.model.service;

import java.sql.Connection;
import java.util.List;
import static com.fs.common.JDBCTemplate.close;
import static com.fs.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import java.sql.Connection;
import java.sql.Date;

import com.fs.booking.model.dao.BookingDao;
import com.fs.model.vo.Booking;
import com.fs.model.vo.Performance;

import static com.fs.common.JDBCTemplate.close;
import static com.fs.common.JDBCTemplate.getConnection;


public class BookingService {
	
	private BookingDao dao=new BookingDao();
	
	//예약날짜 받아오기
	public Performance selectBookingDate(String perfNo, Date bookDate) {
		Connection conn=getConnection();
		Performance perf=dao.selectBookingDate(conn,perfNo,bookDate);
		close(conn);
		return perf;
	}
	

	
	//회원이 예약한 목록(오늘날짜이전에 관람한, 리뷰를 작성하지 않은)
	public List<Booking> selectBookingRV(String perfNo, int memberNo) {
		Connection conn=getConnection();
		System.out.println("서비스 회원번호:" +memberNo);
		List<Booking> bkList=dao.selectBookingRV(conn,perfNo,memberNo);
		System.out.println("service옴"+bkList);
									
		close(conn);
		return bkList;
	}
	
	

	public List<Booking> findBooking(int memberNo) {
		Connection conn = getConnection();
		List<Booking> list = dao.findBooking(conn, memberNo);
		close(conn);
		return list;
	}

}
