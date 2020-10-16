package com.fs.seat.model.service;

import static com.fs.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.fs.model.vo.Seat;


public class SeatDao {
	
	private Properties prop = new Properties();
	
	public SeatDao() {
		try {
			String path = SeatDao.class.getResource("/sql/seat/seat_sql.properties").getPath();
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	//seat DB에 insert하기
	public int insertSeatDetail(Connection conn,String bookNo,String seatNo,String seatRank,String seatPrice) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertSeatDetail"));
			pstmt.setString(1, bookNo);
			pstmt.setString(2, seatNo);
			pstmt.setString(3, seatRank);
			pstmt.setString(4, seatPrice);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	//bookNo(예약번호)로 Seat 불러오기
	public Seat selectSeating(Connection conn,String bookNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Seat seat=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectSeating"));
			pstmt.setString(1, bookNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				seat=new Seat();
				seat.setBookNo(rs.getString("book_no"));
				seat.setSeatChoice(rs.getString("seat_choice"));
				seat.setSeatRank(rs.getString("seat_rank"));
				seat.setSeatPrice(rs.getString("seat_price"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return seat;
	}
	
	

}
