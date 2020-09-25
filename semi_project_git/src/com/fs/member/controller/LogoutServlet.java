package com.fs.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
//로그아웃 서블릿
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//LoginEndServlet에서 생성한 session값을 불러와서 지우기
		//request.getSession(false) : false일 경우는 세션에 값이 있을 때만 불러온다는 것을 뜻함
		HttpSession session = request.getSession(false);
		
		if(session!=null) {
			//session에 값이 있을 경우, invalidate로 세션값을 지운다, else일 경우는 굳이 생각 안함 session값이 없을 때이기 때문에
			session.invalidate(); 
		}
		
		//로그아웃한 뒤에 메인화면으로 전환하기
		//넘겨줄 값이 없기 때문에 sendRedirect로 넘겨준다
		//reqeust.getContextPath() = http://localhost:9090/fivestar/ 를 의미한다
		response.sendRedirect(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
