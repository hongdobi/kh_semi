package com.fs.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.admin.model.service.AdminService;
import com.fs.model.vo.Member;

/**
 * Servlet implementation class MemberMGServlet
 */
@WebServlet("/admin/memberMG")
public class MemberMGServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMGServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AdminService as = new AdminService();
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerPage=10;
		
		int totalData = as.memberCount();
		int totalPage = (int)Math.ceil((double)totalData/numPerPage);
		
		int pageBarSize= 5;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd= pageNo + pageBarSize - 1;
		String pageBar="";
		
		if(pageNo==1) {
			pageBar += "<span>[이전]</span>";
		}else {
			pageBar+="<a href='" + request.getContextPath() + 
					"/admin/memberMG?cpage="+(pageNo-1) + "'>[이전]</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+
						"/admin/memberMG?cPage="+pageNo+"' class='pageNo'>" + pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<span>" + pageNo + "</span>";
		}else {
			pageBar+="<a href='" + request.getContextPath()+
					"/admin/memberMG?cPage=" + pageNo + "' class='pageNo'>[다음]</a>";
		}
		request.setAttribute("pageBar", pageBar);
		
		
		System.out.println("서블릿 접속");
		List<Member> memList = as.memList(cPage, numPerPage);
		request.setAttribute("memList", memList);
		request.getRequestDispatcher("/views/admin/memberMG.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
