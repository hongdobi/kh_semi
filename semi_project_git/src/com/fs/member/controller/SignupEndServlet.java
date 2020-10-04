package com.fs.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.member.model.service.MemberService;
import com.fs.model.vo.Member;

/**
 * Servlet implementation class LoginSignupEndServlet
 */
//회원가입 페이지 서블릿, 클라이언트가 보낸 데이터를 DB에 저장하는 서블릿
@WebServlet(name="signupEnd",urlPatterns="/signupEnd")
public class SignupEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member m = new Member();
		m.setMemberId(request.getParameter("memberId"));
		m.setMemberPw(request.getParameter("memberPw"));
		m.setMemberName(request.getParameter("memberName"));
		m.setPhone(request.getParameter("phone"));
		m.setEmail(request.getParameter("email"));
		String bday =  request.getParameter("bday");
		
		//bday String -> Date로 형변환하기
		//bday 클라이언트에게 입력받는 String 8자리
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyymmdd");
		//Date로 변경하기 위해 날짜 형식 yyyy-mm-dd로 변경하기
		SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");
		
		java.util.Date tempDate = null;
		
		try {
			//현재 yyyymmdd로된 날짜 형식으로 java.util.Date객체 만들기
			tempDate = beforeFormat.parse(bday);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//java.util.Date를 yyyy-mm-dd형식으로 변경해 String으로 반환하기
		String transDate = afterFormat.format(tempDate);
		//반환된 String값을 Date로 변경
		Date bday2 = Date.valueOf(transDate);
		m.setBday(bday2);
		
		System.out.println(m); 
		
		//회원등록 결과를 int형으로 반환 
		int result = new MemberService().insertMember(m);
		
		//회원등록 성공, 실패 메시지 띄어주기!
		String msg = "";
		String loc = "";
		
		
		if(result>0) {
			//회원등록 성공 -> 메시지 띄어주기 -> 메인으로 이동
			msg = "오성티켓에 가입해주셔서 감사드립니다";
		}else {
			//회원등록 실패 -> 메시지 띄어주기 -> 메인으로 이동 
			msg = "회원등록을 다시 시도해주시기 바랍니다";
		}

		//메시지 띄울 것 넣기 
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		//화면 이동
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
