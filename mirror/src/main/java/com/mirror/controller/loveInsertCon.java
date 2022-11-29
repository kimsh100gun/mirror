package com.mirror.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mirror.domain.loveDAO;
import com.mirror.domain.loveVO;

/**
 * Servlet implementation class loveInsertCon
 */
public class loveInsertCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String m_no = request.getParameter("memberM_no");
		String p_no = request.getParameter("placeP_no");
		String page = request.getParameter("page");
		
		loveVO love = new loveVO(m_no, p_no);
		loveDAO dao = new loveDAO();
		
		loveVO loveTest = null;
		loveTest = dao.selectLove(love);
		if(loveTest == null) {
			System.out.println("찜을 할 수 있는 상태 입니다.");
			
			int cnt =0;
			cnt = dao.insertLove(love);
			if(cnt>0) {
				System.out.println("찜추가 성공");
				if(page.equals("d")) {
					out.write("<script>alert('찜을 추가했습니다.'); location.href='detailPlaceCon?no="+p_no+"';</script>"); 
					
				}
				
				
				
			}
			else {
				System.out.println("찜추가 실패");
				out.write("<script>alert('찜 추가에 실패했습니다.'); location.href='detailPlaceCon?no="+p_no+"';</script>"); 
			}
		}
		else {
			System.out.println("이미 찜을 했습니다.");
			out.write("<script>alert('이미 찜을 했습니다.'); location.href='detailPlaceCon?no="+p_no+"';</script>"); 
		
		}
		out.close();
		
	
		
	}

}
