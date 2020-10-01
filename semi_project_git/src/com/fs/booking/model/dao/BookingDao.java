package com.fs.booking.model.dao;

import static com.fs.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.fs.model.vo.Booking;

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
	 public List<Booking> selectBooking(Connection conn,String perfNo, int memberNo) {
		 PreparedStatement pstmt=null; 
		 ResultSet rs=null; 
		 List<Booking> bkList = new ArrayList();
		 Booking bk=null;
		 try { 
			 pstmt=conn.prepareStatement(prop.getProperty("selectBooking")); 
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
				  bk.setBookDate(rs.getDate("book_date"));
				  bk.setBookYn(rs.getString("book_yn"));
				  bk.setPerfDate(rs.getDate("date_time"));
				  bkList.add(bk);
			  	} 
			  System.out.println("dao"+bk);
		}catch(SQLException e) { 
				  e.printStackTrace(); 
		}finally { 
			close(rs);
			close(pstmt); 
		}return bkList;
	  
	  }
	 
}
