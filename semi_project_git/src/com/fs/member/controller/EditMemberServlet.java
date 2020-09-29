package com.fs.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.member.model.service.MemberService;
import com.fs.model.vo.Member;

/**
 * Servlet implementation class EditMemberServlet
 */
@WebServlet("/member/editMember")
public class EditMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Member m = new Member();
		m.setMemberId(request.getParameter("memberId"));
		m.setMemberPw(request.getParameter("memberPw"));
		m.setMemberName(request.getParameter("memberName"));
		m.setPhone(request.getParameter("Phone"));
		m.setEmail(request.getParameter("Email"));		
		Date bday = Date.valueOf(request.getParameter("Bday"));
		m.setBday(bday);
		
		int result = new MemberService().updateMember(m);
		
		String msg="";
		String loc="";
		
		if(result>0) {
			msg="회원정보가 수정되었습니다";
			loc="/";
		}else {
			msg="회원정보 수정 실패";
			loc="/";
		}
		System.out.println(m);
		request.getSession().removeAttribute("loginMember");
		request.getSession().setAttribute("loginMember", m);
		
		request.getRequestDispatcher("/views/member/myPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
