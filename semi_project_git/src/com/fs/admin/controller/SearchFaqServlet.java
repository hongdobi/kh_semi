package com.fs.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.admin.model.service.FaqService;
import com.fs.model.vo.FAQ;



/**
 * Servlet implementation class SearchFaqServlet
 */
@WebServlet("/admin/searchFaq")
public class SearchFaqServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchFaqServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
        String key=request.getParameter("searchKeyword");
		
		List<FAQ> f=new FaqService().searchFaqList(key);
		

     	//클라이언트가 보낸 타입과 key값으로 DB에 있는 값 조회하기!
	   
	   
	    request.setAttribute("FAQ",f);
	    request.getRequestDispatcher("/views/admin/faqList.jsp")
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
