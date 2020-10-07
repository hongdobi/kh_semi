package com.fs.admin.model.service;

import static com.fs.common.JDBCTemplate.close;
import static com.fs.common.JDBCTemplate.commit;
import static com.fs.common.JDBCTemplate.getConnection;
import static com.fs.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fs.admin.model.dao.AdminDao;
import com.fs.model.vo.FAQ;
import com.fs.model.vo.Inquiry;
import com.fs.model.vo.Performance;


public class AdminService {
	
	private AdminDao dao = new AdminDao();
	
	//FAQ 가져오기
	public List<FAQ> allFAQ(String keyword) {
		Connection conn = getConnection();
		List<FAQ> list = dao.allFAQ(conn,keyword);
		close(conn);
		System.out.println("service"+list);
		return list;
	}
	
	//사용자가 1:1문의 문의하기
	public int insertInquiry(Inquiry iq) {
		Connection conn = getConnection();
		int result = dao.insertInquiry(conn, iq);
		
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public List<Performance> searchPerf(String name, String cate) {
		Connection conn = getConnection();
		List<Performance> list = dao.searchPerf(conn,name,cate);
		System.out.println(list);
		close(conn);
		return list;
	}
	
	//1:1문의 가져오기
	public List<Inquiry> selectInquiry(int memberNo){
		Connection conn = getConnection();
		List<Inquiry> list = dao.selectInquiry(conn, memberNo);
		close(conn);
		return list;
	}
	
	//1:1문의 페이징처리
	public List<Inquiry> inquiryList(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Inquiry> list = dao.inquiryList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	//1:1문의 갯수
	public int inquiryCount() {
		Connection conn = getConnection();
		int count = dao.inquiryCount(conn);
		close(conn);
		return count;
	}

}
