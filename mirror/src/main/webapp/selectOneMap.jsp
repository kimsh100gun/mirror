<%@page import="java.util.List"%>
<%@page import="com.mirror.domain.loveDAO"%>
<%@page import="com.mirror.domain.placeLoveVO"%>
<%@page import="com.mirror.domain.memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
 <head>
      <title>세부 찜 장소 지도로 보기</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="assets/css/main.css" />
   </head>
<body>
    <%@ include file="Header.jsp"%>
    
    <%
       memberVO loginMember = (memberVO)session.getAttribute("loginMember");
       placeLoveVO like = (placeLoveVO)request.getAttribute("like");
       
       loveDAO dao = new loveDAO();
       List<placeLoveVO> myLove = null;
       myLove = dao.selectPlaceLove(loginMember); 
      
       double p_lati = Double.parseDouble(request.getParameter("lati"));
       double p_long = Double.parseDouble(request.getParameter("long"));
       String p_name = request.getParameter("name");
      
       
       
       out.print(p_name);
   %> 
   
    <div align="center">
      <h1><%=loginMember.getM_nick() %>님이 찜한 곳입니다.</h1>
       <div id="map" style="width:100%;height:100vh;" align="center"></div>
       <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4ce7780b8c5de704882cefc7cf5b72b3&libraries=clusterer"></script>
       <script>
         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = { 
              center: new kakao.maps.LatLng(
                    <%=p_lati%>, 
                    <%=p_long%>
              ), // 지도의 중심좌표
              level: 3 // 지도의 확대 레벨
          };
         
         // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
         var map = new kakao.maps.Map(mapContainer, mapOption); 
         
         // 마커가 표시될 위치입니다 
         var markerPosition  = new kakao.maps.LatLng(<%=p_lati%>, <%=p_long%>); 

         // 마커를 생성합니다
         var marker = new kakao.maps.Marker({
             position: markerPosition
         });

         // 마커가 지도 위에 표시되도록 설정합니다
         marker.setMap(map);
         
         var iwContent = '<div style="padding:5px;"><%=p_name%> <br> <a href="https://map.kakao.com/link/to/<%=p_name%>,<%=p_lati%>,<%=p_long%>" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
          iwPosition = new kakao.maps.LatLng(<%=p_lati%>,<%=p_long%>); //인포윈도우 표시 위치입니다

      // 인포윈도우를 생성합니다
      var infowindow = new kakao.maps.InfoWindow({
          position : iwPosition, 
          content : iwContent 
      });
        
      // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
      infowindow.open(map, marker); 
         
      
      </script>
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