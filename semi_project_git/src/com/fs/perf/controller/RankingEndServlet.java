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
		String month=null;
		if(request.getParameter("month")!=null) {
			month=request.getParameter("month")+"-01";
			
			System.out.println("달력날짜 받아오기 성공"+month);
		}else {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			month=sdf.format(new Date());
			System.out.println("달력오늘날짜 성공");
		}
		String cate=request.getParameter("cate");

		
		List <Performance>list=new PerfSsnService().rank(month,cate);
		
		JSONArray arr=new JSONArray();
		JSONObject j;
		if(list!=null) {
			for(Performance perf:list) { 
				j=new JSONObject(); 
				j.put("perfNo",perf.getPerfNo());
				j.put("perfName",perf.getPerfName());
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 MM월 dd일");
				j.put("start",sdf.format(perf.getPerfStart()));
				j.put("end",sdf.format(perf.getPerfEnd()));
				j.put("location",perf.getPerfLocation()); 
				j.put("poster",perf.getPerfPoster());
				j.put("count",perf.getPerfCount()); 
				arr.add(j);
			}
		}
		response.setContentType("application/json;charset=utf-8");
	
		response.getWriter().print(arr);
			
	}		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
