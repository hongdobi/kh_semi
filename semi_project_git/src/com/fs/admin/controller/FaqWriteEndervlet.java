package com.fs.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fs.admin.model.service.FaqService;
import com.fs.model.vo.FAQ;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class FaqWriteEndervlet
 */
@WebServlet("/admin/faqWriteEnd")
public class FaqWriteEndervlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqWriteEndervlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	FAQ f = new FAQ();
    f.setFaqTitle(request.getParameter("faqTitle"));
    f.setFaqContent(request.getParameter("faqContent"));
    f.setFaqHashTag(request.getParameter("faqHashTag"));
    System.out.println(f);	
	int result = new FaqService().insertFaq(f);
		
	String msg="";
	String loc="/admin/faqList";
	
	msg=result>0?"FAQ등록성공":"FAQ등록실패";
	request.setAttribute("msg", msg);
	request.setAttribute("loc", loc);
    request.getRequestDispatcher("/views/common/msg.jsp")
    .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
