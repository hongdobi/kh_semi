package com.fs.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path=getServletContext().getRealPath("/image/banner"); 
		int maxSize=1024*1024*1000; 
		MultipartRequest mr=new MultipartRequest(request, path,maxSize,"UTF-8",new DefaultFileRenamePolicy()); 
	
		String cate=mr.getParameter("cate");
		String link=mr.getParameter("link");

		List<String> saveFiles=new ArrayList(); 
		Enumeration<String> fileNames=mr.getFileNames();
		
		while(fileNames.hasMoreElements()) {
			saveFiles.add(mr.getFilesystemName(fileNames.nextElement()));
		}
		System.out.println(saveFiles.get(0));
		

		String msg="";
		String loc="/admin/bannerAdd"; 
		String script="";
		String opener="";
		/*
		 * int result=new BannerService().insertBanner(banner);
		 * 
		 * if(result>0){ msg="배너 등록 성공"; script="self.close()";
		 * opener="window.opener.location.reload()"; }else { msg="배너 등록실패"; }
		 * request.setAttribute("msg", msg); request.setAttribute("loc", loc);
		 * request.setAttribute("script", script); request.setAttribute("opener",
		 * opener);
		 * 
		 * request.getRequestDispatcher("/views/common/msg.jsp").forward(request,
		 * response);
		 * 
		 * 
		 */
			
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
