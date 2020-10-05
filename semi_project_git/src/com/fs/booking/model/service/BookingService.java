package com.fs.booking.model.service;

import java.sql.Connection;
import static com.fs.common.JDBCTemplate.close;
import static com.fs.common.JDBCTemplate.commit;
import static com.fs.common.JDBCTemplate.getConnection;
import static com.fs.common.JDBCTemplate.rollback;
import com.fs.booking.model.dao.BookingDao;
import com.fs.model.vo.Booking;

public class BookingService {
	private BookingDao dao=new BookingDao();
	public Booking findBooking(int memberNo) {
		Connection conn = getConnection();
		Booking b = dao.findBooking(conn, memberNo);
		close(conn);
		return b;
	}
}
