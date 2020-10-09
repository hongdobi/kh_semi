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
import com.fs.model.vo.Member;
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
	
	//사용자가 1대1문의 문의하기
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


	public List<Member> memList(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Member> memList = dao.memList(conn, cPage, numPerPage);
		close(conn);
		return memList;
	}
	
	public int memberCount() {
		Connection conn = getConnection();
		int count = dao.memberCount(conn);
		close(conn);
		return count;
	}
	public int searchCount(String type, String key) {
		Connection conn = getConnection();
		int count = dao.searchCount(conn, type, key);
		close(conn);
		return count;
	}
	public List<Member> searchMemberList(String type, String key, int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Member> list = dao.searchMemberList(conn, type, key, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public int authMG(String memberId) {
		Connection conn = getConnection();
		int result = dao.authMG(conn, memberId);
		if(result>0) {
			commit(conn);
			System.out.println("변경사항 저장" + result);
		}else rollback(conn);
		close(conn);
		return result;
	}
	public int delAuth(String memberId) {
		Connection conn = getConnection();
		int result = dao.delAuth(conn, memberId);
		if(result>0) {
			commit(conn);
			System.out.println("변경사항 저장" + result);
		}else rollback(conn);
		close(conn);
		return result;
	}
	
}
