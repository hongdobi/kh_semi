package com.fs.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.admin.model.service.FaqService;
import com.fs.model.vo.FAQ;

/**
 * Servlet implementation class DropFixFaqServlet
 */
@WebServlet("/admin/faqview")
public class FaqViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int no = Integer.parseInt(request.getParameter("no"));
		
		FAQ f = new FaqService().selectFaqOne(no);
		String path="";
		if(f==null) {
			request.setAttribute("msg","선택한 글을 찾을 수 없습니다.");
			request.setAttribute("loc","/admin/faqList");
			path="/views/common/msg.jsp";
		}else {
			request.setAttribute("FAQ", f);
			path="/views/admin/faqview.jsp";
		}
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
