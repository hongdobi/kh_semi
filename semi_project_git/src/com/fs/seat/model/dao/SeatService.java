package com.fs.seat.model.dao;

import static com.fs.common.JDBCTemplate.getConnection;
import static com.fs.common.JDBCTemplate.close;
import static com.fs.common.JDBCTemplate.commit;
import static com.fs.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.fs.model.vo.Seat;
import com.fs.seat.model.service.SeatDao;

public class SeatService {
	
	private SeatDao dao=new SeatDao();
	
	//seat DB에 insert하기
	public int insertSeatDetail(String bookNo,String seatNo,String seatRank,String seatPrice) {
		Connection conn=getConnection();
		int result=dao.insertSeatDetail(conn,bookNo,seatNo,seatRank,seatPrice);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
	//bookNo(예약번호)로 Seat 불러오기
	public Seat selectSeating(String bookNo) {
		Connection conn=getConnection();
		Seat seat=dao.selectSeating(conn,bookNo);
		close(conn);
		return seat;
	}

}
