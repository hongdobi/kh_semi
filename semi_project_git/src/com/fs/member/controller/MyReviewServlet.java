package com.fs.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fs.model.vo.Member;
import com.fs.model.vo.Review;
import com.fs.perf.model.service.PerfService;
import com.fs.review.model.service.ReviewService;

/**
 * Servlet implementation class MyReviewServlet
 */
@WebServlet("/member/myReview")
public class MyReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		ReviewService rs = new ReviewService();
		Member loginMember = (Member)session.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();
		List<Review> rvList = rs.myReview(memberNo);
		
		String perfName = "";
		PerfService ps = new PerfService();
		for(int i = 0; i < rvList.size(); i++) {
			perfName += ps.findPerfName(rvList.get(i).getPerfNo()) + ",";
		}
		System.out.println(perfName);
		request.setAttribute("rvList", rvList);
		request.setAttribute("perfName", perfName);
		request.getRequestDispatcher("/views/member/myReview.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
