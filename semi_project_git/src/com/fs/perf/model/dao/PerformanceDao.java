package com.fs.perf.model.dao;

import static com.fs.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

	
	public Performance searchPerformance(Connection conn,String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Performance p = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("searchPerformance"));
			pstmt.setString(1, keyword);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				p.setPerfName(rs.getString("perf_name"));
				p.setPerfLocation(rs.getString("perf_location"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return p;
	}
	
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
			System.out.println(perf.getPerfName());
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return perf;
	}



	
}
