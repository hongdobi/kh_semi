package com.fs.perfSsn.model.dao;

import static com.fs.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.fs.model.vo.PerfSsn;
import com.fs.model.vo.Performance;

public class PerfSsnDao {
	
	private Properties prop=new Properties();
	
	public PerfSsnDao() {
		try {
			String path = PerfSsnDao.class.getResource("/sql/perfSsn/perfSsn_sql.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//랭킹 
	public List<Performance> rank(Connection conn,String month,String cate){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Performance> list=new ArrayList();
		Performance perf=null; 
		try {
			pstmt =conn.prepareStatement(prop.getProperty("selectRank"));
			pstmt.setString(1, month);
			pstmt.setString(2, month);
			if(cate==null||cate.equals("ALL")) {
				pstmt.setString(3, "%");
			}else {
				pstmt.setString(3, cate+"_%");
			}
			rs=pstmt.executeQuery();
			while(rs.next()) {
				perf=new Performance();
				perf.setPerfNo(rs.getString("perf_no"));
				perf.setPerfName(rs.getString("perf_name"));
				perf.setPerfStart(rs.getDate("perf_start"));
				perf.setPerfEnd(rs.getDate("perf_end"));
				perf.setPerfLocation(rs.getString("perf_location"));
				perf.setPerfPoster(rs.getString("perf_poster"));
				perf.setPerfCount(rs.getInt("cnt"));
				list.add(perf);

			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public List<Performance> selectThirdRank(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Performance> list=new ArrayList();
		Performance perf=null; 
		try {
			pstmt =conn.prepareStatement(prop.getProperty("selectThird"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				perf=new Performance();
				perf.setPerfNo(rs.getString("perf_no"));
				perf.setPerfName(rs.getString("perf_name"));
				perf.setPerfStart(rs.getDate("perf_start"));
				perf.setPerfEnd(rs.getDate("perf_end"));
				perf.setPerfLocation(rs.getString("perf_location"));
				perf.setPerfPoster(rs.getString("perf_poster"));
				perf.setPerfCount(rs.getInt("cnt"));
				list.add(perf);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	//랭킹페이지용 해당 카테고리, 월별 테켓 총합
	public int ticketTotal(Connection conn,String month,String cate){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt =conn.prepareStatement(prop.getProperty("ticketTotal"));
			pstmt.setString(1, month);
			pstmt.setString(2, month);
			if(cate==null||cate.equals("ALL")) {
				pstmt.setString(3, "%");
			}else {
				pstmt.setString(3, cate+"_%");
			}
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result=rs.getInt("total");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	
	//해당공연이 열리는 공연일 리스트 가져오기(중복값없이)
	public List selectDateTime(Connection conn, String perfNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List list=new ArrayList();
		try {
			pstmt =conn.prepareStatement(prop.getProperty("selectDateTime"));
			pstmt.setString(1, perfNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String date=rs.getString(1);
				
				list.add(date);
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	
	//날짜별 회차 가져오기
	public List<PerfSsn> selectSsnTime(Connection conn,String perfNo,Date bookDate) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		PerfSsn ssn=null;
		List<PerfSsn> list=new ArrayList<PerfSsn>();
		SimpleDateFormat sdf=new SimpleDateFormat("yy년 MM월 dd일 HH:mm:ss");
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectSsnTime"));
			pstmt.setString(1, perfNo);
			pstmt.setString(2, bookDate+"%");
//			System.out.println((bookDate+"%").substring(2));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ssn=new PerfSsn();
				ssn.setNthPerf(rs.getString("nth_perf"));
				ssn.setPerfNo(rs.getString("perf_no"));
				String day=rs.getString("P");//시간까지 받아서 나오게 어떻게 만들지?
				java.util.Date d = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(day);
				java.sql.Date perfDate = new java.sql.Date(d.getTime());
				ssn.setDateTime(perfDate);
//				System.out.println(rs.getDate("P"));
				list.add(ssn);
			}			
		}catch(SQLException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	
	
	
	
}
