package com.fs.member.model.service;

import static com.fs.common.JDBCTemplate.close;
import static com.fs.common.JDBCTemplate.commit;
import static com.fs.common.JDBCTemplate.getConnection;
import static com.fs.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.fs.member.model.dao.MemberDao;
import com.fs.model.vo.Member;

public class MemberService {
	
	private MemberDao dao = new MemberDao();
	
	//회원등록 메소드
	public int insertMember(Member m) {
		Connection conn = getConnection();
		int result = dao.insertMember(conn, m);
		
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	//로그인 메소드
	public Member selectMember(String memberId, String memberPw) {
		Connection conn = getConnection();
		Member m = dao.selectMember(conn, memberId, memberPw);
		close(conn);
		return m;
	}
	
	//회원정보
	public Member memberInfo(String memberId) {
		Connection conn = getConnection();
		Member m = dao.memberInfo(conn, memberId);
		close(conn);
		return m;
	}
	
	//회원정보수정
	public int updateMember(Member m) {
		Connection conn=getConnection();
		int result=dao.updateMember(conn, m);
		if(result>0) {
			System.out.println("회원정보 수정 성공");
			commit(conn);
		}
		else {
			System.out.println("회원정보 수정 실패");
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	//이메일 중복확인
	public String emailDuplicate(String email) {
		Connection conn = getConnection();
		String result = dao.emailDuplicate(conn, email);
		close(conn);
		return result;
	}

	

}
