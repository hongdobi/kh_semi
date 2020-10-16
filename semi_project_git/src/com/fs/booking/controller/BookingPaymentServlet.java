package com.fs.booking.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fs.booking.model.service.BookingService;
import com.fs.model.vo.Booking;
import com.fs.model.vo.Performance;
import com.fs.model.vo.Seat;


@WebServlet("/book/payment")
public class BookingPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BookingPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dateChoice1=request.getParameter("dateChoice");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		
		java.util.Date date_choice=new java.util.Date();
		try {
			date_choice=sdf.parse(dateChoice1);
		} catch (ParseException e) {			
			e.printStackTrace();
		}
		date_choice.setTime(date_choice.getTime()-((long)1000*60*60*24));
		String dateChoice2=sdf.format(date_choice);
		System.out.println(dateChoice2);
		
		String ssnChoice=request.getParameter("ssnChoice");		
		int notk=Integer.parseInt(request.getParameter("notk"));
		int discount=Integer.parseInt(request.getParameter("discount"));
		int netDiscount=notk*discount;
		
		request.setAttribute("dateChoice1", dateChoice1);
		request.setAttribute("dateChoice2", dateChoice2);		
		request.setAttribute("ssnChoice", ssnChoice);
		request.setAttribute("netDiscount", netDiscount);
		
		request.getRequestDispatcher("/views/book/payment.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
