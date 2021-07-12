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
<section class="wow animate__fadeIn checkout">
<div class="padding-50px-all">
<div class="row align-items-center">
<div class="col-12" id="order_table">
	<table class="table cart-products margin-60px-bottom md-margin-40px-bottom sm-no-margin-bottom">
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
							<a href="#"><img class="cart-product-image" src="${pageContext.request.contextPath}/resources/images/product/${cart.sex}/${cart.mainCategory_id}/${cart.subCategory_id}/${cart.imagePath}.jpg" alt=""></a>
						</td>
						<td class="product-name">
							<span class="variation">
							<label class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-100px">${cart.brand_name}</label>
							</span>
							<span class="variation">
							<label class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase">${cart.title}</label>
							</span>
						</td>
						<td class="product-name">
							<span class="variation">
								<div class="margin-4-rem-bottom">
									<label class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-60px">Size</label>
									<ul class="text-extra-small shop-size">
										<li><input class="d-none" type="radio" id="size-1" name="size"/>
										<label for="size-1"	lass="width-80"><span>${cart.sizelabel}</span></label>
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
						<td class="product-price" data-title="price"><label class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-60px">￦${cart.price}</label></td>
						</tr>
				</c:forEach>
			</tbody>
		</form>
	</table>
</div>
</div>
</div>
</section>

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