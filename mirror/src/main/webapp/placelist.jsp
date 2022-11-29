<%@page import="com.mirror.domain.placeDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.mirror.domain.placeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>장소 목록 갤러리</title>
</head>

<body>
<%@ include file="Header.jsp" %>


<% 
response.setContentType("text/html; charset=utf-8");
List<placeVO> placeList = (List<placeVO>)request.getAttribute("placeList");

String p_region = request.getParameter("p_region");
String p_type = request.getParameter("p_type");
int viewPage= Integer.parseInt(request.getParameter("viewPage"));
System.out.println("viewPage : " + viewPage);
placeDAO dao = new placeDAO();
placeVO place = new placeVO(p_region, p_type);
int total = dao.selectTotalN(place); // 전체 게시물 개수

int needPage = (int)Math.ceil((double)total/12);//필요한 게시물 개수 







List<placeVO> result = null;
   int endNum =12 * viewPage;
   int startNum = endNum -11;
   
   System.out.println("총 게시물 개수  :::" +total); // 총 게시물 개수
   System.out.println("필요한 페이지수   :::" +needPage); // 필요한 페이지수 
   System.out.println("한 페이지에 끝나는 게시물  :::" +endNum); // 한 페이지에 끝나는 게시물
   System.out.println("한 페이지에 시작되는 게시물 수  :::" +startNum); // 한 페이지에 시작되는 게시물 수 
   
   
   placeVO vo = new placeVO(p_region, p_type, startNum, endNum);
   result = dao.selectResult(vo);
   
   if(result != null){
      System.out.println("스탈 엔드 숫자 가져와서 vo에 넣음");
   }
   else{
      System.out.println("스탈 엔드 숫자 가져와서 vo에 넣지 못함");
   }
   request.setAttribute("resultList", result);

%>

<c:set var="i" value="0" />
   <c:set var="j" value="4" />
   <section id="placelist">

    <div class="container">
     <c:forEach items="${requestScope.resultList}" var="list" >
       <c:if test="${i%j == 0}">
        <div class="row">
       </c:if>
        <div class="col-3">
                <div class="card">
           
                    <img class="card-img-top" width="300" height="200" src="<c:url value='/images/${list.p_no}.jpeg' />" />
                        
                    <div class="card-body" align="center">
                        <button><a id="listname" href="<c:url value='detailPlaceCon?no=${list.p_no}'/>">${list.p_name}</a></button>
                    </div>
                  
                </div>
            </div>
       <c:if test="${i%j == j-1}">
       </div>
       </c:if>
       <c:set var="i" value="${i+1}" />
     </c:forEach>
   </div>
</section>




<div style="width:100%; margin-top:5px; text-align:center;"> 

   <% for(int k =1 ; k <= needPage; k++){%>
   <a href="placeSelectCon?p_type=<%=p_type%>&p_region=<%=p_region%>&viewPage=<%=k%>"><%=k%></a> | 
<% }%>
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