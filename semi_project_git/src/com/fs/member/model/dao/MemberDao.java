package com.fs.member.model.dao;

import static com.fs.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

import com.fs.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		try {
			String path=MemberDao.class.getResource("/sql/member/member_sql.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0; 
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertMember"));
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getEmail());
			pstmt.setDate(6, m.getBday());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public Member selectMember(Connection conn, String memberId, String memberPw) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectMember"));
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPw);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m = new Member();
				m.setMemberNo(rs.getInt("member_no"));
				m.setMemberId(rs.getString("member_id"));
				m.setMemberPw(rs.getString("member_pw"));
				m.setMemberName(rs.getString("member_name"));
				m.setPhone(rs.getString("phone"));
				m.setEmail(rs.getString("email"));
				m.setBday(rs.getDate("bday"));
				m.setManagerYn(rs.getString("manager_yn"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		System.out.println(m);
		return m;		
	}
	
	public Member memberInfo(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("memberInfo"));
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m = new Member();
				m.setMemberId(rs.getString("member_id"));
				m.setMemberPw(rs.getString("member_pw"));
				m.setMemberName(rs.getString("member_name"));
				m.setPhone(rs.getString("phone"));
				m.setEmail(rs.getString("email"));
				m.setBday(rs.getDate("bday"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		System.out.println(m);
		return m;	
	}
	public int updateMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateMember"));
			pstmt.setNString(1, m.getMemberPw());
			pstmt.setNString(2, m.getPhone());
			pstmt.setNString(3, m.getEmail());
			pstmt.setNString(4, m.getMemberId());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			System.out.println("회원정보 DAO");
		}return result;
	}
	
	public String emailDuplicate(Connection conn, String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = null;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("emailDuplicate"));
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
		
	}

	public String memberNo(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String memberNo = "";
		try {
			pstmt = conn.prepareStatement(prop.getProperty("memberNo"));
			pstmt.setNString(1, memberId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberNo = rs.getNString("member_no");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			System.out.println(memberNo);
		}return memberNo;
	}

	
	/*
	 * public Member totalSearch(Connection conn, String s) { PreparedStatement
	 * pstmt = null; ResultSet rs = null; Member m = null; try { m = new Member();
	 * pstmt = conn.prepareStatement(prop.getProperty("totalSearch"));
	 * pstmt.setNString(1, s); rs = pstmt.executeQuery(); }catch(SQLException e) {
	 * e.printStackTrace(); }finally { close(rs); close(pstmt); }return m; }
	 */
	public Boolean checkPw(Connection conn, String memberId, String memberPw) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Boolean b = false;
		String pw ="";
		try {
			pstmt = conn.prepareStatement(prop.getProperty("checkPw"));
			pstmt.setNString(1, memberId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pw += rs.getNString("member_pw");
			}
			if(pw.equals(memberPw)) {
				b = true;
			}else b = false;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return b;
	}
	
}
