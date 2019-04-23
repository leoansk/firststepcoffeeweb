<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>


<div class="container">
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" >
        <ol class="carousel-indicators" >
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="6"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="7"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="8"></li>
        </ol>
        <div class="carousel-inner" role="listbox" >
          <!-- Slide -->
          <div class="carousel-item active" style="background-image: url('/resources/suit/img/shop_MLY_0.JPG')" >
            <div class="carousel-caption d-none d-md-block" >
              <h3>FirstStepCoffee</h3>
              <p>in Malaysia</p>
            </div>
          </div>
          <!-- Slide -->
          <div class="carousel-item" style="background-image: url('/resources/suit/img/shop_MLY_1.JPG')">
            <div class="carousel-caption d-none d-md-block">
              <h3>FirstStepCoffee</h3>
              <p>in Malaysia</p>
            </div>
          </div>
          <!-- Slide -->
          <div class="carousel-item" style="background-image: url('/resources/suit/img/shop_MLY_2.JPG')">
            <div class="carousel-caption d-none d-md-block">
              <h3>FirstStepCoffee</h3>
              <p>in Malaysia</p>
            </div>
          </div>
          <!-- Slide -->
          <div class="carousel-item" style="background-image: url('/resources/suit/img/shop_MLY_3.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>FirstStepCoffee</h3>
              <p>in Malaysia</p>
            </div>
          </div>
          <!-- Slide kor-->
          <div class="carousel-item" style="background-image: url('/resources/suit/img/shop_KOR_0.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>FirstStepCoffee</h3>
              <p>in Korea</p>
            </div>
          </div>
          <!-- Slide kor-->
          <div class="carousel-item" style="background-image: url('/resources/suit/img/shop_KOR_1.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>FirstStepCoffee</h3>
              <p>in Korea</p>
            </div>
          </div>
          <!-- Slide kor-->
          <div class="carousel-item" style="background-image: url('/resources/suit/img/shop_KOR_2.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>FirstStepCoffee</h3>
              <p>in Korea</p>
            </div>
          </div>
          <!-- Slide kor-->
          <div class="carousel-item" style="background-image: url('/resources/suit/img/shop_KOR_3.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>FirstStepCoffee</h3>
              <p>in Korea</p>
            </div>
          </div>
          <!-- Slide kor-->
          <div class="carousel-item" style="background-image: url('/resources/suit/img/shop_KOR_4.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>FirstStepCoffee</h3>
              <p>in Korea</p>
            </div>
          </div>
        </div>
        
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
</div>

<script>
	/* 팝업창  */
	$(document).ready(function($) {
	    pevent();
	});
	
	if("${result}" == "true"){
		alert("${join.id}"+"님 회원가입을 환영합니다.");
		history.pushState(null,null,'mainPage');
	}
	
	function pevent(){
		console.log("pevent에 들어가는가?")
	    function getCookie(name){
	        var nameOfCookie = name + "=";
	        var x = 0;
	        while (x <= document.cookie.length){
	            var y = (x + nameOfCookie.length);
	            if (document.cookie.substring(x, y) == nameOfCookie){
	            if ((endOfCookie = document.cookie.indexOf(";", y)) == -1){
	            endOfCookie = document.cookie.length;
	            }
	            return unescape (document.cookie.substring(y, endOfCookie));
	            }
	            x = document.cookie.indexOf (" ", x) + 1;
	            if (x == 0) break;
	        }
	        return "";
	    }
	    if (getCookie("popname") != "done"){
	        var popUrl = "popup";
	        var popOption = "width=250%, height=450%, resizable=no, scrollbars=no, status=no;";
	        window.open(popUrl,"",popOption);
	    }
	}
</script>

<%@include file="/WEB-INF/views/include/footer.jsp"%>