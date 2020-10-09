package com.fs.banner.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.banner.model.service.BannerService;
import com.fs.model.vo.Banner;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class BannerUploadServlet
 */
@WebServlet("/admin/bannerUpload")
public class BannerUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BannerUploadServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = getServletContext().getRealPath("/image/banner");
		int maxSize = 1024 * 1024 * 1000;
		
		MultipartRequest mr=new MultipartRequest(request, path,maxSize,
				"UTF-8",new DefaultFileRenamePolicy());
		List<String> saveFiles = new ArrayList();
		Enumeration<String> fileNames = mr.getFileNames();

		while (fileNames.hasMoreElements()) {
			saveFiles.add(mr.getFilesystemName(fileNames.nextElement()));
		}
		String fileName=null;
		if(saveFiles.size()>0)fileName=saveFiles.get(0);
		
		Banner b = new Banner();

		String perfNo = mr.getParameter("perfNo");
		b.setPerfNo(perfNo);
		System.out.println(perfNo);
		
		String choice = mr.getParameter("choice");
		//String link = mr.getParameter("link");
		
		if(mr.getParameter("link")!=null) {
			b.setSrc(mr.getParameter("link"));
		}
	
		
		System.out.println(choice);
		System.out.println(perfNo);
		
		if(choice.equals("메인")) {
			System.out.println("배너1");
			b.setBanner1(fileName);
		}
		if(choice.equals("공연")) {
			System.out.println("배너2");
			b.setBanner2(fileName);
		}

		System.out.println(b);
		int result = new BannerService().insertBanner(b);
		System.out.println(result +"servlet");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out =response.getWriter();
		out.write(result+"");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
