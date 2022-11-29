package com.mirror.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mirror.domain.placeDAO;
import com.mirror.domain.placeVO;


public class detailPlaceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		   	String p_no = request.getParameter("no");
		   	placeVO place = new placeVO(p_no);
		   	placeVO resultPlace = null;
		   	
		   	placeDAO dao = new placeDAO();
		   	resultPlace=dao.selectPlaceByp_no(place);
		   	
		   	if(resultPlace != null){
		   		System.out.println("불러오기 성공");
		   		System.out.println(resultPlace.getP_no());
		   		System.out.println(resultPlace.getP_name());
		   		System.out.println(resultPlace.getP_info());
		   		System.out.println(resultPlace.getP_lati());
		   		System.out.println(resultPlace.getP_long());
		   		
		   		
		   		System.out.println(resultPlace.getP_region());
		   		System.out.println(resultPlace.getP_type());
		   		
		   	

				
				  RequestDispatcher rd = request.getRequestDispatcher("detailPlace.jsp");
				  request.setAttribute("detailPlace", resultPlace);
				  rd.forward(request,response);
				 
		   	
		   	}
		   	else{
		   		System.out.println("불러오기 실패");
		   	}
		 
	}

}
