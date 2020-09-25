package com.fs.perfFile.model.service;

import static com.fs.common.JDBCTemplate.close;
import static com.fs.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.fs.model.vo.PerfFile;
import com.fs.perfFile.model.dao.PerfFileDao;

public class PerfFileService {
	private PerfFileDao dao=new PerfFileDao();
	
	public List<PerfFile> selectPerfFile(String perfNo) {
		Connection conn = getConnection();
		List<PerfFile> fList = dao.selectPerfFile(conn, perfNo);
		close(conn);
		return fList;
	}
}
