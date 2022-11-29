<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<!--
   Strongly Typed by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
   <head>
      <title>마이페이지</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="assets/css/main.css" />
   </head>
   <body class="homepage is-preload">

   
            <!-- Header -->
         
         
            <%@ include file="Header.jsp"%>
<div align="center">
	<a href="myreplyRist.jsp"><button id="reply_btn">댓글관리</button></a>
	<a href="loveList.jsp"><button id="reply_btn">찜한 곳 확인 및
			길찾기</button></a>
	<a href="update.jsp"><button id="reply_btn">회원정보 수정</button></a>
	<a href="delete.jsp"><button id="reply_btn">회원탈퇴</button></a>
	</div>
	<%@ include file="Footer.jsp" %>
	 <!-- Scripts -->
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/jquery.dropotron.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>
</body>
</html>	