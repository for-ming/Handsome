<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 String id = (String) session.getAttribute("id");
 int totalCart = 0;
 if(id != null){
 	totalCart = (Integer) session.getAttribute("totalCart");
 }
%>

<!doctype html>
<html>
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
	
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/icon/favicon.png">
<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/icon/favicon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="${pageContext.request.contextPath}/resources/icon/favicon.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="${pageContext.request.contextPath}/resources/icon/favicon.png">

</head>

<body data-mobile-nav-style="classic">

	<!-- start header -->
	<header>
		<!-- start navigation -->
		<nav
			class="navbar top-space navbar-expand-lg navbar-boxed navbar-light bg-light header-light fixed-top responsive-sticky">
			<div class="container-fluid nav-header-container">
				<div class="col-auto col-sm-6 col-lg-2 mr-auto pl-lg-0">
					<a class="navbar-brand" href="${pageContext.request.contextPath}/">
						<img
						src="${pageContext.request.contextPath}/resources/icon/main_logo.png"
						data-at2x="${pageContext.request.contextPath}/resources/icon/main_logo.png" class="default-logo" alt="">
						<img
						src="${pageContext.request.contextPath}/resources/icon/main_logo.png"
						data-at2x="${pageContext.request.contextPath}/resources/icon/main_logo.png" class="alt-logo" alt="">
						<img
						src="${pageContext.request.contextPath}/resources/icon/main_logo.png"
						data-at2x="${pageContext.request.contextPath}/resources/icon/main_logo.png" class="mobile-logo" alt="">
					</a>
				</div>
				<div class="col-auto menu-order px-lg-0">
					<button class="navbar-toggler float-right" type="button"
						data-toggle="collapse" data-target="#navbarNav"
						aria-controls="navbarNav" aria-label="Toggle navigation">
						<span class="navbar-toggler-line"></span> <span
							class="navbar-toggler-line"></span> <span
							class="navbar-toggler-line"></span> <span
							class="navbar-toggler-line"></span>
					</button>
					<div class=" collapse navbar-collapse justify-content-center"
						id="navbarNav">
						<ul class="navbar-nav alt-font">
							<li class="nav-item dropdown megamenu"><a href="${pageContext.request.contextPath}/"
								class="nav-link"><b>Home</b></a> <i
								class="fa fa-angle-down dropdown-toggle" data-toggle="dropdown"
								aria-hidden="true"></i></li>
							<li class="nav-item dropdown simple-dropdown"><a href="${pageContext.request.contextPath}/recommend"
								class="nav-link"><b>추천상품</b></a></li>
							<li class="nav-item dropdown megamenu"><a href="#"
								class="nav-link"><b>브랜드</b></a> <i
								class="fa fa-angle-down dropdown-toggle" data-toggle="dropdown"
								aria-hidden="true"></i>
								<div class="menu-back-div dropdown-menu megamenu-content"
									role="menu">
									브랜드 명을 클릭하시면 해당 브랜드 페이지로 이동합니다.<br><br>
									<div class="d-lg-flex justify-content-center">
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><b>여성 브랜드</b></li>
											<li><a href="${pageContext.request.contextPath}/brand/TIME">♡ TIME</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/MINE">♡ MINE</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/LANVIN COLLECTION">♡ LANVIN COLLECTION</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/SYSTEM">♡ SYSTEM</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/SJSJ">♡ SJSJ</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/the CASHMERE">♡ the CASHMERE</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/CLUB MONACO">♡ CLUB MONACO</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/LATT">♡ LÄTT</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/OBZEE">♡ OBZEE</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/O'2nd">♡ O'2nd</a></li>
										</ul>
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><b>남성 브랜드</b></li>
											<li><a href="${pageContext.request.contextPath}/brand/TIME HOMME">♡ TIME HOMME</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/SYSTEM HOMME">♡ SYSTEM HOMME</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/the CASHMERE">♡ the CASHMERE</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/CLUB MONACO">♡ CLUB MONACO</a></li>
										</ul>
									</div>
								</div></li>
							<li class="nav-item dropdown megamenu"><a href="${pageContext.request.contextPath}/category/w"
								class="nav-link"><b>여성</b></a> <i
								class="fa fa-angle-down dropdown-toggle" data-toggle="dropdown"
								aria-hidden="true"></i>
								<div class="menu-back-div dropdown-menu megamenu-content"
									role="menu">
									<div class="d-lg-flex justify-content-center">
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><a href="${pageContext.request.contextPath}/category/w"><b>전체보기</b></a></li>
										</ul>
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><a href="${pageContext.request.contextPath}/category/w/1"><b>아우터</b></a></li>
											<li><a href="${pageContext.request.contextPath}/category/w/1/1">재킷</a></li>
											<li><a href="${pageContext.request.contextPath}/category/w/1/2">점퍼</a></li>
											<li><a href="${pageContext.request.contextPath}/category/w/1/3">가디건/베스트</a></li>
											<li><a href="${pageContext.request.contextPath}/category/w/1/4">트렌치 코트</a></li>
											<li><a href="${pageContext.request.contextPath}/category/w/1/5">코트</a></li>
											<li><a href="${pageContext.request.contextPath}/category/w/1/6">다운/패딩</a></li>
										</ul>
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><a href="${pageContext.request.contextPath}/category/w/2"><b>탑</b></a></li>
											<li><a href="${pageContext.request.contextPath}/category/w/2/7">티셔츠</a></li>
											<li><a href="${pageContext.request.contextPath}/category/w/2/8">블라우스</a></li>
											<li><a href="${pageContext.request.contextPath}/category/w/2/9">셔츠</a></li>
											<li><a href="${pageContext.request.contextPath}/category/w/2/10">니트</a></li>
										</ul>
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><a href="${pageContext.request.contextPath}/category/w/3"><b>드레스</b></a></li>
											<li><a href="${pageContext.request.contextPath}/category/w/3/11">미니 드레스</a></li>
											<li><a href="${pageContext.request.contextPath}/category/w/3/12">미디 드레스</a></li>
											<li><a href="${pageContext.request.contextPath}/category/w/3/13">롱/맥시 드레스</a></li>
										</ul>
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><a href="${pageContext.request.contextPath}/category/w/4"><b>팬츠</b></a></li>
											<li><a href="${pageContext.request.contextPath}/category/w/4/14">캐주얼</a></li>
											<li><a href="${pageContext.request.contextPath}/category/w/4/15">포멀</a></li>
											<li><a href="${pageContext.request.contextPath}/category/w/4/16">데님</a></li>
											<li><a href="${pageContext.request.contextPath}/category/w/4/17">쇼츠</a></li>
										</ul>
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><a href="${pageContext.request.contextPath}/category/w/5"><b>스커트</b></a></li>
											<li><a href="${pageContext.request.contextPath}/category/w/5/18">미니 스커트</a></li>
											<li><a href="${pageContext.request.contextPath}/category/w/5/19">펜슬 스커트</a></li>
											<li><a href="${pageContext.request.contextPath}/category/w/5/20">플레어 스커트</a></li>
											<li><a href="${pageContext.request.contextPath}/category/w/5/21">롱/맥시 스커트</a></li>
										</ul>
									</div>
								</div></li>
							<li class="nav-item dropdown megamenu"><a href="${pageContext.request.contextPath}/category/m"
								class="nav-link"><b>남성</b></a> <i
								class="fa fa-angle-down dropdown-toggle" data-toggle="dropdown"
								aria-hidden="true"></i>
								<div class="menu-back-div dropdown-menu megamenu-content"
									role="menu">
									<div class="d-lg-flex justify-content-center">
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><a href="${pageContext.request.contextPath}/category/m"><b>전체보기</b></a></li>
										</ul>
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><a href="${pageContext.request.contextPath}/category/m/1"><b>아우터</b></a></li>
											<li><a href="${pageContext.request.contextPath}/category/m/1/1">재킷</a></li>
											<li><a href="${pageContext.request.contextPath}/category/m/1/2">점퍼</a></li>
											<li><a href="${pageContext.request.contextPath}/category/m/1/3">가디건/베스트</a></li>
											<li><a href="${pageContext.request.contextPath}/category/m/1/4">트렌치 코트</a></li>
											<li><a href="${pageContext.request.contextPath}/category/m/1/5">코트</a></li>
											<li><a href="${pageContext.request.contextPath}/category/m/1/6">다운/패딩</a></li>
										</ul>
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><a href="${pageContext.request.contextPath}/category/m/2"><b>탑</b></a></li>
											<li><a href="${pageContext.request.contextPath}/category/m/2/7">티셔츠</a></li>
											<li><a href="${pageContext.request.contextPath}/category/m/2/9">셔츠</a></li>
										</ul>
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><a href="${pageContext.request.contextPath}/category/m/4"><b>팬츠</b></a></li>
											<li><a href="${pageContext.request.contextPath}/category/m/4/22">루즈/테이퍼드</a></li>
											<li><a href="${pageContext.request.contextPath}/category/m/4/23">슬림/스트레이트</a></li>
											<li><a href="${pageContext.request.contextPath}/category/m/4/16">데님</a></li>
											<li><a href="${pageContext.request.contextPath}/category/m/4/17">쇼츠</a></li>
										</ul>

									</div>
								</div></li>
							<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
							<li class="nav-item dropdown simple-dropdown"><a href="${pageContext.request.contextPath}/barcode"
								class="nav-link"><img
									src="${pageContext.request.contextPath}/resources/icon/barcode-scanner.png"
									width="22"></a>
								<ul class="dropdown-menu alt-font">
									<li>바코드 스캐너를 이용해 상품을 장바구니에 등록해보세요!</li>
									<li><img
										src="${pageContext.request.contextPath}/resources/icon/barcode-scanner-info.png"></li>
								</ul></li>
							<c:if test="${empty id}">
							<li class="nav-item dropdown simple-dropdown"><a href="${pageContext.request.contextPath}/member/signin"
								class="nav-link">Login</a></li>
							</c:if>
							<c:if test="${not empty id}">
							<li class="nav-item dropdown simple-dropdown"><a href="${pageContext.request.contextPath}/member/signout"
								class="nav-link">Logout</a></li>
							</c:if>
							<c:if test="${not empty id}">
							<li class="nav-item dropdown simple-dropdown"><a href="${pageContext.request.contextPath}/mypage"								class="nav-link">MyPage<i class="fas fa-angle-down"></i></a>
								<ul class="dropdown-menu alt-font">
									<li><a href="${pageContext.request.contextPath}/mypage/order" title="주문조회">주문조회</a></li>
									<li><a href="${pageContext.request.contextPath}/mypage" title="내정보조회">내정보조회</a></li>
								</ul></li>
							</c:if>
						</ul>
					</div>
				</div>
				<div class="col-auto text-right pr-0 font-size-0">
<!-- 					<div class="header-search-icon search-form-wrapper"> -->
<%-- 						<a href="${pageContext.request.contextPath}/adminLogin"><img src="${pageContext.request.contextPath}/resources/icon/admin.png" width="20"> --%>
<!-- 						</a> -->
<!-- 					</div> -->
					<div class="header-search-icon search-form-wrapper">
						<a href="javascript:void(0)"
							class="search-form-icon header-search-form"><i
							class="feather icon-feather-search"></i></a>
						<!-- start search input -->
						<div class="form-wrapper">
							<button title="Close" type="button" class="search-close alt-font">×</button>
							<form method="POST" action="${pageContext.request.contextPath}/product/search" id="search-form" role="search" method="get"
								class="search-form text-left" action="search-result.html">
								<div class="search-form-box">
									<span
										class="search-label alt-font text-small text-uppercase text-medium-gray">찾으시는 상품의 이름을 검색하세요.</span> <input class="search-input alt-font"
										id="product_title"
										placeholder="검색어를 입력하세요..." name="product_title" value=""
										type="text" autocomplete="off">
									<button type="submit" class="search-button">
										<i class="feather icon-feather-search" aria-hidden="true"></i>
									</button>
								</div>
							</form>
						</div>
						<!-- end search input -->
					</div>
					<div class="header-language dropdown">
						<a href="javascript:void(0);"><i
							class="feather icon-feather-globe"></i></a>
						<ul class="dropdown-menu alt-font">
							<li><a href="javascript:void(0);" title="English"><span
									class="icon-country"><img
										src="${pageContext.request.contextPath}/resources/images/country-flag-16X16/usa.png"
										alt=""></span>English</a></li>
							<li><a href="javascript:void(0);" title="South Korea"><span
									class="icon-country"><img
										src="${pageContext.request.contextPath}/resources/images/country-flag-16X16/South Korea.png"
										alt=""></span>한국어</a></li>
							<li><a href="javascript:void(0);" title="china"><span
									class="icon-country"><img
										src="${pageContext.request.contextPath}/resources/images/country-flag-16X16/china.png"
										alt=""></span>中文</a></li>
						</ul>
					</div>
					<div class="header-cart-icon dropdown">
						<a href="${pageContext.request.contextPath}/cart"><i class="feather icon-feather-shopping-bag"></i>
 						<% if(totalCart == 0){%><%} else {%>
 						<span class="cart-count alt-font bg-tussock text-white"> <%=totalCart%><%} %></span>
						</a>
						<ul class="dropdown-menu cart-item-list">
							<li class="cart-item cart-total">
							<c:if test="${not empty id}">
								<a href="${pageContext.request.contextPath}/cart" class="btn btn-small btn-light-gray">쇼핑백</a>
								<a href="${pageContext.request.contextPath}/checkout" class="btn btn-small btn-tussock">주문하기</a>
							</c:if>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</nav>
		<!-- end navigation -->
	</header>
	<!-- end header -->

	<!-- start scroll to top -->
	<a class="scroll-top-arrow" href="javascript:void(0);"><i
		class="feather icon-feather-arrow-up"></i></a>
	<!-- end scroll to top -->
	<!-- javascript -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/theme-vendors.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	<script type="text/javascript">
		$(function() {
			deviceCheck();
		});

		function deviceCheck() {
			// 디바이스 종류 설정
			var Device = "win16|win32|win64|mac|macintel";

			// 접속한 디바이스 환경
			if (navigator.platform) {
				if (Device.indexOf(navigator.platform.toLowerCase()) < 0) {
					//alert("MOBILE");
				} else {
					//alert("PC");
				}
			}
		}
	</script>
</body>
</html>