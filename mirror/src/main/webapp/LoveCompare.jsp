<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.mirror.domain.loveDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>지역별 찜 개수 비교</title>
<link rel="stylesheet" href="assets/css/main.css" />

<style>
.zt-skill-bar {
	color: #fff;
	font-size: 1em;
	line-height: 2em;
	height: 2em;
	margin-bottom: 1em;
	background-color:;
	-webkit-border-radius: 0.1em;
	-moz-border-radius: 0.1em;
	-ms-border-radius: 0.1em;
	border-radius: 0.1em;
}

.zt-skill-bar * {
	webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-ms-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
}

.zt-skill-bar div {
	background-color: #357451;
	position: relative;
	padding-left: 2em;
	width: 20%;
	-webkit-border-radius: 0.1em;
	-moz-border-radius: 0.1em;
	-ms- border-radius: 0.1em;
	border-radius: 0.1em;
}

.zt-skill-bar span {
	display: block;
	position: absolute;
	right: 0;
	top: 0;
	height: 100%;
	padding: 0 5px 0 10px;
	background-color: #1a1a1a;
	-webkit-border-radius: 0 2px 2px 0;
	-moz-border-radius: 0 2px 2px 0;
	-ms-border-radius: 0 2px 2px 0;
	border-radius: 0 2px 2px 0;
}

.zt-skill-bar span:before {
	content: "";
	position: absolute;
	width: 6px;
	height: 10px;
	top: 50%;
	left: -3px;
	margin-top: -3px;
	background-color: #1a1a1a;
	-webkit-transform: rotate(45deg);
	-moz-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	transform: rotate(45deg);
}
</style>

</head>
<body>
<!-- Header -->
	<%@ include file="Header.jsp"%>
	
	<%
	loveDAO dao = new loveDAO();
	
	List<Integer> regionLove = new ArrayList<Integer>(); //지역별 좋아요 개수를 List형태로 담기 위한 regionLove
	
	int regionTotalLove = 0; // 지역별 총 좋아요 regionTotalLove
	
	for (int i = 1; i <= 16; i++) {
		int regionResult = dao.regionTotalLove(i); // 1부터 16까지 반복문 돌려서 정수에 해당되는 지역의 좋아요를 regionResult에 담는다.
		regionTotalLove += regionResult; // 개별 지역의 좋아요를 regionTotalLove에 더해준다.

		regionLove.add(regionResult);  // 지역별 좋아요 개수가 List형태로 되어 있는 regionLove에 순서에 맞게 추가한다.
	}

	System.out.println("전체 찜 개수" + regionTotalLove); // for문을 다 돌고 나와서 전체 찜 개수를 확인하기 위함.
	%>
	
	<div class="zt-span6 last">
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<h3 align="center">
			<strong>찜 개수 지역별 비교</strong>
		</h3>
		<!-- 해당 지역 찜 개수/전체 찜 개수  * 100을 해서 퍼센트를 보여준다. ->100만 곱하니, 보여지는 그래프가 너무 짧아서 200을 곱했다.-->
		<div class="zt-skill-bar">
			<div
				data-width="<%=(double) regionLove.get(0) / regionTotalLove * 200%>"
				style="">
				전라남도<span><%=regionLove.get(0)%>개</span>
			</div>
		</div>
		<div class="zt-skill-bar">
			<div
				data-width="<%=(double) regionLove.get(1) / regionTotalLove * 200%>"
				style="">
				전라북도<span><%=regionLove.get(1)%>개</span>
			</div>
		</div>
		<div class="zt-skill-bar">
			<div
				data-width="<%=(double) regionLove.get(2) / regionTotalLove * 200%>"
				style="">
				경상남도<span><%=regionLove.get(2)%>개</span>
			</div>
		</div>
		<div class="zt-skill-bar">
			<div
				data-width="<%=(double) regionLove.get(3) / regionTotalLove * 200%>"
				style="">
				경상북도<span><%=regionLove.get(3)%>개</span>
			</div>
		</div>
		<div class="zt-skill-bar">
			<div
				data-width="<%=(double) regionLove.get(4) / regionTotalLove * 200%>"
				style="">
				충청남도 및 세종<span><%=regionLove.get(4)%>개</span>
			</div>
		</div>
		<div class="zt-skill-bar">
			<div
				data-width="<%=(double) regionLove.get(5) / regionTotalLove * 200%>"
				style="">
				충청북도<span><%=regionLove.get(5)%>개</span>
			</div>
		</div>
		<div class="zt-skill-bar">
			<div
				data-width="<%=(double) regionLove.get(6) / regionTotalLove * 200%>"
				style="">
				강원도<span><%=regionLove.get(6)%>개</span>
			</div>
		</div>
		<div class="zt-skill-bar">
			<div
				data-width="<%=(double) regionLove.get(7) / regionTotalLove * 200%>"
				style="">
				제주<span><%=regionLove.get(7)%>개</span>
			</div>
		</div>
		<div class="zt-skill-bar">
			<div
				data-width="<%=(double) regionLove.get(8) / regionTotalLove * 200%>"
				style="">
				경기<span><%=regionLove.get(8)%>개</span>
			</div>
		</div>
		<div class="zt-skill-bar">
			<div
				data-width="<%=(double) regionLove.get(9) / regionTotalLove * 200%>"
				style="">
				서울<span><%=regionLove.get(9)%>개</span>
			</div>
		</div>
		<div class="zt-skill-bar">
			<div
				data-width="<%=(double) regionLove.get(10) / regionTotalLove * 200%>"
				style="">
				부산<span><%=regionLove.get(10)%>개</span>
			</div>
		</div>
		<div class="zt-skill-bar">
			<div
				data-width="<%=(double) regionLove.get(11) / regionTotalLove * 200%>"
				style="">
				대구<span><%=regionLove.get(11)%>개</span>
			</div>
		</div>
		<div class="zt-skill-bar">
			<div
				data-width="<%=(double) regionLove.get(12) / regionTotalLove * 200%>"
				style="">
				인천<span><%=regionLove.get(12)%>개</span>
			</div>
		</div>
		<div class="zt-skill-bar">
			<div
				data-width="<%=(double) regionLove.get(13) / regionTotalLove * 200%>"
				style="">
				대전<span><%=regionLove.get(13)%>개</span>
			</div>
		</div>
		<div class="zt-skill-bar">
			<div
				data-width="<%=(double) regionLove.get(14) / regionTotalLove * 200%>"
				style="">
				광주<span><%=regionLove.get(14)%>개</span>
			</div>
		</div>
		<div class="zt-skill-bar">
			<div
				data-width="<%=(double) regionLove.get(15) / regionTotalLove * 200%>"
				style="">
				울산<span><%=regionLove.get(15)%>개</span>
			</div>
		</div>


	</div>





<script src="https://code.jquery.com/jquery-3.6.1.js"
		integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
		crossorigin="anonymous"></script>
		<!-- 찜 개수에 따라 길이 조절 및 효과를 보여주기 위한 코드 -->
	<script>
		(function($) {
			"use strict";
			$(function() {
				function animated_contents() {
					$(".zt-skill-bar > div ").each(function(i) {
						var $this = $(this), skills = $this.data('width');

						$this.css({
							'width' : skills + '%'
						});

					});
				}

				if (jQuery().appear) {
					$('.zt-skill-bar').appear().on('appear', function() {
						animated_contents();
					});
				} else {
					animated_contents();
				}
			});
		}(jQuery));
	</script> 
	
<!-- Footer -->
	<%@ include file="Footer.jsp"%>
 <!-- Scripts -->
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/jquery.dropotron.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>
</body>
</html>