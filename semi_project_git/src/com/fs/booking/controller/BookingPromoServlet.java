package com.fs.booking.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/book/promo")
public class BookingPromoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public BookingPromoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String perfNo=request.getParameter("perfNo");
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		String dateChoice=request.getParameter("date_choice");
		String ssnChoice=request.getParameter("ssn_choice");
		int nofTicket=Integer.parseInt(request.getParameter("nofTicket"));
		List row=new ArrayList();
		//row=(List)request.getAttribute("rArray");
		int rNo=0;
		for(int i=0;i<nofTicket;i++) {
			rNo++;
			row.add(request.getParameter("seat_row"+rNo));			
		}		
		System.out.println("열번호: "+row);
		
		int cNo=0;
		List col=new ArrayList();
		//col=(List)request.getAttribute("cArray");
		for(int i=0;i<nofTicket;i++) {
			cNo++;
			col.add(request.getParameter("seat_column"+cNo));			
		}
		System.out.println("좌석번호: "+col);
		
		
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
