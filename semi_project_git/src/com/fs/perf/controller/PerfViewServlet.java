package com.fs.perf.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fs.booking.model.service.BookingService;
import com.fs.model.vo.Booking;
import com.fs.model.vo.Member;
import com.fs.model.vo.PerfFile;
import com.fs.model.vo.Performance;
import com.fs.model.vo.Review;
import com.fs.perf.model.service.PerfService;
import com.fs.perfFile.model.service.PerfFileService;
import com.fs.perfSsn.model.service.PerfSsnService;
import com.fs.review.model.service.ReviewService;



@WebServlet("/perf/perfView")
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
		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("loginMember");
		
		int memberNo=0;
		if(m!=null){
			memberNo=m.getMemberNo();
		}
		
		//이전 페이지에서 포스터 클릭시 공연넘버를 넘겨줌
		String perfNo=(String)request.getParameter("perfNo");
		//공연정보, 상세페이지 가져오기,해당 공연회차정보가져오기
		Performance perf=new PerfService().selectPerformance(perfNo);
		List<PerfFile> fList=new PerfFileService().selectPerfFile(perfNo);		
		List<Booking> bkList=new BookingService().selectBookingRV(perfNo, memberNo);
		//공연 날짜만 가져오기
		List dateList=new PerfSsnService().selectDateTime(perfNo);		
		System.out.println("servlet"+dateList);
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
		int totalData=new ReviewService().selectReviewCount(perfNo);
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
					
					+"/perf/perfView?perfNo="+perfNo+"&cPage="+(pageNo-1)+"#review'>[이전]</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)){
			if(pageNo==cPage) {
				
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()
				+"/perf/perfView?perfNo="+perfNo+"&cPage="+pageNo+"#review'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
	
		}else {
			pageBar+="<a href='"+request.getContextPath()
					+"/perf/perfView?perfNo="+perfNo+"&cPage="+pageNo+"#review'>[다음]</a>";
		}
		
		request.setAttribute("performance", perf);
		request.setAttribute("dateList", dateList);
		request.setAttribute("fList", fList);
		request.setAttribute("bkList", bkList);
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
