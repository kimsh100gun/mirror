<%@page import="java.util.List"%>
<%@page import="com.mirror.domain.replyDAO"%>
<%@page import="com.mirror.domain.replyVO"%>
<%@page import="com.mirror.domain.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--
   Strongly Typed by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
   <head>
      <title>나의 댓글 목록</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="assets/css/main.css" />
   </head>
   <body class="no-sidebar is-preload">
   <% 
   
      memberVO loginMember=(memberVO)session.getAttribute("loginMember");
      String m_no=loginMember.getM_no();
         
      replyVO myreply = new replyVO(m_no);
      replyDAO dao = new replyDAO();
      List<replyVO> myreplies = null;
      myreplies= dao.selectReplyByOne(myreply);
      
      if(myreplies != null){
         System.out.println("사용자의 댓글 불러오기 성공");
         
         
      }
      else{
         System.out.println("사용자의 댓글 불러오기 실패");
      }
      
      pageContext.setAttribute("myreplies", myreplies);
   
   %>
      <div id="page-wrapper">

         <!-- Header -->
         <%@ include file="Header.jsp" %>
         <!-- Main -->
            <section id="main">
               <div class="container">
                  <div id="content">

                     <!-- Post -->
                        <article class="box post">
                           <header>
                              <h2>나의 댓글 관리</h2>
                           </header>
                           
                        
                           
            <table border="1">
            <tr>
               <th style="text-align: center">사진</th>
               <th style="text-align: center">댓글 내용</th>
               <th style="text-align: center">댓글 작성일</th>
               <th style="text-align: center" colspan="3">기능</th>
               
            </tr>
               <tr>
            <c:forEach var="myreplies" items="${pageScope.myreplies}">
            
         <tr>
         <td align="center"><img width="200px" height="150px" src="<c:url value='images/${myreplies.p_no}.jpeg'/>"></td>
          
            <td>${myreplies.r_con}</td>
            <td>${myreplies.r_date}</td>
            
            
            
         
      
<td><a href="<c:url value='detailPlaceCon?no=${myreplies.p_no}'/>"><div><button id="reply_btn">보러가기</button></div></a></td>   
<td><a href="<c:url value='updateReply.jsp?no=${myreplies.r_no}'/>"><div><button id="reply_btn">수정</button></div></a></td>
<td><a href="<c:url value='deleteReplyCon?no=${myreplies.r_no}&p_no=${myreplies.p_no}&return_page=m'/>"><div><button id="reply_btn">삭제</button></div></a></td>      






</tr>

</c:forEach>   
               
               
               
               
               
               
               
               
               </tr>
                           
                           
                           
                           </table>
                        </article>

                  </div>
               </div>
            </section>

         <!-- Footer -->
            
                  
               <%@ include file="Footer.jsp" %>
            

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