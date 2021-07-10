<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String user = (String) session.getAttribute("id");
int orderCount = 0;
%>
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

$(function() {
	noneDisplay();
});

function noneDisplay(){
	var orderCount = '<%=orderCount%>';
	if(orderCount == 0){
		document.getElementById('order_table_none').innerText = "주문 내역이 존재하지 않습니다.";
	}
}

function itemSum(itemForm)
{
   var sum = 0;
   var quantity = 0;
   var checked = 0;
   var count = itemForm.checkProduct.length;
   
   $("input[name=checkProduct]:checked").each(function(index, item){
	   quantity = $(item).attr("value2");
	   sum += $(item).attr("value") * $(item).attr("value2");
	   checked++;
   });  
   
   sum = sum.toLocaleString();
   
   document.getElementById('Total').innerText = '￦ ' + sum;
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
			<h1 lass="text-extra-dark-gray no-margin-bottom text-center text-lg-center">주문내역 조회</h1>
		</div>
	</div>
	</div>
</section>
<!-- end page title -->
	<!-- start section -->
	<section class="wow animate__fadeIn">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 padding-70px-right lg-padding-30px-right md-padding-15px-right">
					<div class="row align-items-center">
						<div class="col-12" id="cart_table">
							<table class="table cart-products margin-60px-bottom md-margin-40px-bottom sm-no-margin-bottom">
								<form method="get" action="#">
									<thead>
										<tr>
											<th scope="col" class="alt-font">주문일시</th>
											<th scope="col" class="alt-font">상품정보</th>
											<th scope="col" class="alt-font">수량</th>
											<th scope="col" class="alt-font">판매가</th>
											<th scope="col" class="alt-font">상태</th>
											<th scope="col" class="alt-font">상세보기</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="cart" items="${cartDTO}" varStatus="status">
											<tr>
												<td>
													<label><input type="checkbox" id="check_${cart.productId}" name="checkProduct" value="${cart.price}" value2 ="${cart.quantity}" onClick="itemSum(this.form);"></label>
												</td>
												<td class="product-thumbnail">
													<a href="#"><img class="cart-product-image" src="${pageContext.request.contextPath}/resources/images/product/${cart.sex}/${cart.mainCategoryId}/${cart.subCategoryId}/${cart.imagePath}.jpg" alt=""></a>
												</td>
												<td class="product-name">
													<a href="single-product.html">
													<span class="variation">
													<label class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-60px">${cart.brandName}</label>
													</span>
													<span class="variation">
													<label class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-60px">${cart.title}</label>
													</span>
													</a> 
													<span class="variation">
														<div class="margin-4-rem-bottom">
															<label class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-60px">Size</label>
															<ul class="text-extra-small shop-size">
																<li><input class="d-none" type="radio" id="size-1" name="size"/>
																<label for="size-1"	lass="width-80"><span>${cart.sizeLabel}</span></label>
																</li>
															</ul>
														</div>
													</span> 
													<span class="variation">
														<div class="margin-20px-bottom">
															<label class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-60px">color</label>
															<ul class="alt-font shop-color">
																<li><input class="d-none" type="radio" id="color-1" name="color"/> 
																<label for="color-1"> <span style="background-color: #${cart.color} "></span></label>
																</li>
															</ul>
														</div>
													</span>
													<button type="button" data-target="#update_option_${cart.productId}" class="btn btn-fancy btn-small mr-0 accordion-toggle" data-toggle="collapse" onclick="update('${cart.productId}');">옵션변경</button>
												</td>
												<td class="product-quantity" data-title="Quantity">
													<div class="quantity">
														<input type="button" value="-" class="qty-minus qty-btn" data-quantity="minus" data-field="quantity"> 
														<input class="input-text qty-text" id="quantity${cart.productId}" type="number" name="quantity" value="${cart.quantity}"> 
														<input type="button" value="+" class="qty-plus qty-btn" data-quantity="plus" data-field="quantity">
														<button class="btn btn-fancy btn-small mr-0" type="button" id="update_q${cart.productId}" onclick="update_q('${cart.productId}');">변경</button>
													</div>
												</td>
												<td class="product-price" data-title="price"><label class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-60px">￦${cart.price}</label></td>
												<td class="product-name" data-title="point"><label class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-60px">5% (한섬마일리지) 0.1% (H.Point)</label></td>
												<td><a href="#"	class="btn apply-coupon-btn text-uppercase btn-transparent-tussock">&hearts;</a></td>
												<td><a href=""	class="btn apply-coupon-btn text-uppercase" onclick="delete_product('${cart.productId}');">&times;</a></td>
												</tr>
												<!-- start update option -->
												<tr><td colspan="8" class="hiddenRow">
												<div id ="update_option_${cart.productId}" class="collapse accordian-body">
													<div id = "update_option_form_${cart.productId}"></div>
							                    </div>
							                	<!-- end update option -->
							                	</td>
							                	</tr>
										</c:forEach>
										<tr><td colspan="8" class="hiddenRow">
										<div id ="cart_table_none"></div>
					                	</td>
					                	</tr>
									</tbody>
								</form>
							</table>
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

</body>
</html>