<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link rel="stylesheet" href="assets/css/main.css" />

</head>
<body>
   <section id="header">
      <div class="container">
         <!-- Logo -->
         <h1 id="logo">
            <a href="Main.jsp" ><img width=400 height=160  src="images\logo.jpeg"></a>
         </h1>
         

         <!-- Nav -->
         <nav id="nav">
            <c:choose>
               <c:when test="${empty loginMember}">
                  <ul>
                     <li><a class="icon solid fa-home" href="webinfo.jsp"><span>소개</span></a></li>
                     <li><a class="icon solid fa-cog" href="more.jsp"><span>더보기</span></a></li>
                     <li><a class="icon solid fa-retweet"
                        href="login.jsp"><span>로그인</span></a></li>
                     <li><a class="icon solid fa-sitemap" href="join.jsp"><span>회원가입</span></a></li>
                  </ul>
               </c:when>
               <c:otherwise>
               <h4>${loginMember.m_nick}님 환영합니다.</h4>
               <ul>
                  <li><a class="icon solid fa-home" href="webinfo.jsp"><span>소개</span></a></li>
                  <li><a class="icon solid fa-cog" href="more.jsp"><span>더보기</span></a></li>
                  <li><a href="mypage.jsp" class="icon fa-chart-bar"><span>마이페이지</span></a>
                     <ul>
                        <li><a href="myreplyRist.jsp?viewPage=1">댓글관리</a>
                            
                        </li>
                        <li><a href="loveList.jsp?viewPage=1">찜한 곳 확인 및 길찾기</a>
                           
                        </li>
                        <li><a href="update.jsp">회원정보 수정</a></li>
                        <li><a href="delete.jsp">회원탈퇴</a></li>
                        
                     </ul>
                  </li>
                  <li><a class="icon solid fa-cog" href="LogoutCon"><span>로그아웃</span></a></li>
                  </ul>
               </c:otherwise>
            </c:choose>
         </nav>

      </div>
   </section>
    <!-- Scripts -->
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/jquery.dropotron.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>
   
   
</body>
</html>