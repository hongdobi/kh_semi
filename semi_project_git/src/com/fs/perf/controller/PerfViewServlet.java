package com.fs.perf.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.model.vo.PerfFile;
import com.fs.model.vo.Performance;
import com.fs.model.vo.Review;
import com.fs.perf.model.service.PerfService;
import com.fs.perfFile.model.service.PerfFileService;
import com.fs.review.model.service.ReviewService;



@WebServlet("/perf/perfView.do")
public class PerfViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PerfViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//이전 페이지에서 포스터 클릭시 공연넘버를 넘겨줌
		String perfNo=(String)request.getParameter("perfNo");
		
		//공연정보, 상세페이지 가져오기
		Performance perf=new PerfService().selectPerformance(perfNo);
		List<PerfFile> fList=new PerfFileService().selectPerfFile(perfNo);		
		
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
			
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		int numPerPage=5;
		//해당공연리뷰 블러오기
		List<Review> rvList=new ReviewService().selectReview(cPage,numPerPage,perfNo);
		//리뷰 데이터 수, 페이지 배분
		int totalData=new ReviewService().selectReviewCount();
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		
		//페이지바구성
		int pageBarSize=5; 
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;  
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="";
		
		if(pageNo==1) { 
			pageBar+="<span>[이전]</span>"; 
		}else {
			pageBar+="<a href='"+request.getContextPath()
					+"/perf/perfView.do?cPage="+(pageNo-1)+"'>[이전]</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)){
			if(pageNo==cPage) {
				
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()
				+"/perf/perfView.do?cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++; 
		}
		
		
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
	
		}else {
			pageBar+="<a href='"+request.getContextPath()
					+"/perf/perfView.do?cPage="+pageNo+"'>[다음]</a>";
		}
		
		request.setAttribute("performance", perf);
		request.setAttribute("fList", fList);
		request.setAttribute("rvList",rvList);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/views/perf/perfView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
