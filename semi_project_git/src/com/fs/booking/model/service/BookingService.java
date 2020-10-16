package com.fs.booking.model.service;

import static com.fs.common.JDBCTemplate.close;
import static com.fs.common.JDBCTemplate.commit;
import static com.fs.common.JDBCTemplate.getConnection;
import static com.fs.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.Date;
import java.util.List;

import com.fs.booking.model.dao.BookingDao;
import com.fs.model.vo.Booking;
import com.fs.model.vo.Member;
import com.fs.model.vo.Performance;;


public class BookingService {
	
	private BookingDao dao=new BookingDao();
	
	//perfNo에 맞는 performance객체 조회
	public Performance selectBookingDate(String perfNo, Date bookDate) {
		Connection conn=getConnection();
		Performance perf=dao.selectBookingDate(conn,perfNo,bookDate);
		close(conn);
		return perf;
	}
	

	
	//회원이 예약한 목록(오늘날짜이전에 관람한, 리뷰를 작성하지 않은)
	public List<Booking> selectBookingRV(String perfNo, int memberNo) {
		Connection conn=getConnection();
		System.out.println("서비스 회원번호:" +memberNo);
		List<Booking> bkList=dao.selectBookingRV(conn,perfNo,memberNo);
		System.out.println("service옴"+bkList);
									
		close(conn);
		return bkList;
	}
	
	

	public List<Booking> findBooking(int memberNo) {
		Connection conn = getConnection();
		List<Booking> list = dao.findBooking(conn, memberNo);
		close(conn);
		return list;
	}
	
	
	//예약넣기
	public int insertBooking(String bookNo,int memberNo,String perfNo,String nthPerf,int nofTicket,int totalPrice,Date today) {
		Connection conn=getConnection();
		int result=dao.insertBooking(conn,bookNo,memberNo,perfNo,nthPerf,nofTicket,totalPrice,today);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
	//에앾번호(bookNo)로 예약조회
	public Booking selectBooking(String bookNo) {
		Connection conn=getConnection();
		Booking book=dao.selectBooking(conn, bookNo);
		close(conn);
		return book;
	}
	
	
	//memberNo로 member조회하기(수령방법에서 필요)
	public Member selectMember(int memberNo) {
		Connection conn=getConnection();
		Member m=dao.selectMember(conn,memberNo);
		close(conn);
		return m;
	}
	
	
	

}
