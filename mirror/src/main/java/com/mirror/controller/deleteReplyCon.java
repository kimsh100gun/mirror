package com.mirror.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mirror.domain.replyDAO;
import com.mirror.domain.replyVO;

/**
 * Servlet implementation class deleteReplyCon
 */
public class deleteReplyCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
	
		
		String r_no =request.getParameter("no");
		String return_page = request.getParameter("return_page");
		String p_no = request.getParameter("p_no");
		
		replyDAO dao = new replyDAO();
		
	
		replyVO deleteReply = new replyVO(r_no);
		
		
		
		
		
		int cnt =0;
		cnt = dao.deleteReply(deleteReply);
		if(cnt >0) {
			System.out.println("댓글 지우기 성공");
			if(return_page.equals("d")) {
				out.write("<script>alert('댓글을 지웠습니다.'); location.href='detailPlaceCon?no="+p_no+"';</script>"); 
			}
			else {
				out.write("<script>alert('댓글을 지웠습니다.'); location.href='myreplyRist.jsp';</script>"); 
			}
		}
		else {
			System.out.println("댓글 지우기 실패");
			if(return_page.equals("d"))
			{
			out.write("<script>alert('댓글 지우기 실패했습니다.'); location.href='detailPlaceCon?no="+p_no+"';</script>"); 
			}
			else {
				out.write("<script>alert('댓글 지우기 실패했습니다.'); location.href='myreplyRist.jsp';</script>"); 
			}
			
			}
		out.close();
		

	}

}
