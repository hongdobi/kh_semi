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
		Inquiry iq = new Inquiry();
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		iq.setMemberNo(memberNo);
		iq.setInqCategory(request.getParameter("inqCategory"));
		iq.setInqTitle(request.getParameter("inqTitle"));
		iq.setInqContent(request.getParameter("inqContent"));
		System.out.println(iq);
		
		int result = new AdminService().insertInquiry(iq);
		
		String msg = "";
		String loc = "/admin/Inquiry?memberNo="+memberNo;
		String script = "";
		
		if(result>0) {
			//1:1문의 등록 성공 -> 메시지 띄어주기 -> 1:1문의 창 닫고, 고객센터 페이지로 이동
			msg = "1:1 문의가 접수되었습니다";
			script = "self.close();";
		}else {
			msg = "문의사항을 다시 작성해주시기 바랍니다";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.setAttribute("script", script);
		
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
