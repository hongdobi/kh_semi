package com.fs.perf.model.service;

import static com.fs.common.JDBCTemplate.close;
import static com.fs.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.fs.model.vo.Banner;
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
	
	public String findPerfName(String perfNo) {
		Connection conn = getConnection();
		String perfName = dao.findPerfName(conn, perfNo);
		close(conn);
		return perfName;
	}
	//오성티켓 pick에쓸 공연 6개 랜덤하게 받아오기
	public List<Performance> randomPerf(String cate) {
		Connection conn = getConnection();
		List<Performance> list = dao.randomPerf(conn, cate);
		close(conn);
		return list;
	}
	//티켓오픈
	public List<Performance> ticketOpen(String cate) {
		Connection conn=getConnection();
		List<Performance> list=dao.ticketOpen(conn,cate);
		close(conn);
		return list;
	}
	//지역조회
	public List searchLocation(String cate) {
		Connection conn= getConnection();
		List <String> list=dao.searchLocation(conn,cate);
		close(conn);
		return list;
	}
	public Map<String,Performance> locationPick(List<String> list,String cate) {
		Connection conn= getConnection();
		Map<String,Performance> map=dao.locationPick(conn,list,cate);
		close(conn);
		return map;
	}
	public Performance findPerfNo(String perfName) {
		Connection conn = getConnection();
		Performance perf = dao.findPerfNo(conn, perfName);
		close(conn);
		return perf;
	}
	public void updatePoster(Performance p) {
		Connection conn = getConnection();
		dao.updatePoster(conn, p);
		close(conn);
	}
	
	public List<Performance> mainPoster(String cate){
		Connection conn=getConnection();
		List<Performance> list=dao.mainPoster(conn,cate);
		close(conn);
		return list;
	}

}
