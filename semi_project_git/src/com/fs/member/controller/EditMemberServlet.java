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
@WebServlet(name="editMember", urlPatterns="/member/editMember")
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
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		Boolean b = new MemberService().checkPw(memberId, memberPw);
		System.out.println("checkpoint 1" + b);
		Member m = new Member();
		String msg="";
		String loc="/member/myPage";		
		m.setMemberId(request.getParameter("memberId"));
		m.setMemberPw(request.getParameter("newPw"));
		m.setMemberName(request.getParameter("memberName"));
		m.setPhone(request.getParameter("Phone"));
		m.setEmail(request.getParameter("Email"));		
		Date bday = Date.valueOf(request.getParameter("Bday"));
		m.setBday(bday);
		m.setManagerYn("N");
		int result = 0;
		System.out.println("checkpoint 2");
		if(b == true) {
			result = new MemberService().updateMember(m);			
		}else System.out.println("비밀번호가 틀렸습니다");
		
		
		if(result>0) {
			msg="회원정보가 수정되었습니다";
		}else {
			msg="회원정보 수정 실패";
		}		
		
		request.getSession().removeAttribute("loginMember");
		request.getSession().setAttribute("loginMember", m);
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
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
