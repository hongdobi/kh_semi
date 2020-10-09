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
 * Servlet implementation class InquiryViewServlet
 */
@WebServlet("/admin/inquiryViewEnd")
public class InquiryViewEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryViewEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Inquiry iq = new Inquiry();
		
		int inqNo = Integer.parseInt(request.getParameter("inqNo"));
		String inqAnswer = request.getParameter("inqAnswer");
		String inqYn = request.getParameter("inqYn").equals("N")?"Y":"N";
		
		System.out.println("inquiryViewEnd : "+inqNo+inqAnswer+inqYn);
		
		int result = new AdminService().inquiryResponse(inqNo, inqAnswer, inqYn);
		
		System.out.println("iq"+iq);
		
		String msg = "";
		String loc = "/admin/inquiryViewEnd?inqNo="+inqNo;
		String script = "";
		String opener = "";
		
		if(result>0) {
			msg = "1:1 문의 답변이 작성되었습니다";
			script = "self.close();";
			opener = "window.opener.location.reload()";
		}else if(result==-1) {
			msg = "현재 작성된 문의 글이 삭제되었습니다";
		}else {
			msg = "답변을 다시 작성해주시기 바랍니다";
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
