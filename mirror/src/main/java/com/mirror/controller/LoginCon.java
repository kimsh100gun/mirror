package com.mirror.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mirror.domain.memberDAO;
import com.mirror.domain.memberVO;

/**
 * Servlet implementation class LoginCon
 */
public class LoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		
		
		String m_id = request.getParameter("id");
		String m_pw = request.getParameter("pw");
		
		memberVO member = new memberVO(m_id, m_pw);
		
		memberDAO dao = new memberDAO();
		memberVO loginMember =dao.selectMember(member);
		if(loginMember != null) {
			System.out.println("로그인 성공");
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", loginMember);
			
			
			
			out.write("<script>alert('로그인에 성공했습니다.'); location.href='Main.jsp';</script>"); 
			
		}
		else {
			System.out.println("로그인 실패");
			out.write("<script>alert('로그인에 실패했습니다.'); location.href='login.jsp';</script>"); 
		}
		out.close();
		
		
		
		
	}

}