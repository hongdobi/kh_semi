package com.fs.booking.model.dao;

import static com.fs.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.fs.model.vo.Booking;
import com.fs.model.vo.Performance;

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
	
	//예약날짜 받아오기
	public Performance selectBookingDate(Connection conn,String perfNo,Date bookDate) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Performance perf=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectBookingDate"));
			pstmt.setString(1, perfNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				perf=new Performance();
				perf.setPerfNo(rs.getString("perf_No"));
				perf.setPerfName(rs.getString("perf_Name"));
				perf.setPerfStart(rs.getDate("perf_start"));
				perf.setPerfEnd(rs.getDate("perf_end"));
				perf.setPerfCapacity(rs.getInt("perf_capacity"));
				perf.setPerfTimeInfo(rs.getString("perf_timeinfo"));
				perf.setPerfPriceInfo(rs.getString("perf_priceinfo"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return perf;
	}
}
