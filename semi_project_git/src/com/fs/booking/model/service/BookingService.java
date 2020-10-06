package com.fs.booking.model.service;

import java.sql.Connection;
import java.util.List;

import static com.fs.common.JDBCTemplate.close;
import static com.fs.common.JDBCTemplate.commit;
import static com.fs.common.JDBCTemplate.getConnection;
import static com.fs.common.JDBCTemplate.rollback;
import com.fs.booking.model.dao.BookingDao;
import com.fs.model.vo.Booking;


public class BookingService {
	private BookingDao dao=new BookingDao();

	
	//회원이 예약한 목록(오늘날짜이전에 관람한, 리뷰를 작성하지 않은)
	public List<Booking> selectBookingRV(String perfNo, int memberNo) {
		Connection conn=getConnection();
		List<Booking> bkList=dao.selectBookingRV(conn,perfNo,memberNo);
		System.out.println("service옴"+bkList);
									
		close(conn);
		return bkList;
	}
	
	

	public Booking findBooking(int memberNo) {
		Connection conn = getConnection();
		Booking b = dao.findBooking(conn, memberNo);
		close(conn);
		return b;
	}
}
