package com.fs.perfSsn.model.service;

import static com.fs.common.JDBCTemplate.close;
import static com.fs.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.fs.model.vo.Performance;
import com.fs.perfSsn.model.dao.PerfSsnDao;

public class PerfSsnService {
	
	private PerfSsnDao dao=new PerfSsnDao();
	
	//랭킹페이지 
	public List<Performance> rank(String month,String cate){
		Connection conn=getConnection();
		List<Performance> list=dao.rank(conn,month,cate);
		close(conn);
		return list;
	}
}
