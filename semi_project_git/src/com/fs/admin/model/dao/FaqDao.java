package com.fs.admin.model.dao;

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


import static com.fs.common.JDBCTemplate.close;


public class FaqDao {
	
	private Properties prop = new Properties();
	
	public FaqDao() {
		try {
			String path = FaqDao.class.getResource("/sql/admin/admin_sql.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	 public List <FAQ> selectFaqList(Connection conn, int cPage, int numPerPage){
		 PreparedStatement pstmt =null;
		 ResultSet rs = null;
		 List<FAQ> list = new ArrayList();
		 try {
			 pstmt = conn.prepareStatement(prop.getProperty("selectFaqList"));
			 pstmt.setInt(1, (cPage-1)*numPerPage+1); //시작값
			 pstmt.setInt(2, cPage*numPerPage);  
			 rs=pstmt.executeQuery();
			 
			 while(rs.next()) {
					FAQ f = new FAQ();
					f.setFaqNo(rs.getInt("faq_no"));
					f.setFaqTitle(rs.getString("faq_title"));
					f.setFaqContent(rs.getString("faq_content"));
					f.setFaqHashTag(rs.getString("faq_hashtag")); //테이블의 컬럼명
					list.add(f);
			 }
		 }catch(SQLException e){
			 e.printStackTrace();
		 }finally {
			 close(rs);
			 close(pstmt);
		 }return list;
	 }
	 
	 
	 
	 public int selectFaqCount(Connection conn) {
		 PreparedStatement pstmt = null;
		 ResultSet rs=null;
		 int result =0;
		 try {
		 pstmt=conn.prepareStatement(prop.getProperty("selectFaqCount"));
         rs=pstmt.executeQuery();
		 if(rs.next()) {
			 result=rs.getInt(1);
	      }
        }catch(SQLException e) {
	     e.printStackTrace();
        }finally {
        	close(rs);
        	close(pstmt);
        }return result;
	 }
 
	 
	 public FAQ selectFaqOne(Connection conn, int no) {
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 FAQ f = null;
		 try {
			 pstmt = conn.prepareStatement(prop.getProperty("selectFaqOne"));
			 pstmt.setInt(1, no);
			 rs=pstmt.executeQuery();
			 if(rs.next()) {
				    f = new FAQ();
					f.setFaqNo(rs.getInt("faq_no"));
					f.setFaqTitle(rs.getString("faq_title"));
					f.setFaqContent(rs.getString("faq_content"));
					f.setFaqHashTag(rs.getString("faq_hashtag"));
			 }
		   }catch(SQLException e) {
			   e.printStackTrace();
		   }finally {
			   close(rs);
			   close(pstmt);
		   }return f;
	 }
	 
	 public int insertFaq(Connection conn, FAQ f) {
			PreparedStatement pstmt=null;
			int result=0;
			try {
				pstmt=conn.prepareStatement(prop.getProperty("insertFaq"));
				pstmt.setNString(1, f.getFaqTitle());
				pstmt.setNString(2, f.getFaqContent());
				pstmt.setNString(3, f.getFaqHashTag());
				result=pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}return result;
			
		}
	 
	 public List<FAQ> searchFaqList(Connection conn,String key){
			PreparedStatement pstmt=null;
			ResultSet rs =null;
			List<FAQ> list = new ArrayList();
			try {
				pstmt=conn.prepareStatement(prop.getProperty("searchFaqList"));
				pstmt.setNString(1, key);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					    FAQ f = new FAQ();
						f.setFaqNo(rs.getInt("faq_no"));
						f.setFaqTitle(rs.getString("faq_title"));
						f.setFaqContent(rs.getString("faq_content"));
						f.setFaqHashTag(rs.getString("faq_hashtag"));
						list.add(f);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return list;
			
	 }

	 public int deleteFaq(Connection conn, int no) {
		 PreparedStatement pstmt = null;
		 int result=0;
		 try {
			 pstmt = conn.prepareStatement(prop.getProperty("deleteFaq"));
			 pstmt.setInt(1, no);
			 result =pstmt.executeUpdate();
			
		   }catch(SQLException e) {
			   e.printStackTrace();
		   }finally {
			   close(pstmt);
		   }return result;
	 }
	 
	 public int updateFaq(Connection conn, FAQ f, int no) {
			PreparedStatement pstmt=null;
			int result=0;
			try {
				pstmt=conn.prepareStatement(prop.getProperty("updateFaq"));
				pstmt.setInt(1, no);
				pstmt.setNString(1, f.getFaqTitle());
				pstmt.setNString(2, f.getFaqContent());
				pstmt.setNString(3, f.getFaqHashTag());
				result=pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}return result;
			
		}
	 

	 
	 }
		
		   
		   
	 
	 
	

	

