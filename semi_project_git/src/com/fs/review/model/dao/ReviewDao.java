package com.fs.review.model.dao;

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

import com.fs.model.vo.Performance;
import com.fs.model.vo.Review;

public class ReviewDao {

	
	private Properties prop=new Properties();
	
	public ReviewDao() {
		try {
			String path=ReviewDao.class.getResource("/sql/review/review_sql.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public List<Review> selectReview(Connection conn, int cPage, int numPerPage,String perfNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Review> rvList=new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectReviewAll"));
			
			pstmt.setNString(1, perfNo);
			pstmt.setInt(2, (cPage-1)*numPerPage+1); 
			pstmt.setInt(3, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Review rv=new Review();
				
				rv.setMemberNo(rs.getInt("MEMBER_NO"));
				rv.setPerfNo(rs.getString("PERF_NO"));
				rv.setRevContent(rs.getString("REV_CONTENT"));
				rv.setRevScore(rs.getInt("REV_SCORE"));
				rv.setRevDate(rs.getDate("REV_DATE"));
				rv.setMemberId(rs.getString("MEMBER_ID"));
				
				
				rvList.add(rv);
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return rvList;
	}


	public int selectReviewCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectReviewCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public int insertReview(Connection conn, Review rv) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertReview"));
			pstmt.setInt(1, rv.getMemberNo());
			pstmt.setString(2, rv.getPerfNo());
			pstmt.setString(3, rv.getRevContent());
			pstmt.setInt(4, rv.getRevScore());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		return result;
	}
}
