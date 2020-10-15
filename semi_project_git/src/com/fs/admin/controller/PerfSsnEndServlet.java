package com.fs.admin.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.admin.model.service.AdminService;

/**
 * Servlet implementation class PerfSsnEndServlet
 */
@WebServlet("/admin/perfSsnEnd")
public class PerfSsnEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PerfSsnEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String perfNo = request.getParameter("perfNo");
		
		String str = request.getParameter("timeChoice");
		LocalDateTime parseLocalDateTime = LocalDateTime.parse(str);
		
		String str2 = parseLocalDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		Date dateTime = Date.valueOf(str2);
		
		
		
		System.out.println("perfSsnServlet :"+perfNo+dateTime);
		
		
		
		int result = new AdminService().insertPerfSsn(perfNo,dateTime);
		System.out.println("perfSsnServlet :"+result);
		
		String msg = "";
		String loc = "/admin/perfSsn";
		
		if(result>0) {
			msg = "공연시간이 성공적으로 등록되었습니다";
		}else {
			msg = "공연시간 등록을 실패했습니다. 다시 시도해주시기 바랍니다";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
//		Calendar c = Calendar.getInstance();
//		//일요일부터 (일:1,월:2,화:3,수:4,목:5,금:6,토:7)
//		int fDay = 1; //일요일 뽑기
//		int iDay = 2; //각 월 1일
//		int week = 7; //일주일 기준
//		c.set(1, 2020);
//		c.set(2, 4);
//		c.set(5, fDay);
//		
//		System.out.println("Calendar"+c.get(Calendar.DAY_OF_WEEK));
//		
//		if(c.get(Calendar.DAY_OF_WEEK)<iDay) {
//			c.set(5, (iDay-c.get(Calendar.DAY_OF_WEEK))+fDay);
//			System.out.println("C.day1"+c.get(5));
//		}else if(c.get(Calendar.DAY_OF_WEEK)==iDay){
//			c.set(5, fDay);
//			System.out.println("C.day2"+c.get(5));
//		}else {
//			c.set(5, (week+iDay)-c.get(Calendar.DAY_OF_WEEK)+fDay);
//			System.out.println("C.day3"+c.get(5));
//		}
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
