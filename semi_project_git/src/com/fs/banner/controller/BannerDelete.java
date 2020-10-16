package com.fs.banner.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.banner.model.service.BannerService;

/**
 * Servlet implementation class BannerDelete
 */
@WebServlet("/banner/bannerDelete")
public class BannerDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BannerDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		String perfNo=request.getParameter("perfNo");
		String b1=request.getParameter("b1");
		String b2=request.getParameter("b2");
		
		//해당 공연넘버의 파일들 삭제
		String filePath1=getServletContext().getRealPath("/image/banner/");
		String filePath2=getServletContext().getRealPath("/image/banner/");
		String fileName1="";
		String fileName2="";
		if(!b1.equals("X")) {
			fileName1=b1;
			filePath1+=fileName1;
			File f1=new File(filePath1);
			System.out.println(filePath1);
			if(f1.exists())f1.delete();
		}
		if(!b2.equals("X")){
			fileName2=b2;
			filePath2+=fileName2;
			File f2=new File(filePath2);
			System.out.println(filePath2);
			if(f2.exists())f2.delete();
		}
		int result=new BannerService().deleteBanner(perfNo);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out =response.getWriter();
		out.write(result+"");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
