<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String user = (String) session.getAttribute("id");
%>
<c:set var="cart" value="${cartDTO}" />
<c:set var="isUser" value="${isUser}" />
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
<style>
.middle {
  position: absolute; 
  left: 50%;
  top: 50%;
  transform: translate(-50%, 50%); 
}
</style>
<body data-mobile-nav-style="classic">
	<!-- start header -->
	<header>
		<jsp:include page="Header.jsp"></jsp:include>
		<!-- end header -->
		<!-- start page title -->
		<section
			class="wow animate__fadeIn bg-light-gray padding-25px-tb page-title-medium">
			<div class="container">
				<div class="row align-items-center justify-content-center">
					<div class="col-12 col-xl-8 col-lg-6">
						<h1
							class="text-extra-dark-gray no-margin-bottom text-center text-lg-center">쇼핑백</h1>
					</div>
				</div>
			</div>
		</section>
		<!-- end page title -->
		<!-- start section -->
		<section class="wow animate__fadeIn">
			<div class="container">
				<div class="row">
					<div
						class="col-lg-8 padding-70px-right lg-padding-30px-right md-padding-15px-right">
						<div class="row align-items-center">
							<div class="col-12">
								<table
									class="table cart-products margin-60px-bottom md-margin-40px-bottom sm-no-margin-bottom">
									<form method="get" action="#">
										<thead>
											<div>
												<span>*4PM 상품은 오후 4시 이후 주문 시 일반 택배 상품으로 발송됩니다.<br></span>
											</div>
											<tr>
												<th scope="col" class="alt-font"><label><input
														type="checkbox" name="all" value="all"></label></th>
												<th scope="col" class="alt-font"></th>
												<th scope="col" class="alt-font">상품정보</th>
												<th scope="col" class="alt-font">수량</th>
												<th scope="col" class="alt-font">판매가</th>
												<th scope="col" class="alt-font">적립율</th>
												<th scope="col" class="alt-font"></th>
												<th scope="col" class="alt-font"></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><label><input type="checkbox"
														name="checkProduct" value="checkProduct"></label></td>
												<td class="product-thumbnail"><a
													href="single-product.html"><img
														class="cart-product-image"
														src="https://placehold.it/600x765" alt=""></a></td>
												<td class="product-name"><span class="variation">${cart[0].brandName}</span>
													<a href="single-product.html">${cart[0].title}</a> <span
													class="variation"> Size: ${cart[0].sizeLabel}</span> <span
													class="variation"> Color: <div style="color: #${cart[0].color}"></div></span> <a
													href="#" class="btn btn-fancy btn-small mr-0">옵션변경</a></td>
												<td class="product-quantity" data-title="Quantity">
													<div class="quantity">
														<label class="screen-reader-text">수량</label> <input
															type="button" value="-" class="qty-minus qty-btn"
															data-quantity="minus" data-field="quantity"> <input
															class="input-text qty-text" type="number" name="quantity"
															value="1"> <input type="button" value="+"
															class="qty-plus qty-btn" data-quantity="plus"
															data-field="quantity"> <a href="#"
															class="btn btn-fancy btn-small mr-0">변경</a>
													</div>
												</td>
												<td class="product-price" data-title="Price">${cart[0].price}</td>
												<td class="product-name" data-title="point">5% (한섬마일리지) 0.1% (H.Point)</td>
												<td class="product-name" data-title="option">
												<a href="#" class="btn apply-coupon-btn text-uppercase btn-transparent-tussock">&hearts;</a>
												</td>
												<td><a href="#" class="btn apply-coupon-btn text-uppercase">&times;</a></td>
											</tr>
										</tbody>
									</form>
								</table>
							</div>
							<div
								class="col-md-6 text-center text-md-right md-margin-50px-bottom btn-dual">
								<a href="#"
									class="btn btn-fancy btn-small btn-transparent-light-gray">선택
									상품 삭제</a> <a href="#"
									class="btn btn-fancy btn-small btn-transparent-light-gray mr-0">선택
									상품 주문하기</a>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div
							class="bg-light-gray padding-50px-all lg-padding-30px-tb lg-padding-20px-lr md-padding-20px-tb">
							<span
								class="alt-font text-large text-extra-dark-gray margin-15px-bottom d-inline-block font-weight-500">Totals</span>
							<table class="w-100 total-price-table">
								<tbody>
									<tr>
										<th class="w-50 font-weight-500 text-extra-dark-gray">상품
											합계</th>
										<td class="text-extra-dark-gray">￦405.00</td>
									</tr>
									<tr class="shipping">
										<th class="font-weight-500 text-extra-dark-gray">수령 방법</th>
										<td data-title="Shipping">
											<ul
												class="float-lg-left float-right text-left line-height-36px">
												<li class="d-flex align-items-center md-margin-15px-bottom">
													<input id="free_shipping" type="radio"
													name="shipping-option"
													class="d-block w-auto margin-10px-right mb-0"
													checked="checked"> <label
													class="md-line-height-18px" for="free_shipping">일반
														택배</label>
												</li>
												<li class="d-flex align-items-center"><input
													id="local_pickup" type="radio" name="shipping-option"
													class="d-block w-auto margin-10px-right mb-0"> <label
													class="md-line-height-18px" for="local_pickup">매장
														수령</label></li>
											</ul>
										</td>
									</tr>
									<tr class="calculate-shipping">
										<th colspan="2" class="font-weight-500"><a
											class="d-block calculate-shipping-title accordion-toggle"
											data-toggle="collapse" href="#shipping-accordion"
											aria-expanded="false">
												<p class="w-100 mb-0 text-left">주문 지점 선택</p>
										</a>
											<div id="shipping-accordion" class="address-block collapse">
												<div class="margin-15px-top">
													<select>
														<option>수령 지점 선택</option>
														<option value="online">온라인</option>
														<option value="Afganistan">Afghanistan</option>
														<option value="Albania">Albania</option>
														<option value="Algeria">Algeria</option>
													</select> <select>
														<option>픽업 시간 선택</option>
														<option value="Morning">09:00AM - 12:00PM</option>
														<option value="Afternoon">12:00PM - 16:00PM</option>
														<option value="Evening">16:00PM - 20:00PM</option>
														<option value="ETC">그 외</option>
													</select> <a href="#" class="btn btn-dark-gray btn-small d-block">선택하기</a>
												</div>
											</div></th>
									</tr>
									<tr class="total-amount">
										<th class="font-weight-500 text-extra-dark-gray">합계</th>
										<td data-title="Total">
											<h6 class="d-block font-weight-500 mb-0 text-extra-dark-gray">￦</h6>
											<span class="text-small text-extra-medium-gray">(3만원
												이상 무료배송)</span>
										</td>
									</tr>
								</tbody>
							</table>
							<div>
								<a href="checkout"
									class="btn btn-dark-gray btn-large d-block btn-fancy margin-15px-top">주문하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- end section -->
		<hr>
		<div class="middle">
		<table>
				<b class="text-extra-dark-gray no-margin-bottom text-center text-lg-left">PROMOTION 혜택</b><br><br>
				<th>
					<strong>혜택 1 / 300,000원 이상 구매하신 고객님께 사은품을 드립니다. </strong>
				</th>
				<th>
					<strong>혜택 2 / 100,000원 이상 구매하신 고객님께 사은품을 드립니다. </strong>
				</th>
				<tr>
					<td>
					<ul>
						<img src="${pageContext.request.contextPath}/resources/icon/sample1.png">
						<li>사은품 : SYSTEM 블랙 스트링 브레이스릿</li>
						<li>SYSTEM 온라인 익스클루시브 주얼리 포함 시스템 (정상) 실결제 30만원 이상 구매하신 고객님께
							"SYSTEM 블랙 스트링 브레이스릿"을 드립니다. <br>기간 : 07월 01일 ~ 07월 18일<br>*아울렛
							제외, 실결제 30만원 이상(※1인 1개 제한)<br>사은품은 이벤트 종료 후, 취소 및 반품을 고려하여
							8월 2일 이후 일괄 발송 예정입니다. (1~3일 지연 가능)
						</li>
					</ul>
					</td>
					<td>
					<ul>
						<img src="${pageContext.request.contextPath}/resources/icon/sample2.png">
						<li>사은품 : BEIGIC 5/10만원 구매 시 머그/머그+로션</li>
						<li>더캐시미어띵즈 내 BEIGIC 상품을 5/10만원 이상 구매하신 고객님께 "머그/머그+로션 30ml"를
							드립니다.<br>기간 : 06월 23일~소진 시 까지<br>*5만원 이상~10만원 미만 구매
							고객에게는 머그, 10만원 이상 고객에게는 머그+로션 30ml SET를 드립니다.<br>사은품은 취소 및
							반품을 고려하여 준비 수량 소진 이후 추후 발송 예정입니다.
						</li>
					</ul>
					</td>
				</tr>
				<th>
					<strong>혜택 3 / 구매하신 고객님께 사은품을 드립니다. </strong>
				</th>
				<tr>
					<td>
					<ul>
						<img src="${pageContext.request.contextPath}/resources/icon/sample3.png">
						<li>사은품 : BEIGIC 바디로션 2매</li>
						<li>더캐시미어띵즈 내 BEIGIC 상품을 구매하신 고객님께 "바디로션 7ml 2매"를 드립니다.<br>기간
							: 06월 23일~소진 시 까지<br>*BEIGIC 상품 필수 구매<br>사은품은 주문하신 상품과
							함께 동봉하여 발송될 예정입니다.
						</li>
					</ul>
					</td>
				</tr>
		</table>
		<hr>
		<table>
			<th class="text-extra-dark-gray no-margin-bottom text-center text-lg-left">쇼핑백 이용안내</th>
			<th></th>
			<tr>
				<td></td>
				<td>
				<ul class="bul_sty01_li">
						<li id="infoAddN1">4PM 상품은 오후 4시 이전에 주문 하셔야 다음날 배송이 가능하며 재고가
							소진될 경우 일반택배로 주문하실 수 있습니다.</li>
						<li id="infoAddN2">3만원 구매 시 무료 배송됩니다. 3만원 미만 구매 시 배송비 2,500원이
							추가되며, 도서산간 지역으로 배송을 원하실 경우<br>배송비가 추가될 수 있습니다.
						</li>
						<li>쇼핑백에 담긴 상품은 30일 동안 보관됩니다. 30일이 지난 상품 자동 삭제됩니다.<br>더
							오래 보관하고 싶은 상품은 위시리스트에 담아주세요.
						</li>
						<li>쇼핑백에 최대 50개까지 상품 보관이 가능하며, 실제 구매 시에는 가격이나 혜택이 변동될 수 있습니다.</li>

						<li>쇼핑백에 담은 상품이 판매종료가 되었을 경우 자동 삭제 됩니다.</li>
						<li>쿠폰은 배송&amp;결제정보 화면에서 입력 할 수 있습니다.</li>
						<li>상품별 지급율에 따라 한섬마일리지 및 H.POINT가 적립됩니다. 배송완료 10일 이후 적립되며 실
							결제금액기준입니다.</li>
						<li>해외 배송을 원할 경우 더한섬닷컴의 영문 혹은 중문 서비스를 이용해 주시기 바랍니다.</li>
					</ul>
					<td>
			</tr>
		</table>
		</div>
		<!-- start footer -->
		<!-- end footer -->
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
</body>
</html>