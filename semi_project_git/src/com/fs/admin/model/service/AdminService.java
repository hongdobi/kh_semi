package com.fs.admin.model.service;

import static com.fs.common.JDBCTemplate.close;
import static com.fs.common.JDBCTemplate.commit;
import static com.fs.common.JDBCTemplate.getConnection;
import static com.fs.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.fs.admin.model.dao.AdminDao;
import com.fs.model.vo.FAQ;


public class AdminService {
	
	private AdminDao dao = new AdminDao();
	
	//FAQ
	public List<FAQ> allFAQ() {
		Connection conn = getConnection();
		List<FAQ> list = dao.allFAQ(conn);
		close(conn);
		System.out.println("service"+list);
		return list;
	}

}
