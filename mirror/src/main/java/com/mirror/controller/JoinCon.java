package com.mirror.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mirror.domain.memberDAO;
import com.mirror.domain.memberVO;


public class JoinCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		
		
		String m_id = request.getParameter("id");
		String m_pw = request.getParameter("pw");
		String m_nick = request.getParameter("nick");
		
		memberVO member = new memberVO(m_id, m_pw, m_nick);
		memberDAO dao = new memberDAO();
		int cnt = dao.insertMember(member);
		if(cnt > 0) {
			System.out.println("회원가입 성공");
			out.write("<script>alert('회원가입에 성공했습니다.'); location.href='Main.jsp';</script>"); 
		}
		else {
			System.out.println("회원가입 실패");
			out.write("<script>alert('회원가입에 실패했습니다.'); location.href='Main.jsp';</script>"); 
		
		}
		
		out.close();
		
		
		
		
		
	}

}
