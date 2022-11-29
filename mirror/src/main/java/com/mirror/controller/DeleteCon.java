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


public class DeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		
		String test_pw=request.getParameter("pw");
		
		HttpSession session = request.getSession();
		memberVO loginMember=(memberVO)session.getAttribute("loginMember");
		String loginMemberNickname = loginMember.getM_nick();
		if(test_pw.equals(loginMember.getM_pw())) {
			memberDAO dao = new memberDAO();
			int cnt =dao.deleteMember(loginMember);
			if(cnt > 0) {
				
				session.removeAttribute("loginMember");
				System.out.println("회원탈퇴 성공");
				
				out.write("<script>alert('떠나신다니 아쉽습니다. GoodBye'); location.href='Main.jsp';</script>"); 
			}
			else {
				System.out.println("회원탈퇴 실패");
				out.write("<script>alert('회원탈퇴에 실패했습니다. 비밀번호를 다시 한 번 확인하시거나, 쓴 댓글을 혹은 찜한 목록을 비우십시오.'); location.href='delete.jsp';</script>"); 
				
			}
			out.close();
		
		}
	}

}
