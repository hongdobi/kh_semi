package com.fs.perf.model.service;

import static com.fs.common.JDBCTemplate.close;
import static com.fs.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.fs.model.vo.Performance;
import com.fs.perf.model.dao.PerformanceDao;


public class PerfService {
	private PerformanceDao dao=new PerformanceDao();
	
	public ArrayList<Performance> searchPerformance(String keyword) {
		Connection conn = getConnection();
		ArrayList<Performance> list = new PerformanceDao().searchPerformance(conn, keyword);
		close(conn);
		return list;
	}
	public Performance selectPerformance(String perfNo) {
		Connection conn = getConnection();
		Performance perf = dao.selectPerformance(conn, perfNo);
		close(conn);
		return perf;
	}
	

}
