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
 * Servlet implementation class SearchMemberServlet
 */
@WebServlet("/admin/searchMember")
public class SearchMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AdminService as = new AdminService();
		String type=request.getParameter("searchType");
		String key=request.getParameter("searchKeyword");
		System.out.println("타입 키 :" + type + key);
		String pageBar="";
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerPage=10;
		
		int totalData = as.searchCount(type, key);
		int totalPage = (int)Math.ceil((double)totalData/numPerPage);
		
		int pageBarSize= 5;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd= pageNo + pageBarSize - 1;
		
		if(pageNo==1) {
			pageBar += "<span>[이전]</span>";
		}else {
			pageBar+="<a href='" + request.getContextPath() + 
					"/admin/searchMember?searchType="
					+ type + "&searchKeyword="
						+ key + "&cpage="+(pageNo-1) + "'>[이전]</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+
						"/admin/searchMember?searchType="
						+ type + "&searchKeyword="
								+ key + "&cPage="+pageNo+"' class='pageNo'>" + pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<span>" + pageNo + "</span>";
		}else {
			pageBar+="<a href='" + request.getContextPath()+
					"/admin/searchMember?searchType="
					+ type + "&searchKeyword="
							+ key + "&cPage=" + pageNo + "' class='pageNo'>[다음]</a>";
		}
		
		
		List<Member> memList=as.searchMemberList(type, key, cPage, numPerPage);
		System.out.println("checkpoint 1 :" + memList);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("memList", memList);
		request.getRequestDispatcher("/views/admin/searchMember.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
