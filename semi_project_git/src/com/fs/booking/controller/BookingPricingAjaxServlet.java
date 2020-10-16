package com.fs.booking.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/book/pricing")
public class BookingPricingAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BookingPricingAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int notk=Integer.parseInt(request.getParameter("notk"));
		int discount=Integer.parseInt(request.getParameter("discount"));
		int netDiscount=notk*discount;
		String chargedPrice=request.getParameter("chargedPrice").substring(0,request.getParameter("chargedPrice").indexOf("원"));
		
		System.out.println("발생금액: "+chargedPrice+" 할인금액: "+netDiscount);
				
		request.setAttribute("netDiscount", netDiscount);
		request.setAttribute("chargedPrice", chargedPrice);
		request.getRequestDispatcher("/views/book/pricing.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
