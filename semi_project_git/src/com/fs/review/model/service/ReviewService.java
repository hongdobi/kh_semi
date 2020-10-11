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

	public List<Review> myReview(int memberNo){
		Connection conn=getConnection();
		List<Review>rvList=dao.myReview(conn,memberNo);
		close(conn);
		return rvList;
	}
		

	//리뷰삭제
	public int deleteReview(String bookNo) {
		Connection conn=getConnection();
		int result=dao.deleteReview(conn,bookNo);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
	//update하기 위해 해당 예약번호로 적힌 리뷰가져오기
	public Review selectReviewOne(String bookNo) {
		Connection conn=getConnection();
		Review rv=dao.selectReviewOne(conn,bookNo);
		close(conn);
		return rv;
	}
	//리뷰 업데이트(수정하기)
	public int updateReview(Review rv, String bookNo) {
		Connection conn=getConnection();
		int result=dao.updateReview(conn,rv,bookNo);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
}
