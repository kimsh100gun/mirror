<%@page import="com.mirror.domain.loveVO"%>
<%@page import="com.mirror.domain.loveDAO"%>
<%@page import="com.mirror.domain.memberVO"%>
<%@page import="com.mirror.domain.replyVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mirror.domain.replyDAO"%>
<%@page import="com.mirror.domain.placeVO"%>
<%@page import="com.mirror.domain.placeDAO"%>

<!-- EL식과 JSTL이 사용된다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>상세 장소 페이지</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="webapp/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>

<body class="right-sidebar is-preload">

	<div id="page-wrapper">

		<!-- Header -->
		<%@include file="Header.jsp"%>

		<%
		/* request에 담긴 상세 장소 정보를 가져와서 detailPlace에 담았다. */
		placeVO detailPlace = (placeVO)request.getAttribute("detailPlace");
		
		/* session에 담긴 로그인한 회원의 정보를 loginMember에 담았다. */
		memberVO loginMember = (memberVO)session.getAttribute("loginMember");
		
		
		replyDAO dao = new replyDAO(); // 댓글DAO
		loveDAO dao2 = new loveDAO(); // 찜DAO

		String p_no = detailPlace.getP_no(); // 상세 장소 정보의 고유 번호
		
		
		if (loginMember != null) { // 로그인이 되어있는 상태라면,

			loveVO testLove = new loveVO(loginMember.getM_no(), detailPlace.getP_no()); // 로그인회원의 고유 번호와 세부장소의 고유번호를 testLove에 담았다.
			testLove = dao2.selectLove(testLove); // 해당 회원이 이 장소를 찜했는지 안했는지 확인함
			pageContext.setAttribute("testLove", testLove); // 이 정보를 pageScope에 testLove라는 이름으로 담았다.
		}

		String totalLove = dao2.totalLove(p_no); // 로그인 유저들이 이 장소를 찜한 총 횟수를 가져와서 totalLove에 담았다.
		

		replyVO selectReply = new replyVO(detailPlace.getP_no());
		List<replyVO> ls = dao.selectReply(selectReply); // 이 장소의 고유 번호를 담아서 달려있는 모든 댓글들을 List형태의 ls에 담았다.

		pageContext.setAttribute("ls", ls); // 총 댓글 List를 pageScope에 넣었다.
		%>


		<!-- Main -->


		<section id="main">
		<div class="container">
			<div class="row">

				<!-- 좌표가 찍힌 지도 -->
				<div id="content" class="col-8 col-12-medium">
					<div id="map" style="width: 700px; height: 400px;"></div>

						<!-- 지도를 보이기 위해 카카오지도 API에서 발급받은 key번호를 넣었다.ㄴ -->
					<script type="text/javascript" 
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4ce7780b8c5de704882cefc7cf5b72b3"></script>
						
					<script>
						var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
						var options = { //지도를 생성할 때 필요한 기본 옵션
							center : new kakao.maps.LatLng( <%=detailPlace.getP_lati()%>, <%=detailPlace.getP_long()%>
						), //지도의 중심좌표에 해당 장소의 위도 경도값을 받아서 넣어줬다.
							level : 3 //지도의 레벨(확대, 축소 정도)
						};
						var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
						var marker = new kakao.maps.Marker({
							position : map.getCenter()
						});
						marker.setMap(map);
					</script>
					
					
					<br>
							<!-- 해당 장소의  로드맵-->
					<div id="roadview" style="width: 700px; height: 400px;"></div>

					
					<script>
						var roadviewContainer = document
								.getElementById('roadview'); //로드뷰를 표시할 div
						var roadview = new kakao.maps.Roadview(
								roadviewContainer); //로드뷰 객체
						var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

						var position = new kakao.maps.LatLng(
					<%=detailPlace.getP_lati()%> // 해당 장소의 위도 경도값을 받아서 넣어줬다.
						,
					<%=detailPlace.getP_long()%>
						);

						// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
						roadviewClient.getNearestPanoId(position, 50, function(
								panoId) {
							roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
						});
					</script>

				</div>

				<!-- Sidebar -->
				<div id="sidebar" class="col-4 col-12-medium">

					<!-- Excerpts -->
					<section>
					<ul class="divided">
						<!-- 해당 장소의 이미지를 JSTL를 이용하여 출력했다. -->
						<li><span class="image featured"><img width="400"
								height="400"
								src="<c:url value='/images/${requestScope.detailPlace.p_no}.jpeg' />"></span>
							<!-- Excerpt --> <article class="box excerpt"> <header>
							<h3><!-- 해당 장소의 이름 -->
								🌺<strong><%=detailPlace.getP_name()%></strong>🌺
							</h3>
							</header>
							<p><!-- 해당 장소의 소개글 -->
								<%=detailPlace.getP_info()%>
							</p>
							</article></li>
					</ul>
					</section>
				</div>

			</div>


			<br> <br> <br> <br>


			<div class="row">
				<div class="col-6 col-12-medium">
					<section>

					<div class="row gtr-50">

						<div class="col-12">
							<c:choose>
							
								<c:when test="${empty loginMember}">
									<div class="col-12">
										<table>
											<tr>
												<td><textarea
														placeholder="로그인을 하시면 댓글과 좋아요기능을 사용하실 수 있습니다."
														style="width: 678px; height: 90px; resize: none;"></textarea></td>
												<td><a href="login.jsp" id="reply_btn"
													class="form-button-submit button icon solid fa-envelope">로그인</a></td>
													
												<td><a href="login.jsp" class="like_image"><img
														src="images/default.png" alt="" /><%=totalLove%></a></td>
											</tr>
										</table>
									</div>
								</c:when>
								<c:otherwise>
							
									<div class="col-12">
										<table width="1000px" height="300px">
											<form action="replyInsertCon" method="post">
												<tr>
													<td>
													
													<input type="hidden" name="memberM_no"
														value="${loginMember.m_no}" /> <input type="hidden"
														name="placeP_no" value="${requestScope.detailPlace.p_no}" />
														
														<textarea name="reply_content" placeholder="댓글을 작성해보세요."
															style="width: 684px; height: 212px; resize: none;"
															required></textarea></td>
															
															

															
													<td><input type="submit" id="reply_btn" value="댓글달기"
														class="form-button-submit button icon solid fa-envelope"></td>
														
														
														
													<c:if test="${empty pageScope.testLove}">
														<td>
														<a
															href="loveInsertCon?memberM_no=${loginMember.m_no}&placeP_no=${requestScope.detailPlace.p_no}&page=d"
															class="like_image"><img src="images/default.png" /><%=totalLove%></a></td>
													</c:if>
														
													<c:if test="${!empty pageScope.testLove}">
														<td>
														
														<a
															href="deleteLoveCon?m_no=${loginMember.m_no}&p_no=${requestScope.detailPlace.p_no}&page=d"
															class="like_image"><img src="images/like.png" alt="" /><%=totalLove%></a></td>
													</c:if>
											</form>


											<td><form action="loveInsertCon?page=d" method="post">
													<input type="hidden" name="memberM_no"
														value="${loginMember.m_no}"> <input type="hidden"
														name="placeP_no" value="${requestScope.detailPlace.p_no}" />
													<input type="submit" id="reply_btn" value="찜하기"
														class="form-button-submit button icon solid fa-envelope">
												</form></td>
											</tr>
										</table>
									</div>



									<div class="col-12"></div>

								</c:otherwise>
							</c:choose>

						</div>
					</div>

					</section>
				</div>




				<!-- 댓글 보이는 곳 -->

				<table border="1">
					<tr>
						<th style="text-align: center">댓글번호</th>
						<th style="text-align: center">닉네임</th>
						<th style="text-align: center">댓글내용</th>
						<th style="text-align: center">댓글작성일</th>
						<th style="text-align: center" colspan="2">비고</th>



					</tr>

					<c:forEach var="reply" items="${pageScope.ls}">

						<tr>
							<td>${reply.r_no}</td>
							<td>${reply.m_nick}</td>
							<td>${reply.r_con}</td>
							<td>${reply.r_date}</td>


							<c:if test="${loginMember.m_no eq reply.m_no}">
								<td><a
									href="<c:url value='updateReply.jsp?no=${reply.r_no}&return_page=d'/>"><button
											id="reply_btn">댓글 수정</button></a></td>
								<td><a
									href="<c:url value='deleteReplyCon?no=${reply.r_no}&p_no=${reply.p_no}&return_page=d'/>"><button
											id="reply_btn">댓글 삭제</button></a></td>
							</c:if>





						</tr>

					</c:forEach>

				</table>





			</div>

		</div>
		</section>

	</div>
	<!-- Footer -->
	<%@ include file="Footer.jsp"%>


	<!-- Scripts -->

	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	</body>
	</html>
	