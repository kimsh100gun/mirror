<%@page import="com.mirror.domain.placeLoveVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mirror.domain.loveVO"%>
<%@page import="com.mirror.domain.loveDAO"%>
<%@page import="com.mirror.domain.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
   memberVO loginMember = (memberVO)session.getAttribute("loginMember");
   loveDAO dao = new loveDAO();
   List<placeLoveVO> myLove = null;
   myLove = dao.selectPlaceLove(loginMember);

   if (myLove != null) {
      System.out.println("불러오기 성공");
      pageContext.setAttribute("myLove", myLove);

   }
   %>


   <!-- 댓글 보이는 곳 -->
   <div id="page-wrapper">

      <!-- Header -->
      <%@ include file="Header.jsp"%>
      <!-- Main -->
      <section id="main">
         <div class="container">
            <div id="content">

               <!-- Post -->
               <article class="box post">
                  <header>
                     <h2 align="center"><%=loginMember.getM_nick()%>님의 찜한 곳 확인하기
                     </h2>
                  </header>
                  
                  

                  <div align="center">
                     
                  </div>
                  <br>
                  <br>
                  <br>
                  <table border="1">
                     <tr>
                        <th style="text-align: center">장소 사진</th>
                        <th style="text-align: center">장소명</th>
                        <th style="text-align: center">지역</th>
                        <th style="text-align: center">구분</th>
                        <th style="text-align: center">게시물보기</th>
                        <th style="text-align: center">지도로 보기</th>
                        <th style="text-align: center">장소 삭제</th>
                     </tr>
                     <tr>
                        <c:forEach var="myLove" items="${pageScope.myLove}">
                           <tr>
                              <td><img width="200px" height="150px" src="<c:url value='images/${myLove.p_no}.jpeg'/>"></td>
                              <td>${myLove.p_name}</td>
                           <!-- <td>${myLove.p_region}</td> -->   
                           
                              <c:if test="${myLove.p_region eq '1'}">
                                 <td>전라남도</td>
                              </c:if>
                              
                              <c:if test="${myLove.p_region eq '2'}">
                                 <td>전라북도</td>
                              </c:if>
                              <c:if test="${myLove.p_region eq '3'}">
                                 <td>경상남도</td>
                              </c:if>
                              <c:if test="${myLove.p_region eq '4'}">
                                 <td>경상북도</td>
                              </c:if>
                              <c:if test="${myLove.p_region eq '5'}">
                                 <td>충청남도 및 세종</td>
                              </c:if>
                              <c:if test="${myLove.p_region eq '6'}">
                                 <td>충청북도</td>
                              </c:if>
                              <c:if test="${myLove.p_region eq '7'}">
                                 <td>강원도</td>
                              </c:if>
                              <c:if test="${myLove.p_region eq '8'}">
                                 <td>제주</td>
                              </c:if>
                              <c:if test="${myLove.p_region eq '9'}">
                                 <td>경기</td>
                              </c:if>
                              <c:if test="${myLove.p_region eq '10'}">
                                 <td>서울</td>
                              </c:if>
                              <c:if test="${myLove.p_region eq '11'}">
                                 <td>부산</td>
                              </c:if>
                              <c:if test="${myLove.p_region eq '12'}">
                                 <td>대구</td>
                              </c:if>
                              <c:if test="${myLove.p_region eq '13'}">
                                 <td>인천</td>
                              </c:if>
                              <c:if test="${myLove.p_region eq '14'}">
                                 <td>대전</td>
                              </c:if>
                              <c:if test="${myLove.p_region eq '15'}">
                                 <td>광주</td>
                              </c:if>
                              <c:if test="${myLove.p_region eq '16'}">
                                 <td>울산</td>
                              </c:if>
                              
                              
                              
                              
                              
                              <c:if test="${myLove.p_type eq 't'}">
                                 <td>여행지</td>
                              </c:if>
                              <c:if test="${myLove.p_type eq 'h'}">
                                 <td>역사적 장소</td>
                              </c:if>
                              <c:if test="${myLove.p_type eq 'f'}">
                                 <td>음식점</td>
                              </c:if>
                           
                              <td><a
                                 href="<c:url value='detailPlaceCon?no=${myLove.p_no}'/>"><button
                                       id="reply_btn" >게시물 보기</button></a></td>
                              <td><a
                                 href="<c:url value='selectOneMap.jsp?lati=${myLove.p_lati}&long=${myLove.p_long}&name=${myLove.p_name}' />"><button
                                       id="reply_btn">지도</button></a></td>
                              <td><a
                                 href="<c:url value='deleteLoveCon?m_no=${myLove.m_no}&p_no=${myLove.p_no}&page=m' />"><button
                                       id="reply_btn">삭제</button></a></td>
                           </tr>
                        </c:forEach>
                     </tr>
                  </table>
               </article>

            </div>
         </div>
      </section>
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