package com.fs.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.model.vo.Review;
import com.fs.review.model.service.ReviewService;

/**
 * Servlet implementation class ReviewWriteServlet
 */
@WebServlet("/review/reviewWirteEnd")
public class ReviewWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Review rv=new Review();
		
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		rv.setMemberNo(memberNo);
		String perfNo=request.getParameter("perfNo");
		rv.setPerfNo(perfNo);
		rv.setRevContent(request.getParameter("reviewtext"));
		int revScore=Integer.parseInt(request.getParameter("revScore"));
		rv.setRevScore(revScore);
		rv.setBookNo(request.getParameter("bookNo"));
		
		
		System.out.println(rv);
		
		int result=new ReviewService().insertReview(rv);
		
		String msg="";
		String loc="/review/reviewWrite?memberNo="+memberNo+"&perfNo="+perfNo; 
		String script="";
		String opener="";
		
		if(result>0){
			msg="관람후기 등록 성공";
			script="self.close()"; 
			opener="window.opener.location.reload()";

		}else {
			msg="관람후기 등록실패";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.setAttribute("script", script);
		request.setAttribute("opener", opener);
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
