package com.fs.admin.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fs.admin.model.service.AdminService;
import com.fs.model.vo.Performance;
import com.fs.perf.model.service.PerfService;

/**
 * Servlet implementation class PerfEndEnrollServlet
 */
@WebServlet("/admin/perfEndEnroll")
public class PerfEndEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PerfEndEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Performance p = new Performance();
		
		String perfNo = request.getParameter("perfNo");
		
		p.setPerfNo(request.getParameter("perfNo"));
		p.setPerfName(request.getParameter("perfName"));
		p.setPerfLocation(request.getParameter("perfLocation"));
		Date perfStart = Date.valueOf(request.getParameter("perfStart"));
		p.setPerfStart(perfStart);
		Date perfEnd = Date.valueOf(request.getParameter("perfEnd"));
		p.setPerfEnd(perfEnd);
		p.setPerfPg(Integer.parseInt(request.getParameter("perfPg")));
		p.setPerfTimeInfo(request.getParameter("perfTimeinfo"));
		p.setPerfPriceInfo(request.getParameter("perfPriceinfo"));
		p.setPerfRuntime(Integer.parseInt(request.getParameter("perfRuntime")));
		/* p.setPerfPoster(request.getParameter("perfPoster")); */
		p.setPerfAddress(request.getParameter("perfAddress"));
		p.setPerfCapacity(Integer.parseInt(request.getParameter("perfCapacity")));
		System.out.println(p);
		
		int result = new AdminService().insertPerformance(perfNo, p);
		System.out.println(request.getParameter("perfName"));
		Performance perf = new PerfService().findPerfNo(request.getParameter("perfName"));
		System.out.println("servlet"+result);
		
		
		System.out.println("서블릿 공연번호:" + perf.getPerfNo());
		String path = getServletContext().getRealPath("/image/perf/" + perf.getPerfNo());
		System.out.println(path);
		File file = new File(path);
		//Creating the directory
		boolean bool = file.mkdir();
		if(bool){
			System.out.println("Directory created successfully :" + perf.getPerfNo());
		}else{
			System.out.println("Sorry couldn’t create specified directory");
		}
		
		String msg = "";
		String loc = "/admin/poster";
		
		if(result>0) {
			msg = "공연정보가 성공적으로 등록되었습니다. 다음페이지로 이동해주세요";
		}else {
			msg = "공연등록에 실패했습니다. 다시 시도해주시기 바랍니다";
		}
		
		
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.setAttribute("perf", perf);
		
		request.getRequestDispatcher("/views/admin/poster.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}