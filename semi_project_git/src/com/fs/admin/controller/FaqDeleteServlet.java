package com.fs.admin.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.admin.model.dao.FaqDao;
import com.fs.admin.model.service.AdminService;
import com.fs.admin.model.service.FaqService;
import com.fs.model.vo.FAQ;

/**
 * Servlet implementation class FaqDeleteServlet
 */
@WebServlet("/faqDelete")
public class FaqDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FaqDao faqDao = new FaqDao(); //db연결을 위한 인스턴스 생성
		boolean result = false; //게시물 삭제 결과를 받을 변수 
		
		//삭제하기 위한 게시물 번호를 파라미터로 가져온다.
		int no = Integer.parseInt(request.getParameter("no"));
		
	
	
	//실제로 dao를 통해 db에 게시물을 삭제합니다.
	  result = new FaqService().deleteFaq(no);
		 System.out.println(no);
		 String msg="";
			String loc="/admin/faqList";
			
			msg=result==false?"FAQ삭제성공":"FAQ삭제실패";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		    request.getRequestDispatcher("/views/common/msg.jsp")
		    .forward(request, response);
		
	}
		
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
