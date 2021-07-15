<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!doctype html>
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
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/member/font-icons.min.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/member/theme-vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/member/style.css" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/member/responsive.css" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/admin/signin.css" />
</head>
<body data-mobile-nav-style="classic">
	<!-- start section -->
	<section class="wow animate__fadeIn" style="padding-bottom: 0px;">
		<div class="container">
			<div class="row justify-content-center">
				<div
					class="col-12 col-xl-5 col-md-6 lg-padding-30px-lr md-padding-15px-lr sm-margin-40px-bottom">
					<h6
						class="alt-font font-weight-500 text-extra-dark-gray text-gradient-sky-blue-pink">Login</h6>
					<form action="${contextPath}/adminSigninAction"
						class="border-all border-color-medium-gray padding-4-rem-all lg-margin-35px-top md-padding-2-half-rem-all was-validated"
						method="POST">
						<div class="form-group">
							<label class="margin-15px-bottom">아이디</label>
							<div class="flexdisplay">
								<input type="text" id="uid" class="inputcontainer"
									placeholder="아이디 입력" name="id" required>
							</div>
						</div>
						<div class="form-group">
							<label class="margin-15px-bottom">비밀번호</label>
							<div class="flexdisplay">
								<input type="password" id="upassword" class="inputcontainer"
									placeholder="비밀번호 입력" name="password" required>
							</div>
						</div>
						<div class="form-group ">
							<button type="submit"
								class="btn btn-medium btn-primary w-100 btn-fancy background"
								id="loginbutton">로그인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- end section -->
	<!-- start footer -->
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
						<a href="http://www.thehandsome.com"
							class="text-extra-dark-gray alt-font text-medium">www.thehandsome.com</a>
					</div>
				</div>
				<!-- end feature box item-->
			</div>
		</div>
	</section>
	<!-- end footer -->
	<!-- start scroll to top -->
	<a class="scroll-top-arrow" href="javascript:void(0);"><i
		class="feather icon-feather-arrow-up"></i></a>
	<!-- end scroll to top -->
	<!-- javascript -->
	<script type="text/javascript"
		src="${contextPath}/resources/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${contextPath}/resources/js/theme-vendors.min.js"></script>
	<script type="text/javascript"
		src="${contextPath}/resources/js/main.js"></script>
</body>
</html>