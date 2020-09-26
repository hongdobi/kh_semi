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
 * Servlet implementation class RankingEndServlet
 */
@WebServlet("/perf/rankingEnd.do")
public class RankingEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RankingEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//랭킹페이지에서 받는 정보에 따라 랭킹정보가지고 이동
		
		String month=request.getParameter("month");
		String cate=request.getParameter("cate");

		List <PerfSsn>rkList=new PerfSsnService().rank(month,cate);
		List <Performance>perfList=new PerfService().rankPerformance(rkList);
		
		JSONArray rkArr=new JSONArray();
		JSONArray perfArr=new JSONArray();
		for(PerfSsn ssn:rkList) { 
			JSONObject j=new JSONObject(); 
			j.put("perfNo",ssn.getPerfNo());
			j.put("count",ssn.getNthCount()); 
			rkArr.add(j);
		}
		for(Performance perf:perfList) { 
			JSONObject j2=new JSONObject(); 
			j2.put("perfNo2",perf.getPerfNo());
			j2.put("perf",perf.getPerfName());
			j2.put("start",perf.getPerfStart());
			j2.put("end",perf.getPerfEnd());
			j2.put("location",perf.getPerfLocation()); 
			j2.put("poster",perf.getPerfPoster());
			perfArr.add(j2);
		}

		response.setContentType("application/json;charset=utf-8");
		response.getWriter().print(rkArr);
		response.getWriter().print(perfArr);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
