package com.fs.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.admin.model.service.AdminService;
import com.fs.admin.model.service.FaqService;
import com.fs.model.vo.FAQ;

/**
 * Servlet implementation class FaqDeleteServlet
 */
@WebServlet("/admin/deleteFaq")
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
		// TODO Auto-generated method stub
		
		int no = Integer.parseInt(request.getParameter("faqNo"));
		int result = new FaqService().deleteFaq(no);
			
		
		String msg="";
		String loc="/admin/faqList";
		
		msg=result>0?"FAQ삭제성공":"FAQ삭제실패";
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
