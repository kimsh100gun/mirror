package com.mirror.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mirror.domain.loveDAO;
import com.mirror.domain.loveVO;


public class deleteLoveCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String m_no = request.getParameter("m_no");
		String p_no = request.getParameter("p_no");

		String page = request.getParameter("page");
		
		loveVO deleteLove = new loveVO(m_no, p_no);	
		
		loveDAO dao = new loveDAO();
		int cnt =0;
		cnt =dao.deleteLove(deleteLove);
		if(cnt >0) {
			System.out.println("찜 삭제 성공");
			if(page.equals("d")) {
				out.write("<script>alert('찜 삭제에 성공했습니다.'); location.href='detailPlaceCon?no="+p_no+"';</script>"); 
			}
			else {
				out.write("<script>alert('찜 삭제에 성공했습니다.'); location.href='loveList.jsp';</script>"); 
			}
			
		}
		else {
			System.out.println("찜 삭제 실패");
			out.write("<script>alert('찜 삭제에 실패했습니다.'); location.href='detailPlaceCon?no="+p_no+"';</script>"); 
		}
		
		out.close();
	}

}
