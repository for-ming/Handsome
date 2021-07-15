<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String user = (String) session.getAttribute("id");
int totalCart = 0;
if(user != null){
	totalCart = (Integer) session.getAttribute("totalCart");
}
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
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1" />
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">

<style>
.middle {
	position: absolute;
	left: 50%;
	top: 200%;
	transform: translate(-50%, 50%);
	margin: auto; padding : 10px 10px 10px 10px;
	clear: both;
	padding: 10px 10px 10px 10px;
}

.hiddenRow {
    padding: 0 !important;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>


<script>
	
	$(function() {
		noneDisplay();
	});
	
	function noneDisplay(){
		var cartNum = '<%=totalCart%>';
		if(cartNum == 0){
			document.getElementById('cart_table_none').innerText = "쇼핑백에 담긴 상품이 없습니다.";
		}
	}
	
	function moneyDisplay(price) {
		var money= price;
		money.toLocaleString();
		document.getElementById(this).innerText = money;
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
	   
	   if(sum < 30000){
		   document.getElementById('Total').innerText = '￦ ' + sum + 3000;
	   }
	   
	   if(count != checked){
		   itemForm.all.checked = false;
	   }
	   
	   document.getElementById('subTotal').innerText = '￦ ' + sum;
	   document.getElementById('Total').innerText = '￦ ' + sum;
	}
	
	function selectAll(all)  {
		  const checkboxes = document.getElementsByName('checkProduct');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = all.checked;
		  })
		  
		  itemSum(all.form);
		}
	
	function update_q(pid){
		var user = '<%=(String) session.getAttribute("id")%>';
		var product_id = pid;
		var quantity = $("#quantity"+product_id).val();
		$("#update_q").attr('disabled', 'disabled');
		
		Swal.fire({ 
			title: '수량을 변경하시겠습니까?', 
			text: "", 
			icon: 'warning', 
			showCancelButton: true, 
			confirmButtonColor: '#a1d1ff', 
			cancelButtonColor: '#fa7373', 
			confirmButtonText: '확인', 
			cancelButtonText: '취소' 
		}).then((result) => { 
			if (result.isConfirmed) { 
				$.ajax({ 
					type : "post", 
					url : "<c:url value='/cart/update/q'/>", 
					headers : { "Content-type" : "application/json", "X-HTTP-Method-Override" : "POST" }, 
					data : JSON.stringify({ user : user, product_id : product_id, quantity : quantity}), 
					success : function (result) { 
						if (result == "Success") {
							location.reload();
						}
						$("#updatecmt").attr('disabled', false);
					},
					dataType: "text",
					contentType: "application/json"
				});
			} 
			else{
				$("#updatecmt").attr('disabled', false);
				return;
			}
		})
	}
	
	function update(pid){
		var user = '<%=(String) session.getAttribute("id")%>';
		var product_id = pid;
	
		$.ajax({ 
			type : 'POST',
			url : "<c:url value='/cart/update'/>", 
			headers : { "Content-type" : "application/json", "X-HTTP-Method-Override" : "POST" },
			data : JSON.stringify({ user : user, product_id : product_id }), 
			dataType: "json",
			contentType: "application/json",
			success : function (data) { 
				var c_html = "";
				var s_html = "";
				var colorlist = data.colorlist;
				var sizelist = data.sizelist;
				for(var i in colorlist){
					c_html += "<li><input class='d-none' type='radio' id='color" + data.colorlist[i].color + "' name = 'color' value ='" + data.colorlist[i].color;
					if(i == 0)
						c_html += "' checked />";
					else 
						c_html += "' />";
					c_html += "<label for='color"+data.colorlist[i].color+"'> <span style='background-color: #";
					c_html += data.colorlist[i].color;
					c_html += "'></span></label></li>";
				}
				
				for(var i in sizelist){
					s_html += "<li><input class='d-none' type='radio' id='size"+data.sizelist[i].sizelabel+"' name = 'size' value = '"+ data.sizelist[i].sizelabel;
					if(i == 0)
						s_html += "' checked/>";
					else 
						s_html += "'/>";
					s_html += "<label for='size"+ data.sizelist[i].sizelabel +"' class='width-80'><span>"+ data.sizelist[i].sizelabel +"</span></label></li>";
				}
				
				var html = "";
				html += "<form id='color_and_size' action='${pageContext.request.contextPath}/cart/update/"+ pid +"' method='post'>";
				html += "<div class='xs-padding-six-all'>";
				html += "<b>상품 옵션 변경</b>";
				html += "<div class='margin-10px-bottom'>";
				html += "<label class='text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-60px'>color</label>";
				html += "<ul class='alt-font shop-color'>";
				html += c_html;
				html += "</ul><br>";
				html += "<label class='text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-60px'>Size</label>";
				html += "<ul class='text-extra-small shop-size'>";
				html += s_html;
				html += "</ul><br>";
				html += "<button class='btn btn-fancy btn-very-small btn-transparent-light-gray' type='submit' onclick='";
				html += "location.replace('${pageContext.request.contextPath}/cart')";
				html += "'>변경</button>";
				html += "<button class='btn btn-fancy btn-very-small btn-transparent-light-gray' type='button' onclick='location.reload();'>취소</button>";
				html += "</div></div></form>";
				
				$("#update_option_form_"+pid).html(html);
			}
		});
	}
	

	function delete_product(pid){
		var user = '<%=(String) session.getAttribute("id")%>';
		var product_id = pid;
		
		$.ajax({ 
			type : "post", 
			url : "<c:url value='/cart/delete'/>", 
			headers : { "Content-type" : "application/json", "X-HTTP-Method-Override" : "POST" }, 
			data : JSON.stringify({ user : user, product_id : product_id }), 
			dataType: "text",
			contentType: "application/json",
			success : function (result) { 
				window.location.href = "${pageContext.request.contextPath}/cart";
					  }
		});
	}
	
	function checkout(){
		var product = [];
		var pid = "";
		var count = 0;
		
		$("input[name=checkProduct]:checked").each(function(index, item){
			   pid = $(item).attr("value3");
			   product.push(pid);
			   count++;
		});  
		
		if(count == 0){
			Swal.fire({
                icon: 'warning',
                title: '선택된 상품이 없습니다.',
                text: '주문할 상품을 선택 후 다시 시도해주세요.',
            });
		}
		else {		
			$.ajax({ 
				type : "post", 
				url : "<c:url value='/checkout'/>", 
				headers : { "Content-type" : "application/json", "X-HTTP-Method-Override" : "POST" }, 
				traditional : true,
				data : JSON.stringify({ product : product }), 
				dataType: "text",
				contentType: "application/json",
				success : function (result) { 
								window.location.href = "${pageContext.request.contextPath}/checkout/order";
						  }
			});
		}
	}
	
	</script>
</head>

<body data-mobile-nav-style="classic">
<!-- start header -->
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
			<div class="col-lg-8 padding-50px-right lg-padding-20px-right md-padding-15px-right">
				<div class="row align-items-center">
					<div class="col-18" id="cart_table">
						<table class="table cart-products margin-60px-bottom md-margin-40px-bottom sm-no-margin-bottom">
							<form method="get" action="${pageContext.request.contextPath}/checkout">
								<thead>
									<div>
										<span>* 4PM 상품은 오후 4시 이후 주문 시 일반 택배 상품으로 발송됩니다.<br></span>
									</div>
									<tr>
										<th scope="col" class="alt-font"><label><input type="checkbox" name="all" value="all" onclick="selectAll(this);"></label></th>
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
									<c:forEach var="cart" items="${cartDTO}" varStatus="status">
										<tr>
											<td>
												<label><input type="checkbox" id="check_${cart.product_id}" name="checkProduct" value="${cart.price}" value2 ="${cart.quantity}" value3="${cart.product_id}" onClick="itemSum(this.form);"></label>
											</td>
											<td class="product-thumbnail">
												<a href="${pageContext.request.contextPath}/productdetail/${cart.product_id}"><img class="cart-product-image" src="${pageContext.request.contextPath}/resources/images/product/${cart.sex}/${cart.mainCategory_id}/${cart.subCategory_id}/${cart.imagePath}.jpg" alt=""></a>
											</td>
											<td class="product-name">
												<a href="${pageContext.request.contextPath}/productdetail/${cart.product_id}">
												<span class="variation">
												<label class="text-extra-dark-gray text-small font-weight-500 alt-font text-uppercase">${cart.brand_name}</label>
												</span>
												<span class="variation">
												<label class="text-extra-dark-gray text-medium font-weight-500 alt-font text-uppercase"><b>${cart.title}</b></label>
												</span>
												</a> 
												<span class="variation">
													<div class="margin-10px-bottom">
														<label class="text-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-60px">Size</label>
														<ul class="text-extra-small shop-size">
															<li><input class="d-none" type="radio" id="size-1" name="size"/>
															<label for="size-1"	lass="width-80"><span>${cart.sizelabel}</span></label>
															</li>
														</ul>
													</div>
												</span> 
												<span class="variation">
													<div class="margin-20px-bottom">
														<label class="text-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-60px">color</label>
														<ul class="alt-font shop-color">
															<li><input class="d-none" type="radio" id="color-1" name="color"/> 
															<label for="color-1"> <span style="background-color: #${cart.color} "></span></label>
															</li>
														</ul>
													</div>
												</span>
												<button type="button" data-target="#update_option_${cart.product_id}" class="btn btn-fancy btn-small mr-0 accordion-toggle" data-toggle="collapse" onclick="update('${cart.product_id}');">옵션변경</button>
											</td>
											<td class="product-quantity" data-title="Quantity">
												<div class="quantity">
													<input type="button" value="-" class="qty-minus qty-btn" data-quantity="minus" data-field="quantity"> 
													<input class="input-text qty-text" id="quantity${cart.product_id}" type="number" name="quantity" value="${cart.quantity}"> 
													<input type="button" value="+" class="qty-plus qty-btn" data-quantity="plus" data-field="quantity">
													<button class="btn btn-fancy btn-small mr-0" type="button" id="update_q${cart.product_id}" onclick="update_q('${cart.product_id}');">변경</button>
												</div>
											</td>
											<td class="product-price" data-title="price"><label class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-60px">￦<fmt:formatNumber pattern="###,###,###" value="${cart.price}" /></label></td>
											<td class="product-name" data-title="point"><label class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-80px">5%<br>한섬마일리지<br>0.1% (H.Point)</label></td>
											<td><a href="#"	class="btn apply-coupon-btn text-uppercase btn-transparent-tussock">&hearts;</a></td>
											<td><a href=""	class="btn apply-coupon-btn text-uppercase" onclick="delete_product('${cart.product_id}');">&times;</a></td>
											</tr>
											<!-- start update option -->
											<tr><td colspan="8" class="hiddenRow">
											<div id ="update_option_${cart.product_id}" class="collapse accordian-body">
												<div id = "update_option_form_${cart.product_id}"></div>
						                    </div>
						                	<!-- end update option -->
						                	</td>
						                	</tr>
									</c:forEach>
									<tr><td colspan="8" class="hiddenRow">
									<div class="text-center margin-10px-all" id ="cart_table_none"></div>
				                	</td>
				                	</tr>
								</tbody>
							</form>
						</table>
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="bg-light-gray padding-50px-all lg-padding-30px-tb lg-padding-20px-lr md-padding-20px-tb">
					<span class="alt-font text-large text-extra-dark-gray margin-15px-bottom d-inline-block font-weight-500">Totals</span>
					<table class="w-100 total-price-table">
						<tbody>
							<tr>
								<th class="w-50 font-weight-500 text-extra-dark-gray">상품 합계</th>
								<td class="text-extra-dark-gray">
								<div id='subTotal'>￦ </div>
								</td>
							</tr>
							<tr class="shipping">
								<th class="font-weight-500 text-extra-dark-gray">수령 방법</th>
								<td data-title="Shipping">
									<ul class="float-lg-left float-right text-left line-height-36px">
										<li class="d-flex align-items-center md-margin-15px-bottom">
											<input id="shipping" type="radio" name="shipping-option" class="d-block w-auto margin-10px-right mb-0" checked="checked" value="shipping">
											 <label class="md-line-height-18px" for="free_shipping">일반 택배</label>
										</li>
										<li class="d-flex align-items-center">
										<input id="pickup" type="radio" name="shipping-option" class="d-block w-auto margin-10px-right mb-0" value="pickup"> 
										<label class="md-line-height-18px" for="local_pickup">매장 수령</label></li>
									</ul>
									<a href="${pageContext.request.contextPath}/resources/icon/delivery_info.png" data-lightbox="example-set">
									<label class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase margin-10px-top"> 딜리버리 서비스<br>자세히 알아보기 </label>
									</a>
									<a href="${pageContext.request.contextPath}/resources/icon/pickup.png" data-lightbox="example-set"></a>
									<a href="${pageContext.request.contextPath}/resources/icon/shipping.png" data-lightbox="example-set"></a>
								</td>
							</tr>
							<tr class="total-amount">
								<th class="font-weight-500 text-extra-dark-gray">합계</th>
								<td data-title="Total">
									<h6 class="d-block font-weight-500 mb-0 text-extra-dark-gray">
										<div id='Total'> ￦ </div>
									</h6> <span class="text-small text-extra-medium-gray">(3만원 이상 무료배송)</span>
								</td>
							</tr>
						</tbody>
					</table>
					<div>
						<a class="btn btn-dark-gray btn-large d-block btn-fancy margin-15px-top" onclick="checkout();">선택상품 주문하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- end section -->

<hr>
<div class="row">
	<div class="padding-50px-all ">
	<table>
		<b class="text-extra-dark-gray margin-10px-bottom text-center text-lg-left">PROMOTION 혜택</b>
		<th class="padding-20px-all" ><strong>혜택 1 / 300,000원 이상 구매하신 고객님께 사은품을 드립니다. </strong></th>
		<th class="padding-20px-all" ><strong>혜택 2 / 100,000원 이상 구매하신 고객님께 사은품을 드립니다. </strong></th>
		<tr>
			<td class="padding-20px-all" >
				<ul>
					<img src="${pageContext.request.contextPath}/resources/icon/sample1.png">
					<li>사은품 : SYSTEM 블랙 스트링 브레이스릿</li>
					<li>SYSTEM 온라인 익스클루시브 주얼리 포함 시스템 (정상) 실결제<br> 30만원 이상 구매하신 고객님께
						"SYSTEM 블랙 스트링 브레이스릿"을 드립니다. <br>
						기간 : 07월 01일 ~ 07월 18일<br>
						*아울렛 제외, 실결제 30만원 이상(※1인 1개 제한)<br>
						사은품은 이벤트 종료 후, 취소 및 반품을 고려하여 8월 2일 이후 일괄 발송 예정입니다.<br> (1~3일 지연 가능)
					</li>
				</ul>
			</td>
			<td class="padding-20px-all" >
				<ul>
					<img src="${pageContext.request.contextPath}/resources/icon/sample2.png">
					<li>사은품 : BEIGIC 5/10만원 구매 시 머그/머그+로션</li>
					<li>더캐시미어띵즈 내 BEIGIC 상품을 5/10만원 이상 구매하신 고객님께<br> "머그/머그+로션 30ml"를
						드립니다.<br>기간 : 06월 23일~소진 시 까지<br>*5만원 이상~10만원 미만 구매
						고객에게는 머그, <br>10만원 이상 고객에게는 머그+로션 30ml SET를 드립니다.<br>사은품은 취소 및
						반품을 고려하여 준비 수량 소진 이후 추후 발송 예정입니다.
					</li>
				</ul>
			</td>
		</tr>
		<th class="padding-20px-all" ><strong>혜택 3 / 구매하신 고객님께 사은품을 드립니다. </strong></th>
		<tr>
			<td class="padding-20px-all" >
				<ul>
					<img src="${pageContext.request.contextPath}/resources/icon/sample3.png">
					<li>사은품 : BEIGIC 바디로션 2매</li>
					<li>더캐시미어띵즈 내 BEIGIC 상품을 구매하신 고객님께 <br> "바디로션 7ml 2매"를 드립니다.<br>기간
						: 06월 23일~소진 시 까지<br>*BEIGIC 상품 필수 구매<br>사은품은 주문하신 상품과
						함께 동봉하여 발송될 예정입니다.
					</li>
				</ul>
			</td>
		</tr>
	</table>
	<hr>
	<table>
		<th class="text-extra-dark-gray padding-20px-all ">쇼핑백 이용안내</th>
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