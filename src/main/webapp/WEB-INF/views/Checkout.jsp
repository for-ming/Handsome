<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String user = (String) session.getAttribute("id");
%>
<c:set var="member" value="${memberDTO}" />
<!doctype html>
<html>
<head>
<title>더한섬닷컴 | THE HANDSOME.COM</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="author" content="Group3">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1" />
<meta name="description" content="더한섬닷컴 | THE HANDSOME.COM">

<!-- favicon icon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png">
<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/resources/images/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="72x72" href="${pageContext.request.contextPath}/resources/images/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="${pageContext.request.contextPath}/resources/images/apple-touch-icon-114x114.png">

<!-- style sheets and font icons  -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-icons.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/theme-vendors.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/responsive.css" />

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>

function select_department(orderForm)
{
   var count = orderForm.rec_method.length;
   var html = "";
   
   $("input[name=rec_method]:checked").each(function(index, item){
	   var option = $(item).attr("value");
	   if(option == "pickup"){
		   document.getElementById("department_select").style.display="block";
	   }
	   else 
		   document.getElementById("department_select").style.display="none";
   });  
}

function order(){
	var product = [];
	var pid = "";
	var department = 0;
	var method = $("input[name=rec_method]:checked").val();
	var select_department = document.getElementById("department");
	
	if(method == "pickup"){
		department = select_department.options[select_department.selectedIndex].value;
	}
	
	$("input[name=pid]").each(function(index, item){
		   pid = $(item).attr("value");
		   product.push(pid);
	});  
	
	$.ajax({ 
		type : "post", 
		url : "<c:url value='/order'/>", 
		headers : { "Content-type" : "application/json", "X-HTTP-Method-Override" : "POST" }, 
		traditional : true,
		data : JSON.stringify({ method : method, department : department, product : product }), 
		dataType: "text",
		contentType: "application/json",
		success : function (result) { 
					window.location.href = "/app/order";
				  }
	});
}

</script>
</head>

<body data-mobile-nav-style="classic">
<!-- start header -->
<jsp:include page="Header.jsp"></jsp:include>
<!-- end header -->
<!-- start page title -->
<section class="wow animate__fadeIn bg-light-gray padding-25px-tb page-title-medium">
	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-12 col-xl-8 col-lg-6">
				<h1
					class="text-extra-dark-gray no-margin-bottom text-center text-lg-center">배송 & 결제정보 입력</h1>
			</div>
		</div>
	</div>
</section>
<!-- end page title -->
<!-- start section -->
<section class="wow animate__fadeIn checkout">
<div class="padding-100px-right padding-100px-left padding-10px-bottom">
<div class="row align-items-center">
<div class="col-12" id="order_table">
	<table class="table cart-products margin-30px-bottom md-margin-40px-bottom sm-no-margin-bottom">
		<form method="get" action="#">
			<thead>
				<tr>
					<th scope="col" class="alt-font"></th>
					<th scope="col" class="alt-font">상품</th>
					<th scope="col" class="alt-font"></th>
					<th scope="col" class="alt-font">수량</th>
					<th scope="col" class="alt-font">금액</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cart" items="${cartDTO}" varStatus="status">
					<tr>
						<td class="product-thumbnail">
							<img class="cart-product-image" src="${pageContext.request.contextPath}/resources/images/product/${cart.sex}/${cart.mainCategory_id}/${cart.subCategory_id}/${cart.imagePath}.jpg" alt="">
						</td>
						<td class="product-name">
							<input type="hidden" id="${cart.title}" name="pid" value="${cart.product_id}"/>
							<span class="variation">
							<label class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-100px">${cart.brand_name}</label>
							</span>
							<span class="variation">
							<label class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase">${cart.title}</label>
							</span>
						</td>
						<td class="product-name">
							<span class="variation">
								<div class="margin-4-rem-all">
									<label class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-60px">Size</label>
									<ul class="text-extra-small shop-size">
										<li><input class="d-none" type="radio" id="size-1" name="size"/>
										<label for="size-1"	class="width-80"><span>${cart.sizelabel}</span></label>
										</li>
									</ul>
									<label class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-60px">color</label>
									<ul class="alt-font shop-color">
										<li><input class="d-none" type="radio" id="color-1" name="color"/> 
										<label for="color-1"> <span style="background-color: #${cart.color} "></span></label>
										</li>
									</ul>
								</div>
							</span>
						</td>
						<td class="product-quantity" data-title="Quantity">
							<div class="quantity">
								<label class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-100px">${cart.quantity}</label>
							</div>
						</td>
						<td class="product-price" data-title="price"><label class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-100px">￦<fmt:formatNumber pattern="###,###,###" value="${cart.price}" /></label></td>
						</tr>
				</c:forEach>
			</tbody>
		</form>
	</table>
</div>
</div>
</div>
</section>
<!-- end section -->
    <!-- start section -->
    <section class="pt-0 wow animate__fadeIn">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-7 col-md-6 padding-70px-right lg-padding-40px-right md-padding-15px-right">
                    <span class="alt-font text-extra-large text-extra-dark-gray margin-40px-bottom d-inline-block font-weight-500 padding-10px-right">주문자 정보</span>
                    <span class="text-radical-red">*</span>표시는 필수항목입니다.
                    <form>
                        <div class="row">
                            <div class="col-md-6 margin-15px-bottom">
                                <label class="margin-15px-bottom">주문자 이름(Name) <span class="text-radical-red">*</span></label>
                                <input class="small-input" type="text" id="name" value="${member.name}" required  readonly>
                            </div>
                            <div class="col-12 margin-15px-bottom">
                                <label class="margin-15px-bottom">연락처(Phone) <span class="text-radical-red">*</span></label>
                                <input class="small-input" type="text" id="phone" value="${member.phone}" required  readonly>
                            </div>
                            <div class="col-12 margin-15px-bottom">
                                <label class="margin-15px-bottom">주소(Address) <span class="text-radical-red">*</span></label>
                                <input class="small-input" type="text" id="address" value="${member.address}" required  readonly>
                            </div>
                            <div class="col-md-12 margin-10px-bottom">
                            	<span class="alt-font text-extra-large text-extra-dark-gray margin-40px-top d-inline-block font-weight-500 padding-10px-right">배송 정보 입력</span>
                           	</div>
                            <div class="col-12 margin-20px-bottom">
                                <label class="margin-15px-bottom">수령 방법<span class="text-radical-red">*</span></label>
                                <br>
                                <ul class="float-lg-left float-right text-left line-height-36px">
									<li class="d-flex align-items-center md-margin-15px-all">
									<input id="shipping" type="radio" name="rec_method" class="d-block w-auto margin-10px-all padding-10px-all" value="shipping" onclick="select_department(this.form);" checked>
									<label class="md-line-height-18px" for="shipping">일반 택배</label>&nbsp;
									<input id="pickup" type="radio" name="rec_method" class="d-block w-auto margin-10px-all padding-10px-all" value="pickup" onclick="select_department(this.form);"> 
									<label class="md-line-height-18px" for="pickup">매장 수령</label></li>
								</ul>
                            </div>
                            <div class="col-12 margin-20px-bottom" id="department_select" style="display:none">
                                <label class="margin-15px-bottom" for="state">수령 지점 선택<span class="text-radical-red">*</span></label>
                                <select name="department" id="department" class="small-input" >
                                    <c:forEach var="departmentDTO" items="${departmentDTO}">
									<option value="${departmentDTO.id}">${departmentDTO.name}</option>"
									</c:forEach>
                                </select>
                                <span class="text-tussock">상품 준비가 끝나는 시점부터 수령이 가능합니다.<br> 주문완료 후 마이페이지에서 진행 상태를 확인할 수 있습니다.</span>
                            </div>
                            <div class="col-12 margin-15px-bottom">
                                <label class="margin-15px-bottom">요청 사항(Optional)</label>
                                <input class="small-input" type="text" required>
                            </div>
                            <hr><br>
                            <div class="col-md-12 margin-10px-bottom">
                            	<span class="alt-font text-extra-large text-extra-dark-gray margin-40px-top d-inline-block font-weight-500 padding-10px-right">결제 수단 선택</span>
                           	</div>
                           	<div class="col-md-12 margin-10px-bottom">
                           	    <ul class="float-lg-left float-right text-left line-height-36px">
									<li class="d-flex align-items-center md-margin-15px-bottom">
										<input id="pay1" type="radio" name="pay" class="d-block w-auto margin-10px-all padding-10px-all" checked="checked">
										 <label class="md-line-height-18px" for="pay1">
										 <i class="fas far fa-credit-card text-dark-tussock margin-10px-right"></i>신용카드</label>
									</li>
									<li class="d-flex align-items-center">
										<input id="pay2" type="radio" name="pay" class="d-block w-auto margin-10px-all padding-10px-all"> 
										<label class="md-line-height-18px" for="pay2">
										<i class="fas fa-money-check text-dark-tussock margin-10px-right"></i>실시간 계좌이체</label>
									</li>
									<li class="d-flex align-items-center">
										<input id="pay3" type="radio" name="pay" class="d-block w-auto margin-10px-all padding-10px-all"> 
										<label class="md-line-height-18px" for="pay3">
										<i class="fas fa-piggy-bank text-dark-tussock margin-10px-right"></i>가상 계좌</label>
									</li>
									<li class="d-flex align-items-center">
										<input id="pay4" type="radio" name="pay" class="d-block w-auto margin-10px-all padding-10px-all"> 
										<label class="md-line-height-18px" for="pay4">
										<i class="fab fa-amazon-pay text-dark-tussock margin-10px-right"></i>아마존 페이</label>
									</li>
								</ul>
							</div>
							<hr><br>
							<div class="col-md-12 margin-10px-bottom">
                            	<span class="alt-font text-extra-large text-extra-dark-gray margin-40px-top d-inline-block font-weight-500 padding-10px-right">배송 포장 옵션</span>
                           	</div>
                       		<div class="col-12 margin-10px-bottom">
                              	<input id="local_pickup" type="checkbox" name="shipping-option" class="w-auto margin-10px-right mb-0">
								<label class="md-line-height-18px" for="local_pickup">한섬 쇼핑백(무료)</label>
								<img class="cart-product-image margin-10px-all" src="${pageContext.request.contextPath}/resources/icon/shopping_bag.png" >
								<p class="margin-10px-all"> 
									· 선물용이나 이동 시, 편리하게 사용할 수 있는 쇼핑백을 포장해드립니다.<br>
                                    · 브랜드 쇼핑백 또는 더한섬닷컴 전용 쇼핑백 중 1개로 무작위 발송되며, 고객님의 요청사항이 반영되지 않습니다.<br>
                                </p>
                            </div>
                       	</div>
                       </form>
                </div>
                <div class="col-12 col-lg-5 col-md-6">
                    <div class="bg-extra-light-gray padding-45px-all lg-padding-30px-all sm-padding-20px-all">
                        <span class="alt-font text-large text-extra-dark-gray margin-25px-bottom d-inline-block font-weight-500">최종 결제 금액</span>
                        <table class="total-price-table checkout-total-price-table">
                            <thead class="border-bottom border-width-1px border-color-medium-gray text-extra-dark-gray">
                                <tr>
                                    <th class="product-name font-weight-500 w-60">Product</th>
                                    <th class="product-total pr-0 font-weight-500">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:set var="sum" value="0" />
                            <c:forEach var="cart" items="${cartDTO}" varStatus="status">
                                <tr class="text-dark-gray">
                                    <td>${cart.title} × ${cart.quantity}<span class="d-block w-100">Size: ${cart.sizelabel}</span></td>
                                    <td>￦ <fmt:formatNumber pattern="###,###,###" value="${cart.price}" /></td>
                                </tr>
                             <c:set var="sum" value="${sum + (cart.price * cart.quantity)}" />
                             </c:forEach>
                                <tr class="total-amount">
                                    <th class="font-weight-500 text-extra-dark-gray">Total</th>
                                    <td>
                                        <h6 class="d-block font-weight-500 mb-0 text-dark-tussock">￦<fmt:formatNumber pattern="###,###,###" value="${sum}" /></h6>
                                        <span class="text-small">(3만원 이상 무료 배송)</span>
                                    </td>
                                </tr>
                               
                            </tbody>
                        </table>
                        <div class="padding-40px-all bg-white box-shadow-large margin-20px-top margin-40px-bottom checkout-accordion lg-padding-30px-all md-padding-20px-all sm-padding-15px-lr">
                            <div class="w-100" id="accordion-style-05">
                                <!-- start tab content -->
                                <div class="heading active-accordion">
                                    <label>
                                        <input class="d-inline w-auto margin-10px-right mb-0" type="checkbox" name="payment-option" checked="checked">
                                        <span class="d-inline-block">구매자 동의</span>
                                        <p class="txt"> 주문할 상품의 상품명, 가격, 배송정보 등 판매조건을 확인하였으며, 구매진행에 동의합니다.<br>
                                        (전자상거래법 제8조 2항)<br><br>
                                        기존 마이너스 한섬마일리지를 보유하고 있는 고객은 
                                        한섬마일리지가 차감되어 적립되는 것에 동의합니다. 
                                        적립 예정 한섬마일리지가 상이할 수 있습니다.
                                        <br><br>
                                        * 통합멤버십으로 가입하시면 H.Point 적립 및 사용이 가능합니다.
                                        </p>
                                    </label>
                                </div>
                                <!-- end tab content -->
                            </div>
                        </div>
                        <a class="btn btn-fancy btn-dark-gray btn-extra-large w-100 margin-15px-top" onclick="order();">주문하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end section -->
    
    
    <!-- start footer -->
    
    <!-- end footer -->
    <!-- start scroll to top -->
    <a class="scroll-top-arrow" href="javascript:void(0);"><i class="feather icon-feather-arrow-up"></i></a>
    <!-- end scroll to top -->
    <!-- javascript -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/theme-vendors.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>