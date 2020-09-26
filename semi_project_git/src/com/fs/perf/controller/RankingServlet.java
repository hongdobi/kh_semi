package com.fs.perf.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.fs.model.vo.PerfSsn;
import com.fs.model.vo.Performance;
import com.fs.perf.model.service.PerfService;
import com.fs.perfSsn.model.service.PerfSsnService;

/**
 * Servlet implementation class RankingServlet
 */
@WebServlet("/perf/RankList.do")
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
		String cate="";
		
		List <PerfSsn>rkList=new PerfSsnService().rank(month,cate);
		List <Performance>perfList=new PerfService().rankPerformance(rkList);
		
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
