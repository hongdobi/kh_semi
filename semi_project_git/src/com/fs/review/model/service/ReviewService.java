package com.fs.review.model.service;

import static com.fs.common.JDBCTemplate.close;
import static com.fs.common.JDBCTemplate.commit;
import static com.fs.common.JDBCTemplate.getConnection;
import static com.fs.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.fs.model.vo.Review;
import com.fs.review.model.dao.ReviewDao;
public class ReviewService {
	
	private ReviewDao dao=new ReviewDao();
	
	public List<Review> selectReview(int cPage, int numPerPage,String perfNo){
		Connection conn=getConnection();
		List<Review>rvList=dao.selectReview(conn,cPage,numPerPage,perfNo);
		close(conn);
		return rvList;
		
	}
	
	public int selectReviewCount(String perfNo) {
		Connection conn=getConnection();
		int count=dao.selectReviewCount(conn,perfNo);
		close(conn);
		return count;
	}
	
	public int insertReview(Review rv) {
		Connection conn=getConnection();
		int result=dao.insertReview(conn,rv);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}

	public int deleteReview(String bookNo) {
		Connection conn=getConnection();
		int result=dao.deleteReview(conn,bookNo);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
}
