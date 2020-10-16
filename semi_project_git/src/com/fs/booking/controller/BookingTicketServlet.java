package com.fs.booking.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fs.booking.model.service.BookingService;
import com.fs.model.vo.Booking;
import com.fs.model.vo.Member;


@WebServlet("/book/taking_tickets")
public class BookingTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BookingTicketServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dateChoice=request.getParameter("dateChoice");
		String ssnChoice=request.getParameter("ssnChoice");		
		int discount=Integer.parseInt(request.getParameter("discount"));
		int notk=0;
		if(discount!=0) {
			notk=Integer.parseInt(request.getParameter("notk"));
		}
		
		HttpSession session=request.getSession(false);
		Booking book=new Booking();
		if(session!=null) {
			book=(Booking)session.getAttribute("book");			
		}
		System.out.println(book);
		
		int memberNo=book.getMemberNo();
		Member m=new BookingService().selectMember(memberNo);
		
		
		
		request.setAttribute("dateChoice", dateChoice);
		request.setAttribute("ssnChoice", ssnChoice);
		request.setAttribute("discount", discount);
		request.setAttribute("notk", notk);
		request.setAttribute("m", m);
		
		request.getRequestDispatcher("/views/book/taking_tickets.jsp").forward(request, response);
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
