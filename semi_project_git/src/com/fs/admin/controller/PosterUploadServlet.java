package com.fs.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fs.model.vo.Performance;
import com.fs.perf.model.service.PerfService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class PosterUploadServlet
 */
@WebServlet("/admin/posterUpload")
public class PosterUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PosterUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "공지사항작성 오류![form:enctype에러 관리자에게 문의하세요!]");
			request.setAttribute("loc","/");
			request.getRequestDispatcher("/veiws/common/msg.jsp").forward(request,response);
			return;
		}
		/* String perfNo = request.getParameter("perfNo"); */
		String perfNo = (String)request.getSession().getAttribute("perfNo");
		
		System.out.println("upload servlet perfNo:" + perfNo);
		
		String path = getServletContext().getRealPath("/image/perf/" + perfNo);
		int maxSize=1024 * 1024 * 10;
		String encode="UTF-8";
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encode, rename);
		Performance p = new Performance();
		p.setPerfPoster(mr.getFilesystemName("perfPoster"));
		System.out.println(mr.getFilesystemName("perfPoster") + "//" + perfNo);
		p.setPerfNo(perfNo);
		new PerfService().updatePoster(p);
		
		System.out.println("admin.jsp 가기 직전");
		request.getRequestDispatcher("/views/admin/perfSsn.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
