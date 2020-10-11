package com.fs.banner.model.dao;

import static com.fs.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.fs.model.vo.Banner;


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
	//배너등록
	public int insertBanner(Connection conn, Banner b,String choice) {
		PreparedStatement pstmt=null;
		int result=0;
		String link=b.getSrc();
		String banner1=b.getBanner1();
		String banner2=b.getBanner2();
		String perfNo=b.getPerfNo();
		String type="";
		try {
			if(choice.equals("메인")) {
				type="Banner1";
			}else if(choice.equals("공연")){
				type="Banner2";
			}else if(choice.equals("동영상")) {
				type="src";
			}
			String sql=prop.getProperty("insertBanner").replaceAll("@type", type);
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, perfNo);

			if(choice.equals("메인")) {
				pstmt.setString(2, banner1);
			}else if(choice.equals("공연")){
				pstmt.setString(2, banner2);
			}else if(choice.equals("동영상")) {
				pstmt.setString(2, link);
			}

			pstmt.setString(3, perfNo);
			if(banner1!=null) {
				System.out.println("2-1");
				pstmt.setString(4, banner1);
			}else {
				System.out.println("2-2");
				pstmt.setNull(4, Types.VARCHAR, banner1);
			}
			
			if(banner2!=null) {
				System.out.println("3-1");
				pstmt.setString(5, banner2);
			}else {
				System.out.println("3-2");
				pstmt.setNull(5, Types.VARCHAR, banner2);
			}
			
			if(link!=null&&link!=""&&!link.equals("null")) {
				System.out.println("4-1");
				pstmt.setString(6, link);
			}else {
				System.out.println("4-2");
				pstmt.setNull(6, Types.VARCHAR, link);
			}
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("dao등록완료"+result);
		return result;
	}
	
	//각 카테고리에 맞는 공연배너 리스트 가져오기[관리자용]
	public List<Banner> selectBannerList(Connection conn, String cate) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Banner> list=new ArrayList();
		Banner b=null;
		String type="";
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectBannerList"));
			if(!cate.equals("All")) {
				//카테고리가 메인이 아닌 경우 해당 카테고리에 속하는 것만 가져오기
				pstmt.setString(1, cate + "%");
			}else {
				pstmt.setString(1, "%");
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				b=new Banner();
				b.setPerfNo(rs.getString("perf_No"));
				b.setPerfName(rs.getString("perf_name"));
				b.setBanner1(rs.getString("banner1"));
				b.setBanner2(rs.getString("banner2"));
				b.setSrc(rs.getString("SRC"));
				list.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		System.out.println(list);
		return list;
	}
	
	
	//각 카테고리에 맞는 공연배너 리스트,공연정 가져오기[카테고리화면용]
	public List<Banner> selectBanner(Connection conn, String cate) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Banner> list=new ArrayList();
		Banner b=null;
		String type="";
		try {
			if(!cate.equals("All")) {
				type="Banner2";
			}else {
				type="Banner1";
			}
			String sql=prop.getProperty("selectBanner").replaceAll("@type", type);
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			if(!cate.equals("All")) {
				//카테고리가 메인이 아닌 경우 해당 카테고리에 속하는 것만 가져오기
				pstmt.setString(1, cate + "%");
			}else {
				pstmt.setString(1, "%");
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				b=new Banner();
				b.setPerfNo(rs.getString("perf_No"));
				b.setPerfName(rs.getString("perf_name"));
				b.setBanner1(rs.getString("banner1"));
				b.setBanner2(rs.getString("banner2"));
				b.setSrc(rs.getString("SRC"));
				b.setLocation(rs.getString("perf_location"));
				b.setPerfStart(rs.getDate("perf_start"));
				b.setPerfEnd(rs.getDate("perf_end"));	
				System.out.println(b);
				list.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("배너용리스트"+list);
		return list;
		
	}
	
	
	//동영상목록[카테고리화면용]
	public List<Banner> selectVideo(Connection conn, String cate) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Banner> list=new ArrayList();
		Banner b=null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectVideo"));
			if(!cate.equals("All")) {
				pstmt.setString(1, cate + "%");
			}else {
				pstmt.setString(1, "%");
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				b=new Banner();
				b.setPerfNo(rs.getString("perf_No"));
				b.setPerfName(rs.getString("perf_name"));
				b.setSrc(rs.getString("SRC"));
				b.setLocation(rs.getString("perf_location"));
				b.setPerfStart(rs.getDate("perf_start"));
				b.setPerfEnd(rs.getDate("perf_end"));	
				b.setPerfPoster(rs.getString("perf_poster"));	
				System.out.println(b);
				list.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("영상리스트"+list);
		return list;
	}
	//해당공연넘버 전체배너 파일,동영상경로 지우기
	public int deleteBanner(Connection conn, String perfNo) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("deleteBanner"));
			pstmt.setString(1, perfNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public String oldFileName(Connection conn, String perfNo, String choice) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String name="";
		String type="";
		try {
			if(choice.equals("메인")) {
				type="Banner1";
			}else if(choice.equals("공연")){
				type="Banner2";
			}
			String sql=prop.getProperty("oldFileName").replaceAll("@type", type);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, perfNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				name=rs.getString(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return name;
	}
	

}
