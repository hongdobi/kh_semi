package com.fs.perf.model.dao;

import static com.fs.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.fs.model.vo.Performance;


public class PerformanceDao {

private Properties prop = new Properties();
	
	public PerformanceDao() {

		try {
			String path = PerformanceDao.class.getResource("/sql/performance/performance_sql.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}

	//검색페이지 
	public ArrayList<Performance> searchPerformance(Connection conn,String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Performance> list = new ArrayList<Performance>();
		Performance perf = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("searchPerformance"));
			pstmt.setString(1, "%" + keyword + "%");
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				perf=new Performance();
	            perf.setPerfNo(rs.getString("perf_no"));
	            perf.setPerfName(rs.getString("perf_name"));
	            perf.setPerfRuntime(rs.getInt("perf_runtime"));
	            perf.setPerfStart(rs.getDate("perf_start"));
	            perf.setPerfEnd(rs.getDate("perf_end"));
	            perf.setPerfPg(rs.getInt("perf_pg"));
	            perf.setPerfLocation(rs.getString("perf_location"));
	            perf.setPerfAddress(rs.getString("perf_address"));
	            perf.setPerfCapacity(rs.getInt("perf_capacity"));
	            perf.setPerfPoster(rs.getString("perf_poster"));
	            perf.setPerfTimeInfo(rs.getString("perf_timeinfo"));
	            perf.setPerfPriceInfo(rs.getString("perf_priceInfo"));
				list.add(perf);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	//상세페이지
	public Performance selectPerformance(Connection conn,String perfNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Performance perf = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectPerformance"));
			pstmt.setString(1, perfNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				perf=new Performance();
				perf.setPerfNo(rs.getString("perf_no"));
				perf.setPerfName(rs.getString("perf_name"));
				perf.setPerfRuntime(rs.getInt("perf_runtime"));
				perf.setPerfStart(rs.getDate("perf_start"));
				perf.setPerfEnd(rs.getDate("perf_end"));
				perf.setPerfPg(rs.getInt("perf_pg"));
				perf.setPerfLocation(rs.getString("perf_location"));
				perf.setPerfAddress(rs.getString("perf_address"));
				perf.setPerfCapacity(rs.getInt("perf_capacity"));
				perf.setPerfPoster(rs.getString("perf_poster"));
				perf.setPerfTimeInfo(rs.getString("perf_timeinfo"));
				perf.setPerfPriceInfo(rs.getString("perf_priceInfo"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return perf;
	}

	public String findPerfName(Connection conn,String perfNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Performance perf = null;
		String perfName = "";
		try {
			pstmt = conn.prepareStatement(prop.getProperty("findPerfName"));
			pstmt.setString(1, perfNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				perfName += rs.getNString("perf_name");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			System.out.println("performanceDao" + perfName);
			close(rs);
			close(pstmt);
		}
		return perfName;
	}
	
	//랜덤하게 해당 카테고리 공연 6개 가져오기
	public List<Performance> randomPerf(Connection conn, String cate) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Performance> list = new ArrayList();
		Performance perf = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("randomPerf"));
			pstmt.setString(1, cate+"_");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				perf=new Performance();
	            perf.setPerfNo(rs.getString("perf_no"));
	            perf.setPerfName(rs.getString("perf_name"));
	            perf.setPerfStart(rs.getDate("perf_start"));
	            perf.setPerfEnd(rs.getDate("perf_end"));
	            perf.setPerfLocation(rs.getString("perf_location"));
	            perf.setPerfPoster(rs.getString("perf_poster"));
				list.add(perf);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	//티켓오픈 
	public List<Performance> ticketOpen(Connection conn, String cate) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Performance>list =new ArrayList();
		Performance perf=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("ticketOpen"));
			pstmt.setString(1, cate+"%");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				perf=new Performance();
	            perf.setPerfNo(rs.getString("perf_no"));
	            perf.setPerfName(rs.getString("perf_name"));
	            perf.setPerfStart(rs.getDate("perf_start"));
	            perf.setPerfLocation(rs.getString("perf_location"));
	            perf.setPerfPoster(rs.getString("perf_poster"));
	            perf.setdDay(rs.getInt("DDAY")*(-1));
				list.add(perf);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	//지역조회
	public List<String> searchLocation(Connection conn, String cate) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<String> list=new ArrayList();
		System.out.println(cate);
		try {
			pstmt=conn.prepareStatement(prop.getProperty("locationList"));
			pstmt.setString(1, cate+"%");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String str=rs.getString(1);
				list.add(str);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	//지역마다 공연 랜덤하게 하나
	public Map<String,Performance> locationPick(Connection conn, List<String> list,String cate) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Map<String,Performance> map=new HashMap<String, Performance>();
		Performance perf=null;
		try {
			for(int i=0;i<list.size();i++) {
				String loc=list.get(i);
				pstmt=conn.prepareStatement(prop.getProperty("locationPick"));
				pstmt.setString(1,loc+"%"); 
				pstmt.setString(2, cate+"%"); 
				rs=pstmt.executeQuery();
				if(rs.next()) { 
					perf=new Performance();
					perf.setPerfNo(rs.getString("perf_no"));
					perf.setPerfName(rs.getString("perf_name"));
					perf.setPerfStart(rs.getDate("perf_start"));
					perf.setPerfEnd(rs.getDate("perf_end"));
					perf.setPerfLocation(rs.getString("perf_location"));
					perf.setPerfAddress(rs.getString("perf_address"));
					perf.setPerfPoster(rs.getString("perf_poster"));
					
					map.put(loc, perf);
				}
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return map;
	}

	public Performance findPerfNo(Connection conn,String perfName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Performance perf = null;
		System.out.println(perfName);
		try {
			pstmt = conn.prepareStatement(prop.getProperty("findPerfNo"));
			pstmt.setString(1, perfName);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				perf=new Performance();
				perf.setPerfNo(rs.getString("perf_no"));
				perf.setPerfName(rs.getString("perf_name"));
				perf.setPerfRuntime(rs.getInt("perf_runtime"));
				perf.setPerfStart(rs.getDate("perf_start"));
				perf.setPerfEnd(rs.getDate("perf_end"));
				perf.setPerfPg(rs.getInt("perf_pg"));
				perf.setPerfLocation(rs.getString("perf_location"));
				perf.setPerfAddress(rs.getString("perf_address"));
				perf.setPerfCapacity(rs.getInt("perf_capacity"));
				perf.setPerfPoster(rs.getString("perf_poster"));
				perf.setPerfTimeInfo(rs.getString("perf_timeinfo"));
				perf.setPerfPriceInfo(rs.getString("perf_priceInfo"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return perf;
	}
	public void updatePoster(Connection conn, Performance p) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println(p.getPerfPoster());
		try {
			pstmt = conn.prepareStatement(prop.getProperty("updatePoster"));
			pstmt.setNString(1, p.getPerfPoster());
			pstmt.setNString(2, p.getPerfNo());
			pstmt.executeQuery();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
	}
	
	
}
