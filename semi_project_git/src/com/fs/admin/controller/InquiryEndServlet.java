package com.fs.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fs.admin.model.service.AdminService;
import com.fs.model.vo.Inquiry;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class InquiryEndServlet
 */
@WebServlet("/admin/InquiryEnd")
public class InquiryEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg","1:1문의 작성 오류! 관리자에게 문의하세요");
			request.setAttribute("loc", "/admin/mypage");
			request.getRequestDispatcher("/views/common/msg/jsp").forward(request, response);
			return;
		}
		
		String path = getServletContext().getRealPath("/image/upload/inquiry");
		int maxSize = 1024*1024*10;
		String encode = "utf-8";
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encode, rename);
		
		
		Inquiry iq = new Inquiry();
		
		int memberNo = Integer.parseInt(mr.getParameter("memberNo"));
		iq.setMemberNo(memberNo);
		iq.setInqCategory(mr.getParameter("inqCategory"));
		iq.setInqTitle(mr.getParameter("inqTitle"));
		iq.setInqContent(mr.getParameter("inqContent"));
		iq.setInqFileName(mr.getFilesystemName("inqFileName"));
			
		System.out.println(iq);
		int result = new AdminService().insertInquiry(iq);

		
		String msg = "";
		String loc = "/admin/inquiry?memberNo="+memberNo;
		String script = "";
		String opener = "";
		
		if(result>0) {
			//1:1문의 등록 성공 -> 메시지 띄어주기 -> 1:1문의 창 닫고, 고객센터 페이지로 이동
			msg = "1:1 문의가 접수되었습니다";
			script = "self.close();";
			opener = "window.opener.location.reload()";
		}else {
			msg = "문의사항을 다시 작성해주시기 바랍니다";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.setAttribute("script", script);
		request.setAttribute("opener", opener);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
