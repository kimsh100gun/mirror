<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype HTML>
<head>
	<meta charset="UTF-8">
	<title>로그인 페이지</title>
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
			
			<h1 align="center" id="up">회원정보 수정</h1>
		</header>
		<form action="UpdateCon" method="post">
		<section class="login-input-section-wrap">
			<div class="login-input-wrap">	
				<input placeholder="변경하실 비밀번호를 입력하세요." type="password" name="pw" required></input>
			</div>
			<div class="login-input-wrap password-wrap">	
				<input placeholder="변경하실 닉네임을 입력하세요." type="text" name="nick" required></input>
			</div>
			<br><br>
			<div class="login-button-wrap">
				<input type="submit" value="정보수정"><a href="Main.jsp"><input type="button" value="돌아가기"></a>
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
