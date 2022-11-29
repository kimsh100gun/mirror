<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<!-- 템플릿 저작권 
   Strongly Typed by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license) -->
   
<html>
  <head>
  	<title>메인 페이지</title>
  	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
  </head>
  <body class="homepage is-preload">

      <!--헤더-->
  <%@ include file="Header.jsp"%>

	  <!--검색 바-->
	<section id="features">
		<div id="sear_bar" style="justify-content:center; width:30%;height:80px;">
	 		<form action="placeSelectCon">
	 			<table id="search">
	 				<tr>
		 				<td>
		 					<select id="sc" name="p_region" style="text-align:center;">
								<option value="1">전라남도</option>
							    <option value="2">전라북도</option>
							    <option value="3">경상남도</option>
							    <option value="4">경상북도</option>
							    <option value="5">충청남도 및 세종</option>
							    <option value="6">충청북도</option>
							    <option value="7">강원도</option>
							    <option value="8">제주</option>
							    <option value="9">경기</option>
							    <option value="10">서울</option>
							    <option value="11">부산</option>
							    <option value="12">대구</option>
							    <option value="13">인천</option>
							    <option value="14">대전</option>
							    <option value="15">광주</option>
							    <option value="16">울산</option>
							</select>
						</td>

				        <td>
				        	<select id="sc" name="p_type" style="text-align:center;">
							    <option value="h">역사적 장소</option>
							    <option value="t">관광지</option>
							    <option value="f">지역 모범 음식점</option>
							</select>
						</td>
						<td><input id="search_btn" type="submit" value="검색"></td>
                    </tr>
                </table>
            </form> 
        </div>  
    </section>

	<!-- 검색 바 밑 메인 사진  -->
  <%@ include file="middle.jsp"%>

    <!-- Features -->
    <section id="features">
    	<div class="container">
        	<header>
            	<br><br><h2>다크투어리즘을 즐기는 방법 3가지!</h2>
            </header>
            <div class="row aln-center">
            	<div class="col-4 col-6-medium col-12-small">

                <!-- Feature -->
                  <section>
                     <a href="map.jsp?p_type=h" class="image featured"><img width="400" height="290" src="images\450.jpeg" alt=""  /></a>
               <header>
                <h3><a href="map.jsp?p_type=h"><strong>역사적 장소</strong></a></h3>
               </header>
                     <p id="ptag"><strong>역사적 또는 재해적으로 비극</strong>이 발생한 곳으로,<br> 이곳에서 역사적인 교훈을 얻을 수 있습니다.</p>
                  </section>
              </div>
              <div class="col-4 col-6-medium col-12-small">

                <!-- Feature -->
                  <section>
                     <a href="map.jsp?p_type=t" class="image featured"><img width="400" height="290"  src="images\94.jpeg" alt="" /></a>
                     <header>
                       <h3><a href="map.jsp?p_type=t"><strong>지역 관광지</strong></a></h3>
                     </header>
                     <p id="ptag"><strong>힐링과 즐거움의 공간</strong> <br>역사적 장소 주변에 구경할 곳을 엄선하였습니다.</p>
                  </section>

              </div>
              <div class="col-4 col-6-medium col-12-small">

                <!-- Feature -->
                  <section>
                     <a href="map.jsp?p_type=f" class="image featured"><img width="400" height="290"  src="images\798.jpeg" alt="" /></a>
                     <header>
                       <h3><a href="map.jsp?p_type=f"><strong>지역 모범음식점</strong></a></h3>
                     </header>
                     <p id="ptag"><strong>금강산도 식후경!</strong><br>이곳에서 여러분의 허기진 배를 달랠 수 있습니다.</p>
                  </section>

              </div>
              <div class="col-12">
                <ul class="actions">
                 
                </ul>
              </div> 
            </div>
        </div>
    </section>

       

        
   
          <!-- Footer -->
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