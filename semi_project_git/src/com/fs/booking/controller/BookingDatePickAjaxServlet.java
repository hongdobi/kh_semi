package com.fs.booking.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.model.vo.PerfSsn;
import com.fs.perfSsn.model.service.PerfSsnService;


@WebServlet("/book/datepick")
public class BookingDatePickAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BookingDatePickAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date=request.getParameter("datepick");
		Date bookDate=Date.valueOf(date);
		System.out.println("선택한 날짜: "+bookDate);
		String perfNo=request.getParameter("perfNo");
		
		List<PerfSsn> list=new PerfSsnService().selectSsnTime(perfNo,bookDate);	
		
		request.setAttribute("list", list);		
		request.getRequestDispatcher("/views/book/datepick.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
