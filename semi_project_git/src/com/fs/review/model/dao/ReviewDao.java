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
	
	
	//페이징처리해서 해당공연 리뷰 전체 불러오기
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
				rv.setPerfDate(rs.getDate("DATE_TIME"));
				rv.setBookNo(rs.getString("BOOK_NO"));
				
				
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

	//페이징처리를 위한 해당 공연 리뷰 개수 가져오기
	public int selectReviewCount(Connection conn,String perfNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectReviewCount"));
			pstmt.setString(1, perfNo);
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
	//리뷰등록하기
	public int insertReview(Connection conn, Review rv) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertReview"));
			pstmt.setInt(1, rv.getMemberNo());
			pstmt.setString(2, rv.getPerfNo());
			pstmt.setString(3, rv.getRevContent());
			pstmt.setInt(4, rv.getRevScore());
			pstmt.setString(5,rv.getBookNo());
			
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		return result;
	}

	//리뷰삭제하기
	public int deleteReview(Connection conn, String bookNo) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("deleteReview"));
			pstmt.setString(1, bookNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		return result;
	}
}
