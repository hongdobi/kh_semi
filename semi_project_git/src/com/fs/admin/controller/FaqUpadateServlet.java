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
 * Servlet implementation class FaqUpadateServlet
 */
@WebServlet("/admin/faqUpdate")
public class FaqUpadateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqUpadateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int no = Integer.parseInt(request.getParameter("no"));
		FAQ f = new FAQ();
		 f.setFaqTitle(request.getParameter("faqTitle"));
		    f.setFaqContent(request.getParameter("faqContent"));
		    f.setFaqHashTag(request.getParameter("faqHashTag"));
			int result = new FaqService().updateFaq(f,no);
				
			String msg="";
			String loc="/admin/faqList";
			
			msg=result>0?"FAQ수정성공":"FAQ수정실패";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/admin/faqView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
