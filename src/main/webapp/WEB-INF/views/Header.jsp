<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String id = (String) session.getAttribute("id");
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
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.png">
<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/images/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="${pageContext.request.contextPath}/resources/images/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="${pageContext.request.contextPath}/resources/images/apple-touch-icon-114x114.png">
<!-- style sheets and font icons  -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/font-icons.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/theme-vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/responsive.css" />
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
						data-at2x="images/logo-white@2x.png" class="default-logo" alt="">
						<img
						src="${pageContext.request.contextPath}/resources/icon/main_logo.png"
						data-at2x="images/logo-white@2x.png" class="alt-logo" alt="">
						<img
						src="${pageContext.request.contextPath}/resources/icon/main_logo.png"
						data-at2x="images/logo-white@2x.png" class="mobile-logo" alt="">
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
							<li class="nav-item dropdown simple-dropdown"><a href="${pageContext.request.contextPath}/"
								class="nav-link"><b>추천상품</b></a></li>
							<li class="nav-item dropdown megamenu"><a href="${pageContext.request.contextPath}/brand"
								class="nav-link"><b>브랜드</b></a> <i
								class="fa fa-angle-down dropdown-toggle" data-toggle="dropdown"
								aria-hidden="true"></i>
								<div class="menu-back-div dropdown-menu megamenu-content"
									role="menu">
									브랜드 명을 클릭하시면 해당 브랜드 페이지로 이동합니다.<br><br>
									<div class="d-lg-flex justify-content-center">
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><b>여성 브랜드</b></li>
											<li><a href="${pageContext.request.contextPath}/brand/time">♡ TIME</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/mine">♡ MINE</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/lanvinCollection">♡ LANVIN COLLECTION</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/system">♡ SYSTEM</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/sjsj">♡ SJSJ</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/theCashmere">♡ the CASHMERE</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/clubMonaco">♡ CLUB MONACO</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/latt">♡ LÄTT</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/obzee">♡ OBZEE</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/o'2nd">♡ O'2nd</a></li>
										</ul>
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><b>남성 브랜드</b></li>
											<li><a href="${pageContext.request.contextPath}/brand/timeHomme">♡ TIME HOMME</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/systemHomme">♡ SYSTEM HOMME</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/theCashmere">♡ the CASHMERE</a></li>
											<li><a href="${pageContext.request.contextPath}/brand/clubMonaco">♡ CLUB MONACO</a></li>
										</ul>
									</div>
								</div></li>
							<li class="nav-item dropdown megamenu"><a href="${pageContext.request.contextPath}/woman"
								class="nav-link"><b>여성</b></a> <i
								class="fa fa-angle-down dropdown-toggle" data-toggle="dropdown"
								aria-hidden="true"></i>
								<div class="menu-back-div dropdown-menu megamenu-content"
									role="menu">
									<div class="d-lg-flex justify-content-center">
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><a href="${pageContext.request.contextPath}/woman"><b>전체보기</b></a></li>
										</ul>
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><a href="${pageContext.request.contextPath}/woman/outer"><b>아우터</b></a></li>
											<li><a href="${pageContext.request.contextPath}/woman/outer/jacket">재킷</a></li>
											<li><a href="${pageContext.request.contextPath}/woman/outer/jumper">점퍼</a></li>
											<li><a href="${pageContext.request.contextPath}/woman/outer/cardigan">가디건/베스트</a></li>
											<li><a href="${pageContext.request.contextPath}/woman/outer/trenchCoat">트렌치 코트</a></li>
											<li><a href="${pageContext.request.contextPath}/woman/outer/coat">코트</a></li>
											<li><a href="${pageContext.request.contextPath}/woman/outer/paddedCoat">다운/패딩</a></li>
										</ul>
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><a href="${pageContext.request.contextPath}/woman/top"><b>탑</b></a></li>
											<li><a href="${pageContext.request.contextPath}/woman/top/T-shirt">티셔츠</a></li>
											<li><a href="${pageContext.request.contextPath}/woman/top/blouse">블라우스</a></li>
											<li><a href="${pageContext.request.contextPath}/woman/top/shirt">셔츠</a></li>
											<li><a href="${pageContext.request.contextPath}/woman/top/knit">니트</a></li>
										</ul>
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><a href="${pageContext.request.contextPath}/woman/dress"><b>드레스</b></a></li>
											<li><a href="${pageContext.request.contextPath}/woman/dress/miniDress">미니 드레스</a></li>
											<li><a href="${pageContext.request.contextPath}/woman/dress/midiDress">미디 드레스</a></li>
											<li><a href="${pageContext.request.contextPath}/woman/dress/longDress">롱/맥시 드레스</a></li>
										</ul>
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><a href="${pageContext.request.contextPath}/woman/pants"><b>팬츠</b></a></li>
											<li><a href="${pageContext.request.contextPath}/woman/pants/casual">캐주얼</a></li>
											<li><a href="${pageContext.request.contextPath}/woman/pants/formal">포멀</a></li>
											<li><a href="${pageContext.request.contextPath}/woman/pants/denim">데님</a></li>
											<li><a href="${pageContext.request.contextPath}/woman/pants/shorts">쇼츠</a></li>
										</ul>
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><a href="${pageContext.request.contextPath}/woman/skirt"><b>스커트</b></a></li>
											<li><a href="${pageContext.request.contextPath}/woman/skirt/miniSkirt">미니 스커트</a></li>
											<li><a href="${pageContext.request.contextPath}/woman/skirt/pencilSkirt">펜슬 스커트</a></li>
											<li><a href="${pageContext.request.contextPath}/woman/skirt/flaredSkirt">플레어 스커트</a></li>
											<li><a href="${pageContext.request.contextPath}/woman/skirt/longSkirt">롱/맥시 스커트</a></li>
										</ul>
									</div>
								</div></li>
							<li class="nav-item dropdown megamenu"><a href="${pageContext.request.contextPath}/man"
								class="nav-link"><b>남성</b></a> <i
								class="fa fa-angle-down dropdown-toggle" data-toggle="dropdown"
								aria-hidden="true"></i>
								<div class="menu-back-div dropdown-menu megamenu-content"
									role="menu">
									<div class="d-lg-flex justify-content-center">
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><a href="${pageContext.request.contextPath}/man"><b>전체보기</b></a></li>
										</ul>
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><a href="${pageContext.request.contextPath}/man/outer"><b>아우터</b></a></li>
											<li><a href="${pageContext.request.contextPath}/man/outer/jacket">재킷</a></li>
											<li><a href="${pageContext.request.contextPath}/man/outer/jumper">점퍼</a></li>
											<li><a href="${pageContext.request.contextPath}/man/outer/cardigan">가디건/베스트</a></li>
											<li><a href="${pageContext.request.contextPath}/man/outer/trenchCoat">트렌치 코트</a></li>
											<li><a href="${pageContext.request.contextPath}/man/outer/coat">코트</a></li>
											<li><a href="${pageContext.request.contextPath}/man/outer/paddedCoat">다운/패딩</a></li>
										</ul>
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><a href="${pageContext.request.contextPath}/man/top"><b>탑</b></a></li>
											<li><a href="${pageContext.request.contextPath}/man/top/T-shirt">티셔츠</a></li>
											<li><a href="${pageContext.request.contextPath}/man/top/shirt">셔츠</a></li>
											<li><a href="${pageContext.request.contextPath}/man/top/knit">니트</a></li>
										</ul>
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><a href="${pageContext.request.contextPath}/man/pants"><b>팬츠</b></a></li>
											<li><a href="${pageContext.request.contextPath}/man/pants/tapered">루즈/테이퍼드</a></li>
											<li><a href="${pageContext.request.contextPath}/man/pants/straight">슬림/스트레이트</a></li>
											<li><a href="${pageContext.request.contextPath}/man/pants/denim">데님</a></li>
											<li><a href="${pageContext.request.contextPath}/man/pants/shorts">쇼츠</a></li>
										</ul>
										<ul class="d-lg-inline-block">
											<li class="dropdown-header"><a href="${pageContext.request.contextPath}/man/suit"><b>수트</b></a></li>
											<li><a href="${pageContext.request.contextPath}/man/suit/dressShirt">루즈/테이퍼드</a></li>
											<li><a href="${pageContext.request.contextPath}/man/suit/suitJacket">슬림/스트레이트</a></li>
											<li><a href="${pageContext.request.contextPath}/man/suit/suitPants">데님</a></li>
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
									<li><img src="${pageContext.request.contextPath}/resources/icon/barcode-scanner-info.png"></li>
								</ul></li>
							<c:if test="${empty session.id}">
							<li class="nav-item dropdown simple-dropdown"><a href="${pageContext.request.contextPath}/login"
								class="nav-link">Login</a></li>
							</c:if>
							<c:if test="${not empty session.id}">
							<li class="nav-item dropdown simple-dropdown"><a href="${pageContext.request.contextPath}/logout"
								class="nav-link">Logout</a></li>
							</c:if>
							<li class="nav-item dropdown simple-dropdown"><a href="${pageContext.request.contextPath}/mypage"
								class="nav-link">MyPage<i class="fas fa-angle-down"></i></a>
								<ul class="dropdown-menu alt-font">
									<li><a href="${pageContext.request.contextPath}/mypage/order" title="주문조회">주문조회</a></li>
									<li><a href="${pageContext.request.contextPath}/mypage" title="내정보조회">내정보조회</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
				<div class="col-auto text-right pr-0 font-size-0">
					<div class="header-search-icon search-form-wrapper">
						<a href="${pageContext.request.contextPath}/adminLogin"><img src="${pageContext.request.contextPath}/resources/icon/admin.png" width="20">
						</a>
					</div>
					<div class="header-search-icon search-form-wrapper">
						<a href="javascript:void(0)"
							class="search-form-icon header-search-form"><i
							class="feather icon-feather-search"></i></a>
						<!-- start search input -->
						<div class="form-wrapper">
							<button title="Close" type="button" class="search-close alt-font">×</button>
							<form id="search-form" role="search" method="get"
								class="search-form text-left" action="search-result.html">
								<div class="search-form-box">
									<span
										class="search-label alt-font text-small text-uppercase text-medium-gray">What
										are you looking for?</span> <input class="search-input alt-font"
										id="search-form-input5e219ef164995"
										placeholder="Enter your keywords..." name="s" value=""
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
						<a href="${pageContext.request.contextPath}/cart"><i class="feather icon-feather-shopping-bag"></i><span
							class="cart-count alt-font bg-fast-blue text-white">2</span></a>
						<ul class="dropdown-menu cart-item-list">
							<li class="cart-item align-items-center"><a
								href="javascript:void(0);" class="alt-font close">×</a>
								<div class="product-image">
									<a href="single-product.html"><img
										src="https://placehold.it/150x191" class="cart-thumb" alt="" /></a>
								</div>
								<div class="product-detail alt-font">
									<a href="single-product.html">Delica Omtantur</a> <span
										class="item-ammount">$100.00</span>
								</div></li>
							<li class="cart-item align-items-center"><a
								href="javascript:void(0);" class="alt-font close">×</a>
								<div class="product-image">
									<a href="single-product.html"><img
										src="https://placehold.it/150x191" class="cart-thumb" alt="" /></a>
								</div>
								<div class="product-detail alt-font">
									<a href="single-product.html">Gianvito Rossi</a> 
									<span class="item-ammount">$99.99</span>
								</div></li>
							<li class="cart-item cart-total">
								<div class="alt-font margin-15px-bottom">
									<span class="w-50 d-inline-block text-medium text-uppercase">Subtotal:</span>
									<span class="w-50 d-inline-block text-right text-medium font-weight-500">$199.99</span>
								</div>
								<a href="cart" class="btn btn-small btn-dark-gray">쇼핑백</a> 
								<a href="checkout" class="btn btn-small btn-fast-blue">주문하기</a>
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