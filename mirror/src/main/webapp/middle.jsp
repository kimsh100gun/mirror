<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>banner</title>
<link rel="stylesheet" href="assets/css/main.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
   <section id="middle">
   
  <div class="container">
    <div class="album">
    <div clas="slidephoto fade">
      <ul class="mimages">
        <!--원하는 이미지 주소값을 입력해주세요-->
       <img id="slide" src="images/img_middle01.jpeg" alt="slidephoto1">
       <img id="slide" src="images/img_middle02.jpeg" alt="slidephoto2">
       <img id="slide" src="images/img_middle01.jpeg" alt="slidephoto3">
       <img id="slide" src="images/img_middle02.jpeg" alt="slidephoto4">
   </ul> 
        <!--슬라이드에 넣길 원하는 이미지 수만큼 img 코드를 추가해주세요-->
      
      </div>
      </div>
    </div>
 
</section>


<script>

var current= 0;
imgDuration= 3000;

showSlides();

function showSlides() {
	var slidephoto = document.querySelectorAll("#slide");
	
	for(let i=0; i <slidephoto.length; i++){
		slidephoto[i].style.display="none";
	}
	current++;
	
	if(current > slidephoto.length)
		current = 1;
	
	slidephoto[current -1].style.display="block";
	
	setTimeout(showSlides, imgDuration);
}




</script>
</body>
</html>