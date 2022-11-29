<%@page import="com.mirror.domain.replyDAO"%>
<%@page import="com.mirror.domain.replyVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype HTML>
<head>
	<meta charset="UTF-8">
	<title>댓글 수정 페이지</title>
	<link rel="stylesheet" href="style.css">
	<script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="assets/css/joinandlogin.css" />
	<style>
	 
	</style>
</head>
<body>



<% 
	
	String r_no = request.getParameter("no");
	replyVO selectReply = new replyVO(r_no);
	replyDAO dao = new replyDAO();
	
	selectReply=dao.selectReplyByr_no(selectReply);
	
	pageContext.setAttribute("selectReply", selectReply);
	
%>
		<div class="main-container">
				<div class="main-wrap">
					
					<header>
					<div class="logo-wrap">
					<a href="Main.jsp">
					<img src="images/logo2.jpeg">
					</a>
					</div>
					
					</header>
					
					<section>
					

					<div class="replytable">

						<div class="replytable2">
						<% 
						
						String return_page = request.getParameter("return_page");
						%>
							<table id="replytable">
									<form action="replyUpdateCon?return_page=<%=return_page%>" method="post">
										<div class="reply_table">
										
											<input type="hidden" name="r_no" value="${pageScope.selectReply.r_no}">
											<input type="hidden" name="m_no" value="${pageScope.selectReply.m_no}">
											<input type="hidden" name="p_no" value="${pageScope.selectReply.p_no}"> 
											<tr>
											
												<th><h1 id="up">수정할 내용을 입력하세요.</h1></th>
											</tr>
											
											<tr>
											<td><textarea name="reply_content"  placeholder="${pageScope.selectReply.r_con}" style="width: 709px;height: 204px;resize: none;" required></textarea></td>
												</tr>
												
												<tr>
												<td style="text-align: center";><input type="submit" value="댓글수정" id ="btnup" class="form-button-submit button icon solid fa-envelope"></td>
										</tr>
										
										</div>
									</form>
							</table>
						</div>
					</div>

					</section>
					</div>
					</div>
					 <!-- Scripts -->
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/jquery.dropotron.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>
	

</body>
</html>
