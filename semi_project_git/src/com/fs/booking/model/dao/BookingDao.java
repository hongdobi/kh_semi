package com.fs.booking.model.dao;

import static com.fs.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.fs.model.vo.Booking;

public class BookingDao {

	private Properties prop=new Properties();
	
	public BookingDao() {
		try {
			String path=BookingDao.class.getResource("/sql/booking/booking_sql.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * public Booking selectBooking(Connection conn,String perfNo) {
	 * PreparedStatement pstmt=null; ResultSet rs=null; Booking bk=null;
	 * 
	 * try { pstmt=conn.prepareStatement("selectBooking"); pstmt.setString(1,
	 * perfNo); pstmt.setString(2, perfNo); rs=pstmt.executeQuery();
	 * while(rs.next()) { bk=new Booking(); bk.setBookNo(rs.getString("book_no"));
	 * bk.setMemberNo(rs.getInt("member_no"));
	 * bk.setPerfNo(rs.getString("perf_no"));
	 * bk.setNthPerf(rs.getString("nth_perf"));
	 * bk.setBookDate(rs.getDate("book_date"));
	 * 
	 * } }catch(SQLException e) { e.printStackTrace(); }finally { close(rs);
	 * close(pstmt); }return bk;
	 * 
	 * }
	 */
	@SuppressWarnings("null")
	public Booking findBooking(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Booking b = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("findBookingByMemNo"));
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("여기까지 괜찮");
				b.setBookNo(rs.getNString("book_no"));
				b.setMemberNo(rs.getInt("member_no"));
				b.setPerfNo(rs.getNString("perf_no"));
				b.setNthPerf(rs.getNString("nth_perf"));
				b.setBuyTicket(rs.getInt("buy_ticket"));
				b.setTotalPrice(rs.getInt("total_price"));
				b.setBookDate(rs.getDate("book_date"));
				b.setBookYn(rs.getNString("book_yn"));				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return b;
		
	}
}
