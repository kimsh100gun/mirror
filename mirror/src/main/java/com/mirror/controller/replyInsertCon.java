package com.mirror.controller;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mirror.domain.replyDAO;
import com.mirror.domain.replyVO;

public class replyInsertCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		int cnt =0;
		String m_no = request.getParameter("memberM_no");
		String p_no = request.getParameter("placeP_no");
		String r_con = request.getParameter("reply_content");
		replyVO reply = new replyVO(m_no, r_con, p_no);
		replyDAO dao = new replyDAO();
		cnt=dao.insertReply(reply);
		if(cnt >0) {
			System.out.println("댓글달기 성공");
			out.write("<script>alert('댓글을 달았습니다.'); location.href='detailPlaceCon?no="+p_no+"';</script>"); 
			
		}
		else {
			out.write("<script>alert('댓글을 달기에 실패했습니다.'); location.href='detailPlaceCon?no="+p_no+"';</script>"); 
		}
		out.close();
	
	}

}
