<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html class="no-js" lang="en">
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
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/font-icons.min.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/theme-vendors.min.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/responsive.css" />
</head>
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
				<div class="col-auto col-lg-2 text-right pr-0 font-size-0"></div>
			</div>
		</nav>
		<!-- end navigation -->
	</header>
	<!-- end header -->
	<!-- start page title -->
	<section class='half-section bg-light-gray parallax'
				data-parallax-background-ratio='0.5'
				style="background-image:url('${contextPath}/resources/images/section-main1.jpg'); padding-top: 0px; margin-top: 80px;">
		<div class="container">
			<div
				class="d-flex flex-column flex-md-row justify-content-end extra-small-screen align-items-end">
				<div class="w-100 w-md-50 page-title-extra-small">
					<h1
						class="alt-font text-extra-dark-gray position-relative padding-90px-left padding-15px-right sm-padding-55px-left mb-md-0 sm-margin-20px-bottom" style="color: white;">
						<span class="page-title-separator-line bg-white w-70px sm-w-40px"></span>Contact
						us
					</h1>
				</div>
				<div class="w-100 w-md-50">
					<h4 class="alt-font font-weight-500 text-extra-dark-gray mb-0" style="color: white;">
						HANDSOME LEADING GLOBAL FASHION AND LIFESTYLE
					</h4>
				</div>
			</div>
		</div>
	</section>
	<!-- end page title -->
	<!-- start section -->
	<section id="analytics" style="padding-top: 0px; padding-bottom: 0px;"></section>
    <!-- end section -->
	<!-- start section -->
	<section class="big-section wow animate__fadeIn" style="padding-top: 100px;">
		<div class="container">
			<div class="row align-items-end justify-content-center">
				<div class="col-12 col-lg-5 col-md-8 md-margin-50px-bottom">
					<div
						class="feature-box feature-box-left-icon-middle padding-4-rem-all bg-light-gray overflow-hidden background-position-top background-no-repeat lg-padding-3-rem-lr md-padding-5-rem-all xs-padding-3-half-rem-all"
						style="background-image: url('${contextPath}/resources/images/quotes-01.png');">
						<div
							class="feature-box-icon margin-25px-right xs-margin-15px-right">
							<img class="border-radius-100 w-80px xs-w-50px"
								src="${contextPath}/resources/images/김동현.jpg" alt="">
						</div>
						<div class="feature-box-content">
							<div
								class="text-large text-extra-dark-gray alt-font font-weight-500 w-90">
								관리자로서<br>
								불편함이 있으신가요?
							</div>
						</div>
						<p class="margin-30px-top margin-15px-bottom w-80 lg-w-100">
							편안한 마음으로 메시지를 남겨주세요.<br>
							15분 이내로 빠르게 응대해 드리겠습니다.
						</p>
						<a href="#"
							class="text-small text-extra-dark-gray font-weight-500 text-decoration-line-bottom text-uppercase">
							
						</a>
					</div>
				</div>
				<div class="col-12 col-lg-6 offset-lg-1 col-md-8">
					<h4 class="alt-font text-black font-weight-600">Let's get in
						touch with us</h4>
					<form action="${contextPath}/mail" method="post"
						class="alt-font text-extra-dark-gray">
						<input
							class="input-border-bottom border-color-extra-dark-gray bg-transparent placeholder-dark large-input px-0 margin-25px-bottom border-radius-0px required"
							type="text" name="name" placeholder="성함" /> <input
							class="input-border-bottom border-color-extra-dark-gray bg-transparent placeholder-dark large-input px-0 margin-25px-bottom border-radius-0px required"
							type="email" name="email" placeholder="메일" /> <input
							class="input-border-bottom border-color-extra-dark-gray bg-transparent placeholder-dark large-input px-0 margin-25px-bottom border-radius-0px"
							type="tel" name="phone" placeholder="전화번호" />
						<textarea
							class="input-border-bottom border-color-extra-dark-gray bg-transparent placeholder-dark large-input px-0 margin-35px-bottom border-radius-0px"
							name="comment" rows="3" placeholder="어떻게 도와드릴까요?"></textarea>
						<input type="hidden" name="redirect" value="">
						<button class="btn btn-medium btn-dark-gray mb-0"
							type="submit">send message</button>
						<div class="form-results d-none">ASDSAD</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- end section -->
	<!-- start map section -->
	<section class="no-padding-tb wow animate__fadeIn">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 px-0">
					<div class="map-style-3 h-500px xs-h-300px">
						<iframe class="w-100 h-100 filter-grayscale-100"
							src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d11276.468467999157!2d127.0378585769754!3d37.52320771061972!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x9623c271a06b23b3!2zKOyjvCntlZzshKw!5e0!3m2!1sko!2skr!4v1625769098016!5m2!1sko!2skr"></iframe>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end map section -->
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
	<!-- javascript -->
	<script type="text/javascript" src="${contextPath}/resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/theme-vendors.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/main.js"></script>
	
<script>
	$(document).ready(function() {
		$.getJSON( "${contextPath}/miniAnalytics", function( data ) {
			if (data['title'] != undefined) {
				var html = "";
	        	html += "<section class='p-0 overflow-visible'>";
            	html += "<div class='container'>";
                html += "<div class='row'>";
                html += "<div class='col-12 px-0'>";
				html += "<div class='bg-white padding-4-rem-lr padding-2-half-rem-tb padding-4-rem-tb sm-box-shadow-none sm-border-bottom border-color-medium-gray'>";
				html += "<div class='row row-cols-1 row-cols-md-3 justify-content-center xs-no-margin-lr'>";
                html += "<div class='col col-sm-12 md-no-padding sm-margin-30px-bottom'>";
                html += "<div class='feature-box padding-3-half-rem-all lg-padding-2-rem-all md-padding-1-rem-all'>";
				html += "<div class='feature-box-icon'>";
                html += "<i class='line-icon-Air-Balloon icon-medium text-fast-blue margin-35px-bottom md-margin-15px-bottom sm-margin-10px-bottom'></i>";
                html += "</div>";
				html += "<div class='feature-box-content last-paragraph-no-margin'>";
				html += "<span class='alt-font font-weight-500 margin-10px-bottom d-block text-extra-dark-gray'>인기 상품</span>";
				html += "<p>";
				html += data['title'];
				html += " 상품이 가장 많은 관심을 끌고있습니다.";
				html += "</p>";
                html += "</div>";
                html += "</div>";
                html += "</div>";
                html += "<div class='col col-sm-12 md-no-padding sm-margin-30px-bottom'>";
                html += "<div class='feature-box padding-3-half-rem-all lg-padding-2-rem-all md-padding-1-rem-all'>";
				html += "<div class='feature-box-icon'>";
                html += "<i class='line-icon-Archery-2 icon-medium text-fast-blue margin-35px-bottom md-margin-15px-bottom sm-margin-10px-bottom'></i>";
				html += "</div>";
				html += "<div class='feature-box-content last-paragraph-no-margin'>";
				html += "<span class='alt-font font-weight-500 margin-10px-bottom d-block text-extra-dark-gray'>월별 매출</span>";
				html += "<p>";
				html += data['count'];
				html += "건의 판매량과 ";
				html += data['price'];
				html += "원의 매출을 기록하고 있습니다.</p>";
				html += "</div>";
                html += "</div>";
                html += "</div>";
                html += "<div class='col col-sm-12 md-no-padding'>";
                html += "<div class='feature-box padding-3-half-rem-all lg-padding-2-rem-all md-padding-1-rem-all'>";
				html += "<div class='feature-box-icon'>";
				html += "<i class='line-icon-Love-User icon-medium text-fast-blue margin-35px-bottom md-margin-15px-bottom sm-margin-10px-bottom'></i>";
				html += "</div>";
				html += "<div class='feature-box-content last-paragraph-no-margin'>";
				html += "<span class='alt-font font-weight-500 margin-10px-bottom d-block text-extra-dark-gray'>평균 연령대</span>";
				html += "<p>";
				html += "구매자 평균 연령대는 ";
				html += data['age'];
				html += "세 입니다.";
				html += "</p>";
				html += "</div>";
                html += "</div>";
                html += "</div>";
                html += "</div>";
                html += "</div>";
            	html += "</div>";
        		html += "</div>";
    			html += "</div>";
				html += "</section>";
				
				$("#analytics").html(html);
			}
		});
	});
</script>
	
</body>
</html>