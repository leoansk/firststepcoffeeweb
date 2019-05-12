<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<!-- 본문 들어갈 곳 -->
	<div class="container">
		<h1 class="menu_title" style="color: white;">Have a look at our choices of delicious drinks and brunch!</h1>
		<!-- 핀터레스트 스타일 형식 -->
		<div id="suitcolumns">
			
			<!-- 첫번쨰 샘플 -->
			<figure>
				<img src="/resources/suit/img/Expresso.jpg" onclick="doImgPop('/resources/suit/img/Expresso.jpg')">
				<figcaption>
					<p>Expresso</p>
					<p>내용...</p>
					<!-- 
						작은 원형 스타일의 썸네일 처리...
						<div class="suit thumbnail circle" style="background-image: url('/resources/suit/img/Americano.jpg')">
							<br/>
							<p>흐음</p>
						</div> 
					-->	
				</figcaption>
			</figure>

			<figure>
				<div class="item">
					<img src="/resources/suit/img/Macchiato.jpg" width="100px" height="100px">
					<div class="item-overlay top"></div>
				</div>
				<figcaption>
					<p>Macchiato</p>
					<p>story</p>
				</figcaption>
			</figure>

			<figure>
				<img src="/resources/suit/img/Shakerato.jpg">
				<figcaption>
					<p>Shakerato</p>
					<p>story</p>
				</figcaption>
			</figure>

			<figure>
				<img src="/resources/suit/img/Americano.jpg">
				<figcaption>
					<p>Americano</p>
					<p></p>
				</figcaption>
			</figure>
			
			<figure>
				<img src="/resources/suit/img/CafeLatte.jpg">
				<figcaption>
					<p>Cafe Latte</p>
				</figcaption>
			</figure>

			<figure>
				<img src="/resources/suit/img/Cappucino.jpg">
				<figcaption>
					<p>Cappucino</p>
					<p>바디감이 풍부하며 시나몬을 뿌려먹으면 풍미가 두배!</p>
				</figcaption>
			</figure>

			<figure>
				<img src="/resources/suit/img/CafeMocha.jpg">
				<figcaption>
					<p>Cafe Mocha</p>
				</figcaption>
			</figure>

			<figure>
				<img src="/resources/suit/img/CaramelMacchiato.jpg">
				<figcaption>
					<p>Caramel Macchiato</p>
				</figcaption>
			</figure>
			
			<figure>
				<img src="/resources/suit/img/VanillaLatte.jpg">
				<figcaption>
					<p>Vanilla Latte</p>
				</figcaption>
			</figure>
			
			<figure>
				<img src="/resources/suit/img/StrawberryBananaBlast.jpg">
				<figcaption>
					<p>Strawberry Banana Blast</p>
				</figcaption>
			</figure>
			<figure>
				<img src="/resources/suit/img/VanillaLatte.jpg">
				<figcaption>
					<p>VanillaLatte</p>
				</figcaption>
			</figure>
			<figure>
				<img src="/resources/suit/img/MangoBananaBlast.jpg">
				<figcaption>
					<p>Mango Banana Blast</p>
				</figcaption>
			</figure>
			<figure>
				<img src="/resources/suit/img/OreoBlast.jpg">
				<figcaption>
					<p>Oreo Blast</p>
				</figcaption>
			</figure>
			<figure>
				<img src="/resources/suit/img/DarkChocolateBlast.jpg">
				<figcaption>
					<p>Dark Chocolate Blast</p>
				</figcaption>
			</figure>
			<figure>
				<img src="/resources/suit/img/MintChocolateBlast.jpg">
				<figcaption>
					<p>Mint Chocolate Blast</p>
				</figcaption>
			</figure>
			<figure>
				<img src="/resources/suit/img/SparkingMaracuja.jpg">
				<figcaption>
					<p>Sparking Maracuja</p>
				</figcaption>
			</figure>
		</div>
	</div>

<script type="text/javascript">
	function doImgPop(img) {
		img1 = new Image();
		img1.src = (img);
		imgControll(img);
	}

	function imgControll(img) {
		if ((img1.width != 0) && (img1.height != 0)) {
			viewImage(img);
		} else {
			controller = "imgControll('" + img + "')";
			intervalID = setTimeout(controller, 20);
		}
	}

	function viewImage(img) {
		W = img1.width;
		H = img1.height;
		O = "width=" + W + ",height=" + H + ",scrollbars=yes";
		imgWin = window.open("", "", O);
		imgWin.document
				.write("<html><head><title>:*:*:*: 이미지상세보기 :*:*:*:*:*:*:</title></head>");
		imgWin.document.write("<body topmargin=0 leftmargin=0>");
		imgWin.document
				.write("<img src="
						+ img
						+ " onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
		imgWin.document.close();
	}
</script>

<%@include file="/WEB-INF/views/include/footer.jsp"%>