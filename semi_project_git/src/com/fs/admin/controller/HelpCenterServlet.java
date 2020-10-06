package com.fs.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.admin.model.service.AdminService;
import com.fs.model.vo.FAQ;

/**
 * Servlet implementation class HelpCenterServlet
 */
@WebServlet("/admin/helpCenter")
public class HelpCenterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelpCenterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String keyword = request.getParameter("keyword");
		List<FAQ> list = new AdminService().allFAQ(keyword);
		System.out.println("servlet"+list);
		
		request.setAttribute("FAQ", list);
		
		request.getRequestDispatcher("/views/admin/helpCenter.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
