package com.fs.perfSsn.model.service;

import java.sql.Connection;
import java.util.List;

import com.fs.model.vo.PerfSsn;
import com.fs.perfSsn.model.dao.PerfSsnDao;
import static com.fs.common.JDBCTemplate.close;
import static com.fs.common.JDBCTemplate.getConnection;

public class PerfSsnService {
	
	private PerfSsnDao dao=new PerfSsnDao();
	
	//랭킹페이지 
	public List<PerfSsn> rank(String month,String cate){
		Connection conn=getConnection();
		List<PerfSsn> rkList=dao.rank(conn,month,cate);
		close(conn);
		return rkList;
	}
}
