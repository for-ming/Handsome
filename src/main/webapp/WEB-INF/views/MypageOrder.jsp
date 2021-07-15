<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String user = (String) session.getAttribute("id");
int orderCount = 0;
if(user != null){
	orderCount = (Integer) session.getAttribute("orderCount");
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
	
<!-- style sheets and font icons  -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-icons.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/theme-vendors.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/responsive.css" />

<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>

$(function() {
	noneDisplay();
});

function noneDisplay(){
	var orderCount = '<%=orderCount%>';
	if(orderCount == 0){
		document.getElementById('order_table_none').innerText = "주문 내역이 존재하지 않습니다.";
	}
}

function create_barcode(pid){
	var bid="#barcode" + pid;
	var barcode_value;
	$("button[name=createBarcode]").each(function(index, item){
		barcode_value = $(item).attr("value");
	});
	
	Swal.fire('수령증 발급 완료',"<div id='barcode' class='text-center margin-30px-left'></div>", 'success');
	$('#barcode').barcode(barcode_value, "code93")
}

</script>

<style>
.bh{font-family: 'Black Han Sans', sans-serif; }
.dh{font-family: 'Do Hyeon', sans-serif;}
</style>

</head>

<body data-mobile-nav-style="classic">
<!-- start header -->
<jsp:include page="Header.jsp"></jsp:include>
<!-- end header -->

<!-- Page Content -->
<div class="container">
<!-- Page Heading/Breadcrumbs -->
<section class="page-title-medium padding-40px-top padding-10px-bottom" >
	<div class="row align-items-left justify-content-left">
		<div class="col-lg-3">
			<h1 lass="text-extra-dark-gray no-margin-bottom text-center ">
				<label class="text-extra-dark-gray font-weight-500 alt-font text-uppercase">Mypage</label>
			</h1>
			<label class="text-extra-dark-gray text-medium font-weight-500 alt-font text-uppercase">THE HANDSOME.COM</label>
		</div>
	</div>
</section>

<!-- Content Row -->
<div class="row">
	<!-- Sidebar Column -->
	<div class="col-lg-3 mb-4">
		<div class="list-group">
			<b>
			<a href="${pageContext.request.contextPath}/mypage" class="list-group-item">홈</a>
			<a href="${pageContext.request.contextPath}/mypage" class="list-group-item">내 정보</a>
			<a href="${pageContext.request.contextPath}/mypage/order"	class=" list-group-item">주문내역</a> 
			<a href="${pageContext.request.contextPath}/mypage" class="list-group-item">찜 &hearts; 목록</a> 
			<a href="${pageContext.request.contextPath}/mypage" class="list-group-item">내가 쓴 리뷰</a>
			<a href="${pageContext.request.contextPath}/recommend"	class="list-group-item">나만의 추천 상품</a> 
			</b> 
		</div>
	</div>
	<!-- Content Column -->
	<div class="col-lg-9 mb-4">
		<h2>
			<label class=" bh text-extra-dark-gray title-small font-weight-500 alt-font text-uppercase">주문내역</label>
		</h2>
		<div class="bg-extra-light-gray margin-50px-bottom h-1px"></div>
		<div class="jumbotron margin-10px-bottom" style="height: 80%; background-color: #FFFFFF;">
			<c:set var="product" value="${productlist}"/>
			<c:forEach var="buying" items="${buyinglist}" varStatus="status">
			<span class="variation">
				<label class="text-dark-gray text-medium font-weight-500 alt-font text-uppercase w-60px">주문일자</label>
				<label class="text-medium text-dark-gray alt-font text-uppercase"> ${fn:substring(buying.purchase_date,0,10)}</label><br/>
				<label class="dh text-extra-dark-gray text-extra-medium font-weight-500 alt-font text-uppercase">
				[${product[status.index].brandname}] ${product[status.index].title}
				</label>
			</span>
			<div class="margin-4-rem-bottom">
				<div class="row">
					<div class="col-lg-4">
						<a href="${pageContext.request.contextPath}/productdetail/${buying.product_id}"><img style="width:50%;" src="${pageContext.request.contextPath}/resources/images/product/${product[status.index].sex}/${product[status.index].maincategory_id}/${product[status.index].subcategory_id}/${product[status.index].imagepath}.jpg" alt=""></a>
					</div>
				<div class="col-lg-4">
					<label class="text-extra-dark-gray text-small font-weight-500 alt-font text-uppercase margin-15px-top margin-10px-bottom">SIZE</label>&nbsp;&nbsp;&nbsp;
					<ul class="text-extra-small shop-size">
						<li><input class="d-none" type="radio" id="size-1" name="size"/>
						<label for="size-1"	lass="width-80"><span>${buying.sizelabel}</span></label>
						</li>
					</ul><br>
					<label class="text-extra-dark-gray text-small font-weight-500 alt-font text-uppercase margin-15px-top margin-10px-bottom">COLOR</label>
					<ul class="alt-font shop-color">
						<li><input class="d-none" type="radio" id="color-1" name="color"/> 
						<label for="color-1"> <span style="background-color: #${buying.color} "></span></label>
						</li>
					</ul><br>
					<label class="text-extra-dark-gray text-small font-weight-500 alt-font text-uppercase margin-15px-top margin-10px-bottom">주문 수량 : ${buying.quantity}</label><br>
					<label class="text-extra-dark-gray text-small font-weight-500 alt-font text-uppercase margin-15px-top margin-10px-bottom">결제 금액 : ￦<fmt:formatNumber pattern="###,###,###" value="${product[status.index].price * buying.quantity}" /></label>
				</div>
				<div class="col-lg-3 margin-50px-left">
				<label class="text-dark-gray text-medium font-weight-500 alt-font text-uppercase w-60px">주문번호</label><br>
				<label class="text-extra-dark-gray text-medium font-weight-500 alt-font text-uppercase margin-15px-top margin-10px-bottom">
				 ${fn:substring(buying.purchase_date,2,4)}${fn:substring(buying.purchase_date,5,7)}${fn:substring(buying.purchase_date,8,10)}${buying.product_id }${buying.id }
				 </label><br/>
				 <label class="text-dark-gray text-medium font-weight-500 alt-font text-uppercase w-60px margin-20px-bottom">주문상태</label><br>
				<c:choose>
					<c:when test="${buying.stock eq 0 && buying.complete eq 0}">
					<button class="btn-medium btn btn-transparent-dark-gray btn-box-shadow-flat ">상품 준비중</button>
					</c:when>
					<c:when test="${buying.stock eq 1 && buying.complete eq 0 && buying.rec_method eq 'pickup'}">
					<button class="btn-medium btn btn-dark-gray btn-box-shadow-flat " name="createBarcode" onclick="create_barcode(${buying.id});" value="${buying.product_id}/${buying.color}/${buying.sizelabel}">제품 픽업 가능</button>
					<div id="barcode${buying.id}"></div>
					</c:when>
					<c:when test="${buying.stock eq 1 && buying.complete eq 0 && buying.rec_method eq 'shipping'}">
					<button class="btn-medium btn btn-box-shadow-flat">배송 중</button>
					</c:when>
					<c:otherwise>
					<button class="btn-medium btn btn-gray btn-box-shadow-flat">전달 완료</button>
					</c:otherwise>
				</c:choose>
				</div>
				</div>
			</div>
			<div class="bg-extra-light-gray margin-50px-bottom h-1px"></div>
			</c:forEach>
			<div class="text-center margin-10px-all" id ="order_table_none"></div>
		</div>
	</div>
</div>

<!-- start footer -->
<!-- end footer -->

<!-- start scroll to top -->
<a class="scroll-top-arrow" href="javascript:void(0);"><i class="feather icon-feather-arrow-up"></i></a>
<!-- end scroll to top -->

<!-- javascript -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/theme-vendors.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-barcode.js"></script>

</body>
</html>