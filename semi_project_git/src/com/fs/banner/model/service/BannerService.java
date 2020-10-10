package com.fs.banner.model.service;

import static com.fs.common.JDBCTemplate.close;
import static com.fs.common.JDBCTemplate.commit;
import static com.fs.common.JDBCTemplate.getConnection;
import static com.fs.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.fs.banner.model.dao.BannerDao;
import com.fs.model.vo.Banner;
import com.fs.model.vo.Inquiry;

public class BannerService {

	private BannerDao dao=new BannerDao();
	//배너등록
	public int insertBanner(Banner b,String choice) {
		Connection conn=getConnection();
		int result=dao.insertBanner(conn,b,choice);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	//배너 목록 가져오기[관리자 등록용]
	public List<Banner> selectBannerList(String cate) {
		Connection conn = getConnection();
		List<Banner> list = dao.selectBannerList(conn, cate);
		close(conn);
		return list;
	}
	
	//배너 목록 가져오기[카테고리화면용]
	public List<Banner> selectBanner(String cate) {
		Connection conn = getConnection();
		List<Banner> list = dao.selectBanner(conn, cate);
		close(conn);
		return list;
	}
	//동영상목록[카테고리화면용]
	public List<Banner> selectVideo(String cate) {
		Connection conn = getConnection();
		List<Banner> list = dao.selectVideo(conn, cate);
		close(conn);
		return list;
	}
	//해당 공연 파일전체 삭제
	public int deleteBanner(String perfNo) {
		Connection conn=getConnection();
		int result=dao.deleteBanner(conn,perfNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	//이전 파일 이름 가져오기
	public String oldFileName(String perfNo, String choice) {
		Connection conn=getConnection();
		String name=dao.oldFileName(conn,perfNo,choice);
		close(conn);
		return name;
	}
}
