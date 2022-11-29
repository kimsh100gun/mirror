<%@page import="com.mirror.domain.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype HTML>
<head>
   <meta charset="UTF-8">
   <title>회원가입 페이지</title>
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
       <!-- 사용자가 정보를 입력한 뒤 회원가입 버튼을 누르면 JoinCon으로 넘어간다. 넘어가는 방식은 post 방식이다. -->
      <form action="JoinCon" method="post" name="dark">
      <section class="login-input-section-wrap">
         <div class="login-input-wrap">   
         <!-- 아이디를 입력한다. 공백으로 남긴 뒤, 회원가입 버튼을 누르면 입력하라는 메세지가 뜬다.(required기능) -->
            <input placeholder="아이디" type="text" name="id" required></input>
            </div>
         
         <div class="login-input-wrap password-wrap">  
         <!-- 비밀번호를 입력한다. 공백으로 남긴 뒤, 회원가입 버튼을 누르면 입력하라는 메세지가 뜬다.(required기능) --> 
            <input placeholder="비밀번호" type="password" name="pw" required></input>
         </div>
         
         
         <div class="login-input-wrap password-wrap">   
         <!-- 닉네임을 입력한다. 공백으로 남긴 뒤, 회원가입 버튼을 누르면 입력하라는 메세지가 뜬다.(required기능) -->
            <input placeholder="닉네임" type="text" name="nick" required></input>
         </div>
         <br>
         <div class="login-button-wrap">
         <!-- 회원가입 버튼과 main페이지로 돌아가는 돌아가기 버튼 -->
            <input type="submit" value="회원가입"><a href="Main.jsp"><input type="button" value="돌아가기"></a>
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