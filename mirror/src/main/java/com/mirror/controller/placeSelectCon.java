package com.mirror.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mirror.domain.placeDAO;
import com.mirror.domain.placeVO;

/**
 * Servlet implementation class placeSelectCon
 */
public class placeSelectCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<placeVO> places = null;
		
		String p_region = request.getParameter("p_region");
		String p_type = request.getParameter("p_type");

		int viewPage =1;
		if(request.getParameter("viewPage") != null) {
			viewPage = Integer.parseInt(request.getParameter("viewPage"));
		}
	
		
		placeVO place = new placeVO(p_region, p_type);
		placeDAO dao = new placeDAO();
		places = dao.selectPlace(place);
		
		
		if(places != null) {
			 System.out.println("불러오기 성공");
			 request.setAttribute("placeList", places);
			 RequestDispatcher rd =
		     request.getRequestDispatcher("placelist.jsp?viewPage="+viewPage);
		             
		     rd.forward(request,response);
			
				
		 }
		 else {
			 System.out.println("불러오기 실패");
		 }
		
	}

}
