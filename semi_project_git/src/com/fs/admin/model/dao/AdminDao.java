package com.fs.admin.model.dao;

import static com.fs.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.fs.model.vo.FAQ;
import com.fs.model.vo.Inquiry;
import com.fs.model.vo.Performance;

public class AdminDao {
	
	private Properties prop = new Properties();
	
	public AdminDao() {
		try {
			String path = AdminDao.class.getResource("/sql/admin/admin_sql.properties").getPath();
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//FAQ 가져오기
	public List<FAQ> allFAQ(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<FAQ> list = new ArrayList();
		FAQ f = null;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("allFAQ"));
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				f = new FAQ();
				f.setFaqTitle(rs.getString("faq_title"));
				f.setFaqContent(rs.getString("faq_content"));
				f.setFaqHashTag(rs.getString("faq_hashtag"));
				list.add(f);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	//사용자가 1대1문의 문의하기
	public int insertInquiry(Connection conn, Inquiry iq) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertInquiry"));
			pstmt.setInt(1, iq.getMemberNo());
			pstmt.setString(2, iq.getInqCategory());
			pstmt.setString(3, iq.getInqTitle());
			pstmt.setString(4, iq.getInqContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	public List<Performance> searchPerf(Connection conn, String name, String cate) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Performance> list = new ArrayList<Performance>();
		Performance perf = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("searchPerf"));
			pstmt.setString(1, "%" + name + "%");
			System.out.println(cate);
			if(cate==null||cate.equals("All")) {
				pstmt.setString(2, "%");
			}else {
				pstmt.setString(2, cate+"_%");
			}
			rs = pstmt.executeQuery();
			System.out.println(rs);
			while(rs.next()) {
				perf=new Performance();
	            perf.setPerfNo(rs.getString("perf_no"));
	            perf.setPerfName(rs.getString("perf_name"));
	            perf.setPerfStart(rs.getDate("perf_start"));
	            perf.setPerfEnd(rs.getDate("perf_end"));
	            perf.setPerfLocation(rs.getString("perf_location"));
	            perf.setPerfPoster(rs.getString("perf_poster"));
	            System.out.println(perf);
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


}
