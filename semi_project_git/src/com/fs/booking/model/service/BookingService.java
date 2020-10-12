package com.fs.booking.model.service;

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
	
}
