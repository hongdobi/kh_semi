package com.fs.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.admin.model.service.AdminService;

/**
 * Servlet implementation class AuthorizeManagerServlet
 */
@WebServlet("/admin/authMG")
public class AuthorizeManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthorizeManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AdminService as = new AdminService();
		System.out.println("권한부여 서블릿 접속");
		String memberId = request.getParameter("member_id");
		System.out.println("권한 부여할 아이디 :" + memberId);
		int result = as.authMG(memberId);
		System.out.println(result);
		String referer = request.getHeader("Referer");
		System.out.println(referer);
		response.sendRedirect(request.getHeader("referer"));
		/*
		 * request.getRequestDispatcher("/views/admin/admin.jsp").forward(request,
		 * response);
		 */

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
