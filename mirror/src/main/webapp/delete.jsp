 <!-- 회원탈퇴 할 때 로그인한 사용자의 닉네임을 보여줄 때 EL식이 사용된다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    

<!doctype HTML>
<head>
	<meta charset="UTF-8">
	<title>회원탈퇴 페이지</title>
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="assets/css/joinandlogin.css" />
</head>
<body>
	<div class="main-container">
		<div class="main-wrap">
		<header>
			
			<div class="logo-wrap">
				<a href="Main.jsp"><img src="images/logo2.jpeg"></a>
			</div>
		</header>
		<!-- 회원의 닉네임이 보인다.  -->
		<h1 id="up" align="center">${loginMember.m_nick}님 <br>회원탈퇴를 원하시면 <br>비밀번호를 입력하세요.</h1>
		<!-- 회원이 정보를 다 입력하면 DeleteCon으로 post방식으로 넘어간다. -->
		<form action="DeleteCon" method="post">
		<section class="login-input-section-wrap">
			
			<div class="login-input-wrap password-wrap">	
			<!-- 회원의 비밀번호를 적는다. 공백으로 남기면 적으라는 문구가 뜬다. (required방식) -->
				<input placeholder="비밀번호" type="password" name="pw" required></input>
			</div>
			<br><br>
			<div class="login-button-wrap">
			<!-- 회원탈퇴 버튼과 main페이지로 돌아가는 버튼이있다. -->
				<input type="submit" value="회원탈퇴"><a href="Main.jsp"><input type="button" value="돌아가기"></a>
			</div>
		</section>
		</form>
		</div>
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