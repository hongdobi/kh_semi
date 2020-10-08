package com.fs.banner.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;
import static com.fs.common.JDBCTemplate.close;


public class BannerDao {
	private Properties prop = new Properties();
	
	public BannerDao() {
		try {
			String path = BannerDao.class.getResource("/sql/banner/banner_sql.properties").getPath();
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
