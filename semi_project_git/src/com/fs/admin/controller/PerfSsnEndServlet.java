package com.fs.admin.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.GregorianCalendar;

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
		//parseLocalDateTime.
		
		String str2 = parseLocalDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		Date dateTime = new Date(parseLocalDateTime.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli());
		
		Calendar c=Calendar.getInstance();
				c.setTime(dateTime);
		System.out.println("perfSsnServlet :"+perfNo+c.get(Calendar.HOUR)+c.get(Calendar.MINUTE));
		
		
		
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
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
