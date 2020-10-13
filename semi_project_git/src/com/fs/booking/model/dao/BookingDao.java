package com.fs.booking.model.dao;

import static com.fs.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.fs.model.vo.Booking;
import com.fs.model.vo.Performance;

public class BookingDao {

	private Properties prop = new Properties();

	public BookingDao() {
		try {
			String path = BookingDao.class.getResource("/sql/booking/booking_sql.properties").getPath();
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//회원이 해당 공연을 예약상태인 리스트 불러오기, 관람일자가 오늘 이전인 것만(관람한것만)
	 public List<Booking> selectBookingRV(Connection conn,String perfNo, int memberNo) {
		 PreparedStatement pstmt=null; 
		 ResultSet rs=null; 
		 List<Booking> bkList = new ArrayList();
		 Booking bk=null;
		 
		 try { 
			 pstmt=conn.prepareStatement(prop.getProperty("selectBookingRV")); 
			 pstmt.setString(1, perfNo); 
			 pstmt.setInt(2, memberNo); 
			 rs=pstmt.executeQuery();
			  while(rs.next()) { 
				  bk=new Booking(); 
				  bk.setBookNo(rs.getString("book_no"));
				  bk.setMemberNo(rs.getInt("member_no"));
				  bk.setPerfNo(rs.getString("perf_no"));
				  bk.setNthPerf(rs.getString("nth_perf"));
				  bk.setBuyTicket(rs.getInt("buy_ticket"));
				  bk.setTotalPrice(rs.getInt("total_price"));
				  
				  String day1=rs.getString("bDate");
				  
				  java.util.Date d1 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(day1);
				  java.sql.Date bookDate = new java.sql.Date(d1.getTime());
				  bk.setBookDate(bookDate);
				  
				  bk.setBookYn(rs.getString("book_yn"));
				  
				  String day2=rs.getString("pDate");
				  java.util.Date d2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(day2);
				  java.sql.Date perfDate = new java.sql.Date(d2.getTime());
				  bk.setPerfDate(perfDate);
				  
				  bkList.add(bk);
			  	} 
		}catch(SQLException e) { 
				  e.printStackTrace(); 
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally { 
			close(rs);
			close(pstmt); 
		}return bkList;
	  
	  }
	 

	@SuppressWarnings("null")
	public List<Booking> findBooking(Connection conn, int memberNo) {
		System.out.println("다오 회원번호:"+memberNo);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Booking> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("findBooking"));
			pstmt.setInt(1, memberNo);
			System.out.println(pstmt);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Booking b = new Booking();
				b.setBookNo(rs.getNString("book_no"));
				b.setMemberNo(rs.getInt("member_no"));
				b.setPerfNo(rs.getNString("perf_no"));
				b.setNthPerf(rs.getNString("nth_perf"));
				b.setBuyTicket(rs.getInt("buy_ticket"));
				b.setTotalPrice(rs.getInt("total_price"));
				b.setBookDate(rs.getDate("book_date"));
				b.setBookYn(rs.getNString("book_yn"));
				list.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
		
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
