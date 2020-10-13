package com.fs.perfSsn.model.service;

import static com.fs.common.JDBCTemplate.close;
import static com.fs.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.Date;
import java.util.List;

import com.fs.model.vo.PerfSsn;
import com.fs.model.vo.Performance;
import com.fs.perfSsn.model.dao.PerfSsnDao;

public class PerfSsnService {
	
	private PerfSsnDao dao=new PerfSsnDao();
	
	//랭킹페이지 (카테고리, 월별 공연)
	public List<Performance> rank(String month,String cate){
		Connection conn=getConnection();
		List<Performance> list=dao.rank(conn,month,cate);
		close(conn);
		return list;
	}

	
	//날짜별 회차 가져오기
	public List<PerfSsn> selectSsnTime(String perfNo, Date bookDate) {
		Connection conn=getConnection();
		List<PerfSsn> list=dao.selectSsnTime(conn,perfNo,bookDate);
		close(conn);
		return list;
	}
	

	public int ticketTotal(String month,String cate){
		Connection conn=getConnection();
		int result=dao.ticketTotal(conn,month,cate);
		close(conn);
		return result;
	}
	
	//해당 공연 회차정보 가져오기
	public List selectDateTime(String perfNo) {
		Connection conn=getConnection();
		List list=dao.selectDateTime(conn,perfNo);
		close(conn);
		return list;
	}

}
