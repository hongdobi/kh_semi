package com.fs.booking.model.service;

import static com.fs.common.JDBCTemplate.close;
import static com.fs.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.fs.booking.model.dao.BookingDao;
import com.fs.model.vo.Booking;

public class BookingService {
	private BookingDao dao=new BookingDao();
	public List<Booking> findBooking(int memberNo) {
		Connection conn = getConnection();
		List<Booking> list = dao.findBooking(conn, memberNo);
		close(conn);
		return list;
	}
}
