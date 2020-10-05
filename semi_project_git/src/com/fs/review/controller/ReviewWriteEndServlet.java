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
@WebServlet("/review/reviewWirteEnd.do")
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
		rv.setPerfNo(request.getParameter("perfNo"));
		
		rv.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		rv.setMemberId(request.getParameter("memberId"));
		
		
		int result=new ReviewService().insertReview(rv);
		
		String msg="";
		if(result>0) {
			msg="관람 후기 등록성공";
			
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
