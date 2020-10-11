package com.fs.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.booking.model.service.BookingService;
import com.fs.model.vo.Review;
import com.fs.review.model.service.ReviewService;

/**
 * Servlet implementation class ReviewUpdateServlet
 */
@WebServlet("/review/reviewUpdate")
public class ReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bookNo=request.getParameter("bNo");
		String perfName=request.getParameter("perfName");
		Review rev=new ReviewService().selectReviewOne(bookNo);
		
		request.setAttribute("revUpdate", rev);
		request.setAttribute("perfName", perfName);
		request.getRequestDispatcher("/views/review/reviewWrite.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
