package com.fs.banner.controller;

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

import com.fs.banner.model.service.BannerService;
import com.fs.model.vo.Banner;

/**
 * Servlet implementation class BannerList
 */
@WebServlet("/banner/bannerList")
public class BannerList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BannerList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cate=request.getParameter("cate");
		List<Banner> list=new BannerService().selectBannerList(cate);
		
		JSONArray arr=new JSONArray();
		for(Banner b:list) { 
			JSONObject jobj=new JSONObject(); 
			
			jobj.put("perfNo",b.getPerfNo());
			jobj.put("banner1",b.getBanner1());
			jobj.put("banner2",b.getBanner2());
			jobj.put("link",b.getSrc());
			arr.add(jobj);
		}
		System.out.println("list가져왔다"+arr);
		
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
