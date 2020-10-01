package com.fs.booking.model.service;

import java.sql.Connection;
import java.util.List;

import com.fs.booking.model.dao.BookingDao;
import com.fs.model.vo.Booking;
import static com.fs.common.JDBCTemplate.getConnection;
import static com.fs.common.JDBCTemplate.close;

public class BookingService {
	private BookingDao dao=new BookingDao();
						
	public List<Booking> selectBooking(String perfNo, int memberNo) {
		Connection conn=getConnection();
		List<Booking> bkList=dao.selectBooking(conn,perfNo,memberNo);
		System.out.println("service옴"+bkList);
									
		close(conn);
		return bkList;
	}
	
	
}
