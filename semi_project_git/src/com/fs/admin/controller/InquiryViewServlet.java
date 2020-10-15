package com.fs.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.admin.model.service.AdminService;
import com.fs.model.vo.Inquiry;

/**
 * Servlet implementation class InquiryResponseServlet
 */
@WebServlet("/admin/inquiryView")
public class InquiryViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int inqNo = Integer.parseInt(request.getParameter("inqNo"));
		
		Inquiry iq = new AdminService().selectInquiryNo(inqNo);
		
		String msg = "";
		String loc = "";
		String path = "";
		if(iq==null) {
			msg = "선택한 1:1문의가 존재하지 않습니다";
			loc = "/admin/inquiryView";
			path = "/views/common/msg.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		}else {
			request.setAttribute("inquiry", iq);
			path = "/views/admin/inquiryView.jsp";
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
		//request.getRequestDispatcher("/views/admin/inquiryView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
