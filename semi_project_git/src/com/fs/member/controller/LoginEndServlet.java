package com.fs.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fs.member.model.service.MemberService;
import com.fs.model.vo.Member;

/**
 * Servlet implementation class LoginEndServlet
 */
//로그인 서블릿
@WebServlet("/loginEnd")
public class LoginEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		String saveId = request.getParameter("saveId"); 

		//DB연결
		Member m = new MemberService().selectMember(memberId, memberPw);
		
		//아이디저장 
		if(saveId!=null) {
			//아이디저장 체크O
			Cookie c = new Cookie("saveId", memberId);
			c.setMaxAge(60*60*24*30); //1달동안 아이디저장 유지
			response.addCookie(c);
		}else {
			//아이디저장 체크X
			Cookie c = new Cookie("saveId","");
			c.setMaxAge(0); //쿠키삭제
			response.addCookie(c);
		}
		
		//로그인 정보 유지를 위한 session 사용
		if(m!=null) {
			//객체 m!=null -> 로그인 성공
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", m);
			//메인으로 이동
			response.sendRedirect(request.getContextPath());
		}else {
			//객체 m==null -> 로그인 실패
			//실패 메시지 띄우기
			String msg = "아이디나 비밀번호가 일치하지 않습니다";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
		
	
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
