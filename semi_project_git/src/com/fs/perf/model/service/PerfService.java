package com.fs.perf.model.service;

import static com.fs.common.JDBCTemplate.close;
import static com.fs.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.fs.model.vo.Performance;
import com.fs.perf.model.dao.PerformanceDao;


public class PerfService {
	private PerformanceDao dao=new PerformanceDao();
	
	public Performance searchPerformance(String keyword) {
		Connection conn = getConnection();
		Performance p = dao.searchPerformance(conn, keyword);
		close(conn);
		return p;
		
	}
	public Performance selectPerformance(String perfNo) {
		Connection conn = getConnection();
		Performance perf = dao.selectPerformance(conn, perfNo);
		close(conn);
		return perf;
	}

	
}
