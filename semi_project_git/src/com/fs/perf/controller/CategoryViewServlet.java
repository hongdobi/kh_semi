package com.fs.perf.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.banner.model.service.BannerService;
import com.fs.model.vo.Banner;

/**
 * Servlet implementation class MusicalViewServlet
 */
@WebServlet("/perf/categoryView")
public class CategoryViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//주소값으로 전달 받은 카테고리 파라미터가지고 해당페이지로 이동
		String cate=request.getParameter("cate");
		
		List <Banner> list=new BannerService().selectBanner(cate);
		
		request.setAttribute("cate", cate);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/perf/CategoryView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
