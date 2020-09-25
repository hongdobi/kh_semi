package com.fs.perfFile.model.dao;

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

import com.fs.model.vo.PerfFile;

public class PerfFileDao {

private Properties prop = new Properties();

	public PerfFileDao() {
		try {
			String path = PerfFileDao.class.getResource("/sql/perfFile/perfFile_sql.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	public List<PerfFile> selectPerfFile(Connection conn, String perfNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<PerfFile> fList = new ArrayList<PerfFile>();
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectPerfFile"));
			pstmt.setString(1, perfNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				PerfFile pf=new PerfFile();
				
				pf.setPerfFileName(rs.getString("PERF_FILENAME"));
				
				fList.add(pf);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return fList;
	}
}
