package com.mirror.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mirror.domain.replyDAO;
import com.mirror.domain.replyVO;


public class replyUpdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		
		String r_no =request.getParameter("r_no");
		String m_no = request.getParameter("m_no");
		String p_no = request.getParameter("p_no");
		String r_con = request.getParameter("reply_content");
		String return_page = request.getParameter("return_page");
		
		replyVO updateReply = new replyVO(r_no, m_no, r_con, p_no);
		replyDAO dao = new replyDAO();
		int cnt =0;
		cnt = dao.updateReply(updateReply);
		if(cnt >0) {
			System.out.println("댓글 수정 완료");
			if(return_page.equals("d")) {
				
				out.write("<script>alert('댓글을 수정했습니다.'); location.href='detailPlaceCon?no="+p_no+"';</script>"); 
				
			}
			else {
				out.write("<script>alert('댓글을 수정했습니다.'); location.href='myreplyRist.jsp';</script>"); 
			}
		}
		else {
			System.out.println("댓글 수정 실패");
			out.write("<script>alert('댓글을 수정에 실패했습니다.'); location.href='myreplyRist.jsp';</script>"); 
		}
		out.close();

	}

}
