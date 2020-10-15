package com.fs.admin.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InquiryFileDownloadServlet
 */
@WebServlet("/admin/inquiryFileDownload")
public class InquiryFileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryFileDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fileName = request.getParameter("fileName");
		
		String filePath = getServletContext().getRealPath("/image/upload/inquiry");
		File f = new File(filePath+"/"+fileName);
		FileInputStream fis = new FileInputStream(f);
		BufferedInputStream bis = new BufferedInputStream(fis);
		
		String fileReName = "";
		String header = request.getHeader("user-agent");
		boolean isMSIE = header.indexOf("MSIE")!=-1||header.indexOf("Trident")!=-1;
		if(isMSIE) {
			fileReName = URLEncoder.encode(fileName,"utf-8").replaceAll("\\+", "%20");
		}else {
			fileReName = new String(fileName.getBytes("utf-8"),"ISO-8859-1");
		}
		
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+fileReName);
		
		ServletOutputStream sos = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);
		int read = -1;
		while((read=bis.read())!=-1) {
			bos.write(read);
		}
		
		bos.close();
		bis.close();
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
