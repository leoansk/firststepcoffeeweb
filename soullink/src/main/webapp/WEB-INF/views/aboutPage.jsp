<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
	function initMap() {

		var mapLocation = {
			lat : 3.176360,
			lng : 101.659649
		}; // 위도, 경도를 가지는 객체를 생성

		var mapOptions = {
			center : mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
			zoom : 18, // 지도 zoom단계
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
 		// id: map-canvas, body에 있는 div태그의 id와 같아야 함
		var map = new google.maps.Map(document.getElementById("map"), mapOptions);

		var size_x = 60; // 마커로 사용할 이미지의 가로 크기
		var size_y = 60; // 마커로 사용할 이미지의 세로 크기

		// 마커로 사용할 이미지 주소
		var image = new google.maps.MarkerImage('http://www.weicherthallmark.com/wp-content/themes/realty/lib/images/map-marker/map-marker-gold-fat.png',
				new google.maps.Size(size_x, size_y), '', '', 
				new google.maps.Size(size_x, size_y));
		var marker;
		marker = new google.maps.Marker({
			position : mapLocation, // 마커가 위치할 위도와 경도(변수)
			map : map,
			icon : image, // 마커로 사용할 이미지(변수)
			title : "First Step Coffee Malaysia" // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
		});

		var content = "Happiness through Coffee"; // 말풍선 안에 들어갈 내용

		// 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
		var infowindow = new google.maps.InfoWindow({
			content : content
		});

		google.maps.event.addListener(marker, "click", function() {
			infowindow.open(map, marker);
		}); 
	}
</script>
<!--
         아래는 서버로부터 지도를 로딩하기 위해 요청하는 경로 async는 비동기로 로딩하도록해 지도 로딩 중 다른 웹 부분들이 열릴 수 있도록하기 위함
    key부분에는 자신의 키를 넣고, 로딩이 완료되면 callback에 지정한 함수를 수행하게 됨.
-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBaBuNOk21Q5LaGXG3SuDdUDIyFmhagBr4&callback=initMap" async defer>

</script>
	
<div class="container">
	<h1>ABOUT FIRST STEP</h1>
	<p>
		Ever since the launch of First Step Coffee in Korea 2012, our
		excitement to serve our customers with specialty coffee has been on a
		rise. Each time a hand reaches over the counter to present a coffee to
		another outstretched hand, it’s a promise of our commitment to serve
		coffee of the highest quality. The impeccable quality of green beans
		in our roasts and brews has been sweetly cherished by our customers
		from Korea to Malaysia. We use only the finest coffee beans from
		exotic coffee producers around the globe. All our beans are
		hand-picked and use the process of "selective picking" to remove all
		impurities before being dried. Our philosophy of uncompromisingly
		high-quality roast is our dedication delivering hand-crafted coffee
		each and every day. First Step Coffee offers outstanding service from
		the best in class baristas which are happy and willing to impart all
		the secrets of coffee. Besides offering espresso base coffee, we are
		also equipped with a brew bar using single origins such as Siphons,
		V60’s, and Aeropress, to allow you to experience each brew's amazing
		flavours and characteristics.
	<p>
	<h1>VISION</h1>
	<p>
		Happiness through Coffee
	</p>
	<h1>LOCATION</h1>
	<!-- googleMapApi연동 -->
	<p id="map"></p>	
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>