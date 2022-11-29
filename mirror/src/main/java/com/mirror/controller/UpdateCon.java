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


public class UpdateCon extends HttpServlet {
   private static final long serialVersionUID = 1L;

   
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  response.setContentType("text/html; charset=utf-8");
	  request.setCharacterEncoding("utf-8");
	  PrintWriter out = response.getWriter();
	  
      String m_nick = request.getParameter("nick");
      String m_pw = request.getParameter("pw");
      
      HttpSession session = request.getSession();
      memberVO loginMember=(memberVO)session.getAttribute("loginMember");
      String m_no = loginMember.getM_no();
      String m_id = loginMember.getM_id();
      
      memberVO updateMember = new memberVO(m_no, m_id, m_pw, m_nick);
      memberDAO dao = new memberDAO();
      int cnt = dao.updateMember(updateMember);
      
      if(cnt >0) {
         System.out.println("업데이트 성공");
         session.setAttribute("loginMember", updateMember);
         out.write("<script>alert('회원정보 수정을 성공적으로 마쳤습니다.'); location.href='mypage.jsp';</script>"); 
      }
      else {
         System.out.println("업데이트 실패");
         out.write("<script>alert('회원정보 변경에 실패하였습니다.'); location.href='mypage.jsp';</script>"); 
      }
      out.close();
      
      
      
      
      
      
      
      
      
      
   }

}