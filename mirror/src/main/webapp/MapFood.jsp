<%@page import="com.mirror.domain.placeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mapFood</title>
</head>
<body>
	<% 
	
	 placeVO detailPlace=(placeVO)request.getAttribute("detailPlace");
	
	
	
	%>
	<div id="map" style="width:100%;height:100vh;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4ce7780b8c5de704882cefc7cf5b72b3&libraries=clusterer"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(36.321655, 127.378953), // 지도의 중심좌표
	        level: 14 // 지도의 확대 레벨
	    };

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		var clusterer = new kakao.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	        minLevel: 10 // 클러스터 할 최소 지도 레벨 
	    });
		
		var data = [
			[37.571305107,126.975354533, '<div style="padding:5px;"><a href="detailPlace.jsp" style="color:blue" target="_blank">🍴한라의집🍴</a></div>'],
			[37.576901912,127.015882736, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴궁나라냉면.묵밥🍴</a></div>'],
			[37.570846289,126.979923570, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴감촌🍴</a></div>'],
			[37.571435706,127.004207043, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴고창선운사풍천장어금정🍴</a></div>'],
			[37.579458765,126.986992405, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴화동옥🍴</a></div>'],
			[37.560134270,126.985288424, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴중일회관🍴</a></div>'],
			[37.562440185,126.978919248, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴애성회관🍴</a></div>'],
			[37.567575315,126.969176176, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴서안🍴</a></div>'],
			[37.540476397,126.967858628, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴강원정삼계탕🍴</a></div>'],
			[37.544382630,126.973244855, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴은정🍴</a></div>'],
			[37.526121039,126.963182794, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴용산대식가🍴</a></div>'],
			[37.557609167,127.030732427, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴마포갈비생등심🍴</a></div>'],
			[37.560408526,127.033171014, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴푸줏간생고기점🍴</a></div>'],
			[37.547621123,127.015528114, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴백년회관서서갈비금호점🍴</a></div>'],
			[37.558081649,127.074762301, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴능동순두부🍴</a></div>'],
			[37.5608696,127.085284, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴심마니유황오리🍴</a></div>'],
			[37.561683113,127.068102193, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴굴마을🍴</a></div>'],
			[37.598932032,127.098639059, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴춘천골🍴</a></div>'],
			[37.592828754,127.087751915, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴소꼴농장🍴</a></div>'],
			[37.603318223,127.078854401, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴명태촌낙지세상🍴</a></div>'],
			[37.591470975,127.017208407, '<div style="padding:5px;"><a href="detailPlace.jsp" style="color:blue" target="_blank">🍴만선참치🍴</a></div>'],
			[37.616985226,127.028601843, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴능이마을🍴</a></div>'],
			[37.654476913,127.058393246, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴신의주찹쌀순대🍴</a></div>'],
			[37.677510809,127.055769081, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴지호한방삼계탕수락산역점🍴</a></div>'],
			[37.634842540,126.919608479, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴이얼싼🍴</a></div>'],
			[37.572480007,126.934147425, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴녹원🍴</a></div>'],
			[37.576924896,126.893170891, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴양평해장국🍴</a></div>'],
			[37.532872796,126.868844467, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴향촌🍴</a></div>'],
			[37.535970018,126.877981212, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴본죽&비빔밥카페목동파리공원점🍴</a></div>'],
			[37.529210967,126.875984851, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴애슐리퀸즈목동행복한백화점🍴</a></div>'],
			[37.577517511,126.812467637, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴마산아구찜🍴</a></div>'],
			[37.577517511,126.812467637, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴짬뽕타임(가양점)🍴</a></div>'],
			[37.560177851,126.837696059, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴쿠우쿠우발산점🍴</a></div>'],
			[37.558051996,126.846092420, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴감성9091돼지강서직영점🍴</a></div>'],
			[37.496830159,126.846239505, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴참좋은식당🍴</a></div>'],
			[37.478496082,126.900511106, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴어물전금천점🍴</a></div>'],
			[37.520796769,126.926909051, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴창고43본점🍴</a></div>'],
			[37.508030867,126.964188291, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴계단집🍴</a></div>'],
			[37.512958875,126.937793703, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴다독이네숯불구이🍴</a></div>'],
			[37.522477745,127.055156081, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴(주)청담푸드빌(청담복집)(신의주찹쌀순대)🍴</a></div>'],
			[37.515558477,127.060861531, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴들녁🍴</a></div>'],
			[37.514420606,127.064140451, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴삼성돈구이🍴</a></div>'],
			[37.513656777,127.053425400, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴오발탄(주)오발탄에프에스🍴</a></div>'],
			[37.510982440,127.058205570, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴마쯔가제🍴</a></div>'],
			[37.506782867,127.053477999, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴수림복국🍴</a></div>'],
			[37.498980955,127.036817883, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴카페마마스역삼점</a></div>'],
			[37.505763512,127.057944522, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴용수사</a></div>'],
			[37.497461560,127.121733322, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴가락골마산아구찜🍴</a></div>'],
			[37.516591292,127.113955447, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴어양</a></div>'],
			[37.506962961,127.090682120, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴돈까스의집🍴</a></div>'],
			[37.512994117,127.119189688, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴산야초닭한마리🍴</a></div>'],
			[37.490226584,127.124734829, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴이모네숯불돼지갈비🍴</a></div>'],
			[37.494293003,127.123496165, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴황금소가락본점🍴</a></div>'],
			[37.512822221,127.108724755, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴을밀대🍴</a></div>'],
			[37.521911710,127.040161478, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴현대정육식당🍴</a></div>'],
			[37.552206123,127.127923855, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴빛나는바다🍴</a></div>'],
			[37.532632877,127.122433394, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴윌리엄커피🍴</a></div>'],
			[35.096523063,129.035654259, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴대궁한정식🍴</a></div>'],
			[35.090072904,129.042753134, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴영선불고기🍴</a></div>'],
			[35.153817100,129.060718911, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴역전우동0410(서면중앙점)🍴</a></div>'],
			[35.202993884,129.085151047, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴정림🍴</a></div>'],
			[35.210892017,129.006458816, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴이박사횟집🍴</a></div>'],
			[35.081164669,128.964487868, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴그린샤브&쭈꾸미🍴</a></div>'],
			[35.082520799,128.978284342, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴(주)프리미스웨딩뷔페🍴</a></div>'],
			[35.188570661,129.097147546, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴동원숯불갈비🍴</a></div>'],
			[35.185908384,129.080330639, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴할매보쌈🍴</a></div>'],
			[35.154214351,128.997635609, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴이디야🍴</a></div>'],
			[35.150550563,129.012947411, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴유가네닭갈비동서점🍴</a></div>'],
			[35.864864958,128.591639952, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴정담🍴</a></div>'],
			[35.871944159,128.629058253, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴뼈대있는돼지집🍴</a></div>'],
			[35.865485467,128.555359324, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴황장군평리점🍴</a></div>'],
			[35.888020493,128.559972528, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴장단지생막창🍴</a></div>'],
			[35.845561173,128.592197009, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴소마구참숯갈비🍴</a></div>'],
			[35.845758827,128.591091918, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴벱하노이🍴</a></div>'],
			[35.869389845,128.666482514, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴팔공산호박오리수성점🍴</a></div>'],
			[35.834156134,128.537681739, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴본짬뽕🍴</a></div>'],
			[35.817981139,128.547915081, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴대가야성🍴</a></div>'],
			[37.456571534,126.603667368, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴해촌🍴</a></div>'],
			[37.465409798,126.652146947, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴주식회사숭의가든🍴</a></div>'],
			[37.460377366,126.647657755, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴쭈돈나라🍴</a></div>'],
			[37.463660743,126.699747600, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴수림공원🍴</a></div>'],
			[37.517260127,126.734047145, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴가보🍴</a></div>'],
			[37.544131382,126.725365905, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴미락해물탕🍴</a></div>'],
			[37.572753317,126.681232532, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴유천가든🍴</a></div>'],
			[37.744816026,126.488778675, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴마쯔🍴</a></div>'],
			[35.141870359,126.836221394, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴(주)해동활어🍴</a></div>'],
			[35.144653504,126.847801455, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴산일능이버섯백숙(상무점)🍴</a></div>'],
			[35.121443159,126.898204133, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴진월애진곰탕🍴</a></div>'],
			[35.204452298,126.873876666, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴이비가짬뽕(양산점)🍴</a></div>'],
			[35.1789457063787,126.869912293342, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴우미관🍴</a></div>'],
			[36.330959141,127.430908911, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴한밭식당🍴</a></div>'],
			[36.351435319,127.437385040, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴봉추찜닭🍴</a></div>'],
			[36.327465314,127.405598444, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴삼일소고기국밥🍴</a></div>'],
			[36.348930836,127.367943121, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴도시애바다🍴</a></div>'],
			[36.332388363,127.386060791, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴곰수산가장점🍴</a></div>'],
			[36.356512024,127.364680442, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴속초명태마을🍴</a></div>'],
			[36.306400118,127.354844366, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴남촌민물장어🍴</a></div>'],
			[36.375467628,127.316373069, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴황인진대구탕대구찜🍴</a></div>'],
			[36.358529525,127.347829234, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴라무다찌🍴</a></div>'],
			[36.362187199,127.437019189, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴복수한우날고기🍴</a></div>'],
			[35.5535466,129.319437, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴초원돼지갈비🍴</a></div>'],
			[35.543262078,129.346006716, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴미풍해장국울산삼산본점🍴</a></div>'],
			[35.483810626,129.413220804, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴꽃바위동해반점🍴</a></div>'],
			[35.492007274,129.431399718, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴일산지대구탕🍴</a></div>'],
			[35.435973332,129.301399568, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴대운터🍴</a></div>'],
			[35.348347868,129.328923196, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴금장생복집🍴</a></div>'],
			[35.465037267,129.287262444, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴정수장추어탕🍴</a></div>'],
			[37.295837493,126.994261976, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴착한고기🍴</a></div>'],
			[37.311939874,126.978707224, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴추오정남원추어탕🍴</a></div>'],
			[37.2744742558132,126.97157859658, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴등촌샤브칼국수🍴</a></div>'],
			[37.272792166,127.028129702, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴팔덕식당수원직영점🍴</a></div>'],
			[37.250355759,127.079318863, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴장성만낙지전문점🍴</a></div>'],
			[37.453348093,127.105331386, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴우리밀명동칼국수🍴</a></div>'],
			[37.386247499,127.124584971, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴남원추어탕추담골🍴</a></div>'],
			[37.340051178,127.107812236, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴경복궁판교점🍴</a></div>'],
			[37.395434800,127.113530895, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴마량수산🍴</a></div>'],
			[37.387119545,127.125208646, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴경원식당🍴</a></div>'],
			[37.740293861,127.038280769, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴전주콩나물국밥🍴</a></div>'],
			[37.749250280,127.045281677, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴무한리필고기굼터🍴</a></div>'],
			[37.742371236,127.048411093, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴흰돌감자탕🍴</a></div>'],
			[37.419798398,126.928336079, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴돈소골🍴</a></div>'],
			[37.401525247,126.897569271, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴자연농장고향밥상🍴</a></div>'],
			[37.400405522,126.930333302, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴어죽이네철렵국🍴</a></div>'],
			[37.393318503,126.963171094, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴청정바지락생칼국수🍴</a></div>'],
			[37.492758076,126.759118554, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴라비에벨🍴</a></div>'],
			[37.506419679,126.754147561, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴횟집도화🍴</a></div>'],
			[37.475201959,126.868844517, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴삼학도영덕대게킹크랩🍴</a></div>'],
			[37.474466149,126.869628100, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴참치명가평택점🍴</a></div>'],
			[36.997193582,127.114355876, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴진미식당🍴</a></div>'],
			[36.988286453,126.929271330, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴백년교동짬뽕🍴</a></div>'],
			[37.309577438,126.816349532, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴더고기창고🍴</a></div>'],
			[37.618695656,126.845790201, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴백년불고기라페스타점🍴</a></div>'],
			[37.426968611,126.992023164, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴부잣집🍴</a></div>'],
			[37.621793440,127.185193676, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴진짜로춘천닭갈비막국수🍴</a></div>'],
			[37.608204464,127.157753794, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴좋은밥상🍴</a></div>'],
			[37.655626565,127.244078212, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴쿠우쿠우평내호평점🍴</a></div>'],
			[37.346601803,126.688409114, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴우정회집🍴</a></div>'],
			[37.358324606,126.945762385, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴옥돌돼지갈비🍴</a></div>'],
			[37.360115653,126.931006901, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴신선설농탕🍴</a></div>'],
			[37.536990001,127.215738417, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴두메촌갈비🍴</a></div>'],
			[37.535032646,127.223655470, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴24시전주명가콩나물국밥🍴</a></div>'],
			[37.138392574,127.311169435, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴청룡🍴</a></div>'],
			[37.276467517,127.116447564, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴소박사🍴</a></div>'],
			[37.726677716,126.698087674, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴어일식🍴</a></div>'],
			[37.111282535,127.549851668, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴이천쌀밥송학설성점🍴</a></div>'],
			[37.297103821,127.411391197, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴이천쌀초밥🍴</a></div>'],
			[37.616909023,126.716034163, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴사조참치(김포점)🍴</a></div>'],
			[37.649016710,126.577768630, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴대박풍천장어🍴</a></div>'],
			[37.813242975,127.633591079, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴강촌막국수🍴</a></div>'],
			[37.882819681,127.730196763, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴파도횟집🍴</a></div>'],
			[37.873516140,127.720307037, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴북경관🍴</a></div>'],
			[37.811547982,127.635020530, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴우물집🍴</a></div>'],
			[37.892557624,127.722522720, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴이비가짬뽕춘천점🍴</a></div>'],
			[37.369480241,127.936982894, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴진미양념통닭🍴</a></div>'],
			[37.428625154,128.057353104, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴진골가든🍴</a></div>'],
			[37.347291952,127.927019026, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴종로상회🍴</a></div>'],
			[37.375313837,127.876580152, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴라라코스트원주기업도시점🍴</a></div>'],
			[37.758722653,128.892614915, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴이만구교동짬뽕🍴</a></div>'],
			[37.748681859,128.885354815, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴쿠켄🍴</a></div>'],
			[37.520698273,129.110352982, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴천곡실비촌🍴</a></div>'],
			[37.529719269,129.116944576, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴뜰애🍴</a></div>'],
			[38.194847928,128.574654326, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴응봉할매🍴</a></div>'],
			[38.195410096,128.573787778, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴춘리마라탕🍴</a></div>'],
			[38.193600153,128.573580071, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴공룡갈비🍴</a></div>'],
			[37.444488858,129.163578805, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴향🍴</a></div>'],
			[37.449349218,129.170621045, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴쌈촌구이샤브🍴</a></div>'],
			[37.443102292,129.166629681, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴온천각🍴</a></div>'],
			[37.526341008,127.908836315, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴동가래농장한우셀프점🍴</a></div>'],
			[37.182813765,128.471303366, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴동강일품국수🍴</a></div>'],
			[37.612672596,128.371133332, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴고향막국수🍴</a></div>'],
			[37.380644021,128.658505329, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴맛고을가든🍴</a></div>'],
			[38.187105914,127.286682994, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴그린식당🍴</a></div>'],
			[38.107515669,127.706460965, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴분도흑염소탕🍴</a></div>'],
			[38.104244775,127.986135208, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴마당너른집전통추어탕🍴</a></div>'],
			[38.062067487,128.163988738, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴인제복추어탕🍴</a></div>'],
			[38.379686071,128.468886215, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴본래순대고성점🍴</a></div>'],
			[38.074853083,128.620089403, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴송림식당🍴</a></div>'],
			[36.847338020,127.989831995, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴카페(Cafe)289🍴</a></div>'],
			[36.983603487,127.934108371, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴황금옥🍴</a></div>'],
			[37.171463246,128.198353408, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴솔비알🍴</a></div>'],
			[36.532213680,127.823070447, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴정이품식당🍴</a></div>'],
			[36.329760868,127.535515816, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴정자가든식당🍴</a></div>'],
			[36.171933177,127.781586539, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴만리장🍴</a></div>'],
			[36.155173798,127.773344195, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴둥구나무집🍴</a></div>'],
			[36.932724394,127.429470343, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴수라간🍴</a></div>'],
			[36.732965540,127.908111856, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴칠보산산장🍴</a></div>'],
			[36.936198480,127.690409465, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴월성식당🍴</a></div>'],
			[36.930044327,127.691400819, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴원조장수촌🍴</a></div>'],
			[36.9325270728326,127.68878938956, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴청년고기장수충북음성점🍴</a></div>'],
			[36.983687320,128.370110848, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴미강식당🍴</a></div>'],
			[36.359291093,127.238219095, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴동학산장(사비성)🍴</a></div>'],
			[36.245643462,126.537416816, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴유성횟집🍴</a></div>'],
			[36.775223242,126.933701146, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴궁중화로🍴</a></div>'],
			[36.754041123,126.425433854, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴인지한우마을🍴</a></div>'],
			[36.248388217,127.223184531, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴(주)지산농원🍴</a></div>'],
			[36.160237380,127.338170025, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴(주)지산농원🍴</a></div>'],
			[36.275214541,126.912223514, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴황토집사람들🍴</a></div>'],
			[36.275214541,126.912223514, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴장수마을🍴</a></div>'],
			[36.078363374,126.684392844, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴서천장어본가🍴</a></div>'],
			[36.643408264,126.663113173, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴웰빙매운해물손칼국수🍴</a></div>'],
			[36.657920578,126.620193853, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴토속식당🍴</a></div>'],
			[36.747794863,126.298824881, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴우리갈비🍴</a></div>'],
			[35.813034261,127.133122963, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴감탄🍴</a></div>'],
			[35.831941729,127.103256388, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴아구세상서곡점🍴</a></div>'],
			[35.789702224,127.113094607, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴돔베초밥효천점🍴</a></div>'],
			[35.846560658,127.120637568, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴늘채움🍴</a></div>'],
			[35.860857411,127.122445715, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴양푼댁🍴</a></div>'],
			[35.866923295,127.122565022, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴송천점맛찬들왕소금구이🍴</a></div>'],
			[35.969844915,126.677614962, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴삼미정🍴</a></div>'],
			[35.970852425,126.712173701, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴제주도횟집</a></div>'],
			[35.944506453,126.944060847, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴홍능갈비🍴</a></div>'],
			[35.941098542,126.951509044, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴뚱보네숯불구이🍴</a></div>'],
			[35.950061056,126.938623938, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴라라코스트(모현점)🍴</a></div>'],
			[35.617288461,126.893200987, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴금거북🍴</a></div>'],
			[35.559515291,126.868397825, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴정통중화요리삼팔공공🍴</a></div>'],
			[35.413508102,127.390617994, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴까치정🍴</a></div>'],
			[35.463382851,127.604315599, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴지리산한우생고기🍴</a></div>'],
			[35.803746402,126.889957228, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴전주현대옥김제점🍴</a></div>'],
			[35.963535486,127.126673041, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴백제명가🍴</a></div>'],
			[36.002962454,127.655581452, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴GoSome🍴</a></div>'],
			[35.373056406,127.141852786, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴어울림계절맛집🍴</a></div>'],
			[35.434383538,126.708830212, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴태흥갈비🍴</a></div>'],
			[35.727782811,126.737914934, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴아향설렁탕🍴</a></div>'],
			[34.792394925,126.385193618, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴수가정본점(시내점)🍴</a></div>'],
			[34.797542899,126.430431317, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴꽃마름(목포하당점)🍴</a></div>'],
			[34.753453609,127.703143646, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴화포식당(여수점)🍴</a></div>'],
			[34.771511444,127.640853501, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴가람복집🍴</a></div>'],
			[34.751418880,127.743445303, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴미가칼국수🍴</a></div>'],
			[34.949417836,127.489583449, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴구이사랑🍴</a></div>'],
			[35.034612752,126.804609347, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴산포장어🍴</a></div>'],
			[34.925863978,127.698565524, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴힘센장어타운🍴</a></div>'],
			[35.189182119,127.372558375, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴통나무집🍴</a></div>'],
			[35.214657468,127.464311946, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴땅고랑오리집🍴</a></div>'],
			[34.608578075,127.281233324, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴차이나타운🍴</a></div>'],
			[34.595848176,127.275764601, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴고흥원🍴</a></div>'],
			[34.669059067,127.085689311, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴비치횟집🍴</a></div>'],
			[34.669675740,126.893175979, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴운동장가든🍴</a></div>'],
			[34.743137498,126.713529418, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴월오황토가🍴</a></div>'],
			[34.517991230,126.609357810, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴정든집🍴</a></div>'],
			[34.416029261,126.591730492, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴땅끝정인숙칼국수🍴</a></div>'],
			[34.990361528,126.471262942, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴바다촌🍴</a></div>'],
			[34.826944390,126.113629535, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴이학횟집🍴</a></div>'],
			[36.017391167,129.343619771, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴UA컨벤션파티스뷔페🍴</a></div>'],
			[36.068620721,129.383502233, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴길향🍴</a></div>'],
			[35.850249861,129.205897283, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴국시집🍴</a></div>'],
			[35.858858466,129.220403313, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴샤브향🍴</a></div>'],
			[36.561012232,128.702797144, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴송담추어탕🍴</a></div>'],
			[36.562400538,128.739059610, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴샤브향안동점🍴</a></div>'],
			[36.136241436,128.416735599, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴꽃마름월남쌈샤브앤샐러드바옥계점🍴</a></div>'],
			[35.972180553,128.939855038, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴고향솥단지삼겹살🍴</a></div>'],
			[36.419056155,128.162855650, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴복터진집상주점🍴</a></div>'],
			[36.339705978,128.132543005, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴상주토끼곰탕🍴</a></div>'],
			[35.865695495,128.818258221, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴송정🍴</a></div>'],
			[35.819649640,128.757071349, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴누리마을감자탕삼풍점🍴</a></div>'],
			[35.820181616,128.717182709, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴세남자의이야기🍴</a></div>'],
			[35.874814330,128.813970209, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴초원애한식뷔페🍴</a></div>'],
			[36.150617158,128.594854301, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴효령매운탕🍴</a></div>'],
			[36.351264296,128.700376193, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴시골황토매운탕🍴</a></div>'],
			[36.410930570,129.366757236, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴이가네옛날불고기🍴</a></div>'],
			[35.747198397,128.348506925, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴고령성주축협한우명품관🍴</a></div>'],
			[36.038154965,128.269225052, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴높은들가든🍴</a></div>'],
			[35.992479327,128.398081002, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴남산식육식당🍴</a></div>'],
			[36.655651054,128.452563037, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴김서방숯불갈비🍴</a></div>'],
			[36.575500202,128.487935504, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴김창권설렁탕2호점🍴</a></div>'],
			[35.165136184,128.160953517, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴석원🍴</a></div>'],
			[34.635126677,128.265158796, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴늘푸른횟집🍴</a></div>'],
			[34.841083151,128.421267563, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴남강식당🍴</a></div>'],
			[35.080947150,128.089387786, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴진사복집🍴</a></div>'],
			[35.079843336,128.090450220, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴통뼈감자탕🍴</a></div>'],
			[35.222862490,128.930051906, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴옥천장어구이🍴</a></div>'],
			[35.233170316,128.859191784, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴사상밀양국밥🍴</a></div>'],
			[35.233424326,128.904663839, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴홍가낙지🍴</a></div>'],
			[35.205548534,128.819385392, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴가람생복🍴</a></div>'],
			[35.499584828,128.746106608, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴신라해장국🍴</a></div>'],
			[34.868183392,128.729215687, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴해양식당🍴</a></div>'],
			[34.894749397,128.694410278, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴아이니🍴</a></div>'],
			[34.885888785,128.619120157, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴쿠아뜨🍴</a></div>'],
			[35.492302824,129.088619673, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴고을쌈밥🍴</a></div>'],
			[35.347355345,129.038586383, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴수영양곱창🍴</a></div>'],
			[35.347355345,129.038586383, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴종로식당🍴</a></div>'],
			[34.972752088,128.335661425, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴낙지마당🍴</a></div>'],
			[34.940794009,127.873757261, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴곰바우횟집🍴</a></div>'],
			[35.301260655,127.970247150, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴영도숯불갈비🍴</a></div>'],
			[35.518685911,127.729489177, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴청정해역🍴</a></div>'],
			[37.126649774,126.834854931, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴샤브샤브린🍴</a></div>'],
			[37.202213260,127.073195012, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴대게나라동탄점🍴</a></div>'],
			[37.452625340,127.342120157, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴산마루공원🍴</a></div>'],
			[37.411654235,127.306054295, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴기와집의정부부대찌개🍴</a></div>'],
			[37.775842182,126.935910984, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴산하식당🍴</a></div>'],
			[37.847450122,127.061694091, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴산채마을능이백숙🍴</a></div>'],
			[37.886728089,127.188679774, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴홍두깨국시집🍴</a></div>'],
			[35.222440649,128.676636652, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴봄베이인도요리전문점🍴</a></div>'],
			[35.199256176,128.572980111, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴남다른감자탕(마산어시장점)🍴</a></div>'],
			[35.153691534,128.707689075, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴유하일식🍴</a></div>'],
			[36.884021728,126.775031780, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴소우리생고기숯불굼터🍴</a></div>'],
			[36.473076621,127.290712942, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴명품한우타운🍴</a></div>'],
			[37.271081165,127.637573752, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴교리여주쌀밥🍴</a></div>'],
			[37.312193112,127.632328940, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴개성집🍴</a></div>'],
			[36.641050121,127.490783745, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴군산아구찜🍴</a></div>'],
			[36.518544477,127.498502962, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴청풍미가🍴</a></div>'],
			[36.610858425,127.485808805, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴파스타다(PASTADA)🍴</a></div>'],
			[36.607252236,127.354272750, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴남원추어탕🍴</a></div>'],
			[36.638048431,127.432669945, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴정원뜰🍴</a></div>'],
			[33.516916411,126.529079966, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴물항식당본점🍴</a></div>'],
			[33.497907450,126.516930537, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴제주기사🍴</a></div>'],
			[33.505288930,126.541616662, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴루스트플레이스인제점🍴</a></div>'],
			[33.481904811,126.413119010, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴문동일셰프녹차고을🍴</a></div>'],
			[33.5025236244869,126.504473792902, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴어영해녀촌원🍴</a></div>'],
			[33.437325091,126.677367415, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴손맛촌🍴</a></div>'],
			[33.484313037,126.536284642, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴기리시마🍴</a></div>'],
			[33.539868303,126.673980345, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴제주순풍해장국함덕점🍴</a></div>'],
			[33.487606054,126.467372310, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴어머니와장독대노형점🍴</a></div>'],
			[33.493441192,126.429172261, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴미스터빠삭제주외도점🍴</a></div>'],
			[33.464759183,126.935849363, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴바다풍경🍴</a></div>'],
			[33.257682763,126.408126638, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴덤장중문점🍴</a></div>'],
			[33.240593493,126.564737842, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴베트남향기🍴</a></div>'],
			[33.414365363,126.899924993, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴옛날옛적🍴</a></div>'],
			[33.246264685,126.523505256, '<div style="padding:5px;"><a href="#" style="color:blue" target="_blank">🍴뻘떡낙지서귀포점🍴</a></div>']
		]
		
		var markers = [];
		
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
			
		    markers.push(marker);
		}
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
		
		// 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(markers);

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