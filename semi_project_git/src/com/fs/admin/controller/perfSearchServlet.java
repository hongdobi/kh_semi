package com.fs.admin.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.fs.admin.model.service.AdminService;
import com.fs.model.vo.Performance;

/**
 * Servlet implementation class perfSearch
 */
@WebServlet("/admin/perfSearch")
public class perfSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public perfSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String cate=request.getParameter("cate");
		System.out.println(name);
		System.out.println(cate);
		List <Performance> list=new AdminService().searchPerf(name,cate);
		System.out.println("가져온값"+list);
		JSONArray arr=new JSONArray();
		for(Performance p:list) { 
			JSONObject jobj=new JSONObject(); 
			jobj.put("perfNo",p.getPerfNo()); 
			jobj.put("perfName",p.getPerfName()); 			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 MM월 dd일"); 
			jobj.put("perfStart",sdf.format(p.getPerfStart()));
			jobj.put("perfEnd",sdf.format(p.getPerfEnd()));
			jobj.put("location",p.getPerfLocation()); 			
			jobj.put("poster",p.getPerfPoster()); 			
			
			arr.add(jobj);
		}
		System.out.println(arr);
		
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
