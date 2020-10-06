package com.fs.perfSsn.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.model.vo.Performance;
import com.fs.perfSsn.model.service.PerfSsnService;

/**
 * Servlet implementation class RankingServlet
 */
@WebServlet("/perf/RankList")
public class RankingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RankingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//메뉴에서 랭킹페이지로 랭킹정보가지고 이동
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String month=sdf.format(new Date());
		String cate="ALL";

		List <Performance>list=new PerfSsnService().rank(month,cate);
		int total=new PerfSsnService().ticketTotal(month, cate);
		request.setAttribute("total", total);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/perf/perfRank.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
