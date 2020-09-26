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
	
	//랭킹 1-6순위  공연정보 가져오기
	public List<Performance> rankPerformance(List rkList){
		Connection conn = getConnection();
		List<Performance>list = dao.rankPerformance(conn,rkList);
		close(conn);
		return list;
	}
}
