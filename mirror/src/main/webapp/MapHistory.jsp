<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>maphistory</title>
</head>
<body>
	<div id="map" style="width:100%;height:100vh;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4ce7780b8c5de704882cefc7cf5b72b3&libraries=clusterer"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(36.321655, 127.378953), // 지도의 중심좌표
	        level: 13 // 지도의 확대 레벨
	    };

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		
		var data = [
			[38.51438609, 128.416703, '<div style="padding:5px;"><a href="detailPlace.jsp" style="color:blue" target="_blank">🌺고성통일전망대🌺</a></div>'],
			[33.55227103, 126.6797565, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🌺제주서우봉🌺</a></div>'],
			[36.71355735, 126.550384, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🌺해미읍성🌺</a></div>'],
			[37.63218481, 126.4895716, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🌺삼랑성🌺</a></div>'],
			[35.9909083687039, 129.560598463942, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🌺포항근대문화역사거리🌺</a></div>'],
			[33.4498255893617, 126.617747685632, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🌺제주 4·3평화공원🌺</a></div>'],
			[34.8763799837003, 128.625370494642, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🌺포로수용소유적공원🌺</a></div>'],
			[36.7438305963348, 129.468713303276, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">월송정🌺</a></div>'],
			[34.7876957778739, 126.381794178469, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🌺목포문화원🌺</a></div>'],
			[35.9823044239542, 126.707838363598, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🌺일제강점기 군사역사관🌺</a></div>'],
			[37.4874402401068, 126.71685875477, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🌺삼릉줄사택🌺</a></div>'],
			[34.762332572227, 127.750078488365, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🌺마래2터널🌺</a></div>'],
			[37.5746085138333, 126.955611774864, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🌺서대문형무소🌺</a></div>'],
			[37.4428471955591, 127.322019777429, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🌺일본군위안부역사관🌺</a></div>'],
			[35.2357661930898, 126.939254424034, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🌺국립 518 민주묘지🌺</a></div>'],
			[35.9892057124043, 128.691979485267, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🌺대구시민 안전테마파크🌺</a></div>'],
			[37.0627846601606, 127.175295234549, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🌺안성 31운동 기념관🌺</a></div>'],
			[36.215516122594, 127.88929541975, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🌺노근리평화공원🌺</a></div>'],
			[35.0991217515507, 129.012674214164, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🌺부산 비석 문화 마을 -<br> 부산 임시 수도 기념관🌺</a></div>'],
			[36.3267191368445, 128.49322678984, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🌺기미3.1<br>독립만세운동기념탑 🌺</a></div>'],
			[38.2552017551785, 127.202000855042, '<div style="padding:5px;"><a href="detailPlace.jsp" style="color:blue" target="_blank">🌺노동당사🌺</a></div>'],
			[37.5864756914613, 126.974936757836, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🌺청와대🌺</a></div>']
		]
		
		
		for(var i=0; i<data.length; i++){	
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(data[i][0], data[i][1]); 
	
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
	
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			
			var iwContent = data[i][2], // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	
			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				 content : iwContent,
				 removable : iwRemoveable
			});
			  
			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
			      // 마커 위에 인포윈도우를 표시합니다
			      infowindow.open(map, marker);  
			});
			
			// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		
		    
		}
		 
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}

		
	</script>
	 <!-- Scripts -->
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/jquery.dropotron.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>
</body>
</html>