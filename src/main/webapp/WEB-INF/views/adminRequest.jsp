<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
<title>더한섬닷컴 | THE HANDSOME.COM</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="author" content="Group3">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,maximum-scale=1" />
<meta name="description" content="더한섬닷컴 | THE HANDSOME.COM">

<!-- favicon icon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/icon/favicon.png">
<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/resources/icon/favicon.png">
<link rel="apple-touch-icon" sizes="72x72" href="${pageContext.request.contextPath}/resources/icon/favicon.png">
<link rel="apple-touch-icon" sizes="114x114" href="${pageContext.request.contextPath}/resources/icon/favicon.png">
	
<!-- style sheets and font icons  -->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/font-icons.min.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/theme-vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/responsive.css" />
	
	<!-- javascript -->
	<script type="text/javascript"
		src="${contextPath}/resources/js/jquery.min.js"></script>
</head>

<script>
	$.ajaxSetup({
		async: false
	});
	
	$(document).ready(function() {
		var count = 0;

		var departmentID = "";
		$.getJSON( "${contextPath}/getDepartmentInfo", {adminID : '${adminID}', password : '${password}'}, function( data ) {
// 		$.getJSON( "${contextPath}/getDepartmentInfo", {id : 'admin', password : 'admin'}, function( data ) {
			var html = "";
			html += "<h2 class='alt-font text-gradient-sky-blue-pink margin-15px-bottom d-inline-block'>";
			html += data['name'];
			html += "</h2>";
			$("#departmentTitle").html(html);
			departmentID += data['id'];
		});
		
		var brandID = "";
		$.getJSON( "${contextPath}/getBrandInfo", {adminID : '${adminID}', password : '${password}'}, function( data ) {
// 		$.getJSON( "${contextPath}/getBrandInfo", {id : 'admin', password : 'admin'}, function( data ) {
			var html = "";
			html += "<h1 class='text-extra-dark-gray alt-font font-weight-500 letter-spacing-minus-1px line-height-50 sm-line-height-45 xs-line-height-30 no-margin-bottom'>";
			html += data['name'];
			html += "</h1>";
			
			var html2 = "";	
			html2 += "<div style='padding-bottom: 100px;'>";
			html2 += "<img src='${contextPath}/resources/images/brand-top/";
			html2 += data['name'];
			html2 += ".jpg'>";
			html2 += "</div>";
			
			$("#brandTitle").html(html);
			$("#imageTitle").html(html2);
			brandID += data['id'];
		});
		
		$.getJSON( "${contextPath}/getProduct", {product_id : '${product_id}', department : departmentID, brand : brandID}, function( data ) {
			var html = "";

			$.each( data, function( key, val ) {
				html += "<li class='gird-item wow animate__fadeIn'>";
				html += "<div class='blog-post box-shadow-small border-radius-6px'>";
				html += "<div class='blog-post-image cover-background xs-h-250px'";
				html += "style=\"background-image: url('${contextPath}/resources/images/product/";
				html += data[key]['sex'];
				html += "/";
				html += data[key]['mainCategory'];
				html += "/";
				html += data[key]['subCategory'];
				html += "/";
				html += data[key]['imagePath'];
				html += ".jpg";
				html += "')\">";
				html += "<a href=''";
				html += "class='blog-post-image-overlay bg-dark-slate-blue'></a>";
				html += "</div>";
				html += "<div class='post-details bg-white padding-3-half-rem-all lg-padding-2-half-rem-all md-padding-3-half-rem-all'>";
				html += "<a href=''";
				html += "class='font-weight-500 text-large line-height-24px text-extra-dark-gray xs-margin-10px-bottom'>";
				html += data[key]['title'];
				html += "</a>";
				html += "<div>";
				html += "<label class='text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-60px'>color</label>";
				html += "<ul class='alt-font shop-color'>";
				html += "<input class='d-none' type='radio' id='color-2' name='color'>";
				html += "<label for='color-1'>";
				html += "<span style='background-color: #";
				html += data[key]['color'];
				html += "'>";
				html += "</span>";
				html += "</label>";
				html += "</ul>";
				html += "</div>";
				html += "<label class='text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-100px'>";
				html += "size&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
				html += data[key]['size'];
				html += "</label>";
				html += "<p><br>";
				html += data[key]['name'];
				html += "</p>";
				html += "<a class='alt-font font-weight-500 text-small text-gradient-sky-blue-pink text-uppercase align-self-start'>";
				html += data[key]['purchaseDate'];
				html += "</a>";
				html += "</div>";
				html += "<div class='post-details bg-white padding-3-half-rem-all lg-padding-2-half-rem-all md-padding-3-half-rem-all'>";
				html += "<a href=''";
				html += "class='font-weight-500 text-large line-height-24px text-extra-dark-gray xs-margin-15px-bottom'>";
				if (data[key]['state'] === '발송요청') {
					html += "재고가 없습니다 ! ";
				} else if (data[key]['state'] === '입고요청') {
					html += "재고가 없습니다 ! ";
				} else if (data[key]['state'] === '출고요청') {
					html += "출고 요청이 왔습니다 ! ";
				} else if (data[key]['state'] === '입고완료') {
					html += "입고가 완료되었습니다 ! ";
				} else if (data[key]['state'] === '출고완료') {
					html += "출고가 완료되었습니다 ! ";
				}
				html += "</a>";
				html += "<div >";
				html += "<label class='text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-60px'>발신 지점 : </label>";
				html += "<label class='text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-100px'>";
				html += data[key]['destination'];
				html += "</label>";
				html += "</div>";
				html += "<div>";
				html += "<label class='text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-60px'>수신 지점 : </label>";
				html += "<label class='text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-100px'>";
				html += data[key]['departure'];
				html += "</label>";
				html += "</div>";
				html += "<p><br>";
				html += "<label class='text-extra-dark-gray'>";
				if (data[key]['state'] === '발송요청') {
					html += "가까운 지점으로 재고를 요청합니다.";
				} else if (data[key]['state'] === '입고요청') {
					html += "재고를 요청했으나 입고되지 않은 상태입니다.";
				} else if (data[key]['state'] === '출고요청') {
					html += "재고를 발송합니다.";
				} else if (data[key]['state'] === '입고완료') {
					html += "지점으로 재고를 발송했습니다.";
				} else if (data[key]['state'] === '출고완료') {
					html += "고객에게 입고가 통보되었습니다.";
				}
				html += "</label>";
				html += "</p>";
				html += "<div class='post-details bg-white lg-padding-2-half-rem-all md-padding-3-half-rem-all'>";
				if (data[key]['state'] === '발송요청' || data[key]['state'] === '출고요청') {
					html += "<a href='${contextPath}/admin/";
					html += data[key]['product_id'];
					html += "'";
					html += "onclick='callRequest(\"";
					html += data[key]['state'];
					html += "\", \"";
					html += data[key]['product_id'];
					html += "\")'";
				} else {
					html += "<a href='${contextPath}/admin'";
				}
				html += "class='btn btn-large btn-transparent-dark-gray d-table d-lg-inline-block blog-category alt-font align-self-start'";
				html += "style='font-weight: bold; font-size: 10px'>";
				if (data[key]['state'] === '발송요청') {
					html += "발송요청";
				} else if (data[key]['state'] === '입고요청') {
					html += "돌아가기";
				} else if (data[key]['state'] === '출고요청') {
					html += "물품발송";
				} else if (data[key]['state'] === '입고완료') {
					html += "돌아가기";
				} else if (data[key]['state'] === '출고완료') {
					html += "돌아가기";
				}
				html += "</a>";
				html += "</div>";
				html += "</li>";
			});
			
			$("#productImage").html(html);
		});
	});

	function callRequest(order, product_id) {
		$.getJSON("${contextPath}/handleRequest", {order : order , product_id : product_id}, function( data ) {});
	}
</script>

<body data-mobile-nav-style="classic">
	<!-- start header -->
	<header>
		<!-- start navigation -->
		<nav
			class="navbar navbar-expand-lg navbar-light bg-transparent header-light fixed-top header-reverse-scroll">
			<div class="container-lg nav-header-container">
				<div class="col-auto col-sm-6 col-lg-2 mr-auto pl-lg-0">
					<a class="navbar-brand" href="${contextPath}/admin"> <img
						src="${contextPath}/resources/images/logo-handsome.png"
						data-at2x="${contextPath}/resources/images/logo-handsome.png"
						class="default-logo" alt=""> <img
						src="${contextPath}/resources/images/logo-handsome.png"
						data-at2x="${contextPath}/resources/images/logo-handsome.png"
						class="alt-logo" alt=""> <img
						src="${contextPath}/resources/images/logo-handsome.png"
						data-at2x="${contextPath}/resources/images/logo-handsome.png"
						class="mobile-logo" alt="">
					</a>
				</div>
				<div class="col-auto col-lg-8 menu-order px-lg-0">
					<button class="navbar-toggler float-right" type="button"
						data-toggle="collapse" data-target="#navbarNav"
						aria-controls="navbarNav" aria-label="Toggle navigation">
						<span class="navbar-toggler-line"></span> <span
							class="navbar-toggler-line"></span> <span
							class="navbar-toggler-line"></span> <span
							class="navbar-toggler-line"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-center"
						id="navbarNav">
						<ul class="navbar-nav alt-font">
							<li class="nav-item dropdown simple-dropdown"><a href="${contextPath}/admin"
								class="nav-link" style="font-weight: bold;">요청관리</a></li>
							<li class="nav-item dropdown simple-dropdown"><a href="${contextPath}/admin/support"
								class="nav-link" style="font-weight: bold;">운영지원</a></li>
							<li class="nav-item dropdown simple-dropdown"><a href="${contextPath}/adminSignin"
								class="nav-link" style="font-weight: bold;">로그아웃</a></li>
						</ul>
					</div>
				</div>
				<div class="col-auto col-lg-2 text-right pr-0 font-size-0">
			</div>
		</nav>
		<!-- end navigation -->
	</header>
	<!-- end header -->
	<!-- start section -->
	<section class='half-section bg-light-gray parallax'
				data-parallax-background-ratio='0.5'
				style="background-image:url('${contextPath}/resources/images/portfolio-bg2.jpg'); padding-bottom: 0px;">
<%-- 				style="background-image:url('${contextPath}/resources/images/portfolio-bg2.jpg'); padding-bottom: 0px; padding-top: 0px; margin-top: 80px;"> --%>
		<div class='container'>
			<div class='row align-items-stretch justify-content-center extra-small-screen'>
				<div class='col-12 col-xl-6 col-lg-7 col-md-8 page-title-extra-small text-center d-flex justify-content-center flex-column'>
					<div id="departmentTitle"></div>
					<div id="brandTitle"></div>
				</div>
			</div>
		</div>
	</section>
	<!-- end section -->
	
	<!-- start section -->
	<section class="bg-light-gray pt-0 padding-five-lr lg-no-padding-lr">
		<div class="container-fluid">
			<div class="row justify-content-center">
<!-- 				<div id="imageTitle"></div> -->
				<div id="btn1"
					class="col-12 col-xl-12 col-lg-12 col-sm-10 blog-content lg-no-padding-lr">
					<ul
						class="blog-simple blog-wrapper grid grid-loading grid-3col xl-grid-1col lg-grid-1col md-grid-1col sm-grid-1col xs-grid-1col gutter-double-extra-large">
						<li class="grid-sizer"></li>
						<!-- start item -->
						<div id="productImage"></div>
						<!-- end item -->
					</ul>
				</div>
			</div>
		</div>
	</section>
	<!-- end section -->
	
	<!-- start section -->
	<section class="half-section">
		<div class="container">
			<div class="row justify-content-center">
				<!-- start feature box item-->
				<div
					class="col-12 col-sm-auto sm-margin-15px-bottom wow animate__fadeIn"
					data-wow-delay="0.2s">
					<div
						class="d-flex justify-content-center align-items-center padding-15px-lr h-100">
						<i
							class="feather icon-feather-headphones align-middle icon-extra-small text-gradient-magenta-orange margin-10px-right"></i>
						<span class="text-extra-dark-gray alt-font text-medium">+82
							02 1800 5700</span>
					</div>
				</div>
				<!-- end feature box item-->
				<!-- start feature box item-->
				<div
					class="col-12 col-sm-auto sm-margin-15px-bottom wow animate__fadeIn"
					data-wow-delay="0.4s">
					<div
						class="d-flex justify-content-center align-items-center padding-15px-lr h-100">
						<i
							class="feather icon-feather-mail align-middle icon-extra-small text-gradient-magenta-orange margin-10px-right"></i>
						<a href="mailto:no-reply@domain.com"
							class="text-extra-dark-gray alt-font text-medium">voc@hyundaihmall.com</a>
					</div>
				</div>
				<!-- end feature box item-->
				<!-- start feature box item-->
				<div class="col-12 col-sm-auto wow animate__fadeIn"
					data-wow-delay="0.6s">
					<div
						class="d-flex justify-content-center align-items-center padding-15px-lr h-100">
						<i
							class="feather icon-feather-globe align-middle icon-extra-small text-gradient-magenta-orange margin-10px-right"></i>
						<a href="http://www.thehandsome.com" class="text-extra-dark-gray alt-font text-medium">www.thehandsome.com</a>
					</div>
				</div>
				<!-- end feature box item-->
			</div>
		</div>
	</section>
	<!-- end section -->
	<!-- start scroll to top -->
	<a class="scroll-top-arrow" href="javascript:void(0);"><i
		class="feather icon-feather-arrow-up"></i></a>
	<!-- end scroll to top -->
	<script type="text/javascript"
		src="${contextPath}/resources/js/theme-vendors.min.js"></script>
	<script type="text/javascript"
		src="${contextPath}/resources/js/main.js"></script>
</body>
</html>