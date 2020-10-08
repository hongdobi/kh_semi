package com.fs.banner.model.service;

import static com.fs.common.JDBCTemplate.close;
import static com.fs.common.JDBCTemplate.commit;
import static com.fs.common.JDBCTemplate.getConnection;
import static com.fs.common.JDBCTemplate.rollback;

import com.fs.banner.model.dao.BannerDao;

public class BannerService {

	private BannerDao dao=new BannerDao();
}
