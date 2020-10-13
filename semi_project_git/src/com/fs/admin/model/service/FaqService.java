package com.fs.admin.model.service;

import java.sql.Connection;
import java.util.List;

import com.fs.admin.model.dao.FaqDao;
import com.fs.model.vo.FAQ;


import static com.fs.common.JDBCTemplate.getConnection;
import static com.fs.common.JDBCTemplate.commit;
import static com.fs.common.JDBCTemplate.rollback;
import static com.fs.common.JDBCTemplate.close;


public class FaqService {
	private FaqDao dao = new FaqDao();
	
	public List <FAQ> selectFaqList(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<FAQ> list = dao.selectFaqList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public int selectFaqCount(){
		Connection conn = getConnection();
	    int count = dao.selectFaqCount(conn);
	    close(conn);
	    return count;
	}
	
	public FAQ selectFaqOne(int no) {
		Connection conn=getConnection();
		FAQ f = dao.selectFaqOne(conn,no);
		close(conn);
		return f;
	}
	
	
   public int insertFaq(FAQ f) {
	   Connection conn=getConnection();
	   int result=dao.insertFaq(conn,f);
	   if(result>0) commit(conn);
	   else rollback(conn);
	   close(conn);
	   return result;
	   
	   
   }

  public List <FAQ> searchFaqList(String key){
	  Connection conn=getConnection();
	  List<FAQ> list = dao.searchFaqList(conn,key);
	  close(conn);
	  return list;
	  
  }
	
  public int deleteFaq(int no) {
		Connection conn=getConnection();
		int result = dao.deleteFaq(conn,no);
		 if(result>0) commit(conn);
		   else rollback(conn);
		   close(conn);
		   return result;
	}

  
public int updateFaq(FAQ f, int no) {
	 Connection conn=getConnection();
	   int result=dao.updateFaq(conn,f,no);
	   if(result>0) commit(conn);
	   else rollback(conn);
	   close(conn);
	   return result;
}


  }

 