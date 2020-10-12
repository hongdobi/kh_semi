package com.fs.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.member.model.service.MemberService;
import com.fs.model.vo.Member;

/**
 * Servlet implementation class IdDuplicateServlet
 */
@WebServlet("/member/idDuplicate")
public class IdDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IdDuplicateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		Member m = new MemberService().memberInfo(memberId);
		
		
		String str = "";
		
		if(m!=null) {
			str = "중복된 아이디가 존재합니다";
		}else {
			str = "멋진 아이디네요";
		}

		//request.setAttribute("result", m);
		request.setAttribute("str", str);
		request.getRequestDispatcher("/views/member/Duplicate.jsp").forward(request, response);			

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
