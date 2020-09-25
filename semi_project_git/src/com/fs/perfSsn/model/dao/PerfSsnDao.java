package com.fs.perfSsn.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import static com.fs.common.JDBCTemplate.close;

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
	
	
	
}
