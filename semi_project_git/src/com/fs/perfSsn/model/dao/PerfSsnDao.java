package com.fs.perfSsn.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Properties;
import static com.fs.common.JDBCTemplate.close;
import com.fs.model.vo.PerfSsn;

public class PerfSsnDao {
	
	private Properties prop=new Properties();
	
	public PerfSsnDao() {
		try {
			String path = PerfSsnDao.class.getResource("/sql/perfSsn/perfSsn_sql.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//랭킹 : 공연넘버별 한달 예매수 합계
	public List<PerfSsn> rank(Connection conn,String month,String cate){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<PerfSsn> rkList=new ArrayList();
		PerfSsn ssn=null; 
		try {
			pstmt =conn.prepareStatement("selectRank");
			pstmt.setString(1, month);
			pstmt.setString(2, month);
			if(cate!=null) {
				pstmt.setString(3, cate+"_");
			}else {
				pstmt.setString(3, "%");
			}
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ssn=new PerfSsn();
				ssn.setPerfNo(rs.getString("perf_No"));
				ssn.setNthCount(rs.getInt("nth_count"));
				rkList.add(ssn);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return rkList;
	}
	
}
