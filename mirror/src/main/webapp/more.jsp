<%@page import="com.mirror.domain.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      <title>더보기</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="homepage is-preload">
   
 <div id="page-wrapper">
         
         <!-- Header -->
            <%@include file="Header.jsp" %>
            <table id="more">
               <tr>
                  <td align="center">
                     <br><div><a href="MapHistoryC.jsp"><button id="his_btn" >역사적 장소 전체 지도</button></a></div>
                     <br>
                      <br>
                       <br>
                     <a  href="https://www.koreanhistory.or.kr/"><img src="images\hsite1.png" id="morea" ></a>
                     <a href="https://db.history.go.kr/"><img src="images\hsite2.png" height="92.99" width="257" id="morea" ></a>
                     <a href="http://contents.history.go.kr/"><img src="images\hsite3.png" height="92.99" width="257" id="morea" ></a>
                     <a  href="http://contents.nahf.or.kr/"><img src="images\hsite4.png" height="92.99" width="257" id="morea" ></a><br><br>
                     <a  href="http://yellow.kr/"><img src="images\hsite5.png" height="92.99" width="257" id="morea" ></a>
                     <a  href="http://www.koreanhistory.org/"><img src="images\hsite6.png" height="92.99" width="257" id="morea" ></a>
                     <a href="https://www.history.go.kr/"><img src="images\hsite7.png" height="92.99" width="257" id="morea" ></a>
                     <a href="http://encykorea.aks.ac.kr/"><img src="images\hsite8.png" height="92.99" width="257" id="morea" ></a><br><br>
                     <a  href="https://sillok.history.go.kr/"><img src="images\hsite9.png" height="92.99" width="257" id="morea" ></a>
                     <a  href="https://program.kbs.co.kr/1tv/culture/theday/pc/index.html"><img src="images\hsite10.png" height="92.99" width="257" id="morea" ></a>
                     <a  href="http://histopia.net/"><img src="images\hsite11.png" height="92.99" width="257" id="morea" ></a>
                     <a  href="https://www.jejudarktours.org/"><img src="images\hsite12.png" height="92.99" width="257" id="morea" ></a>
                     
                  </td>
               </tr>
            </table>
            <%@include file="Footer.jsp" %>
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
            