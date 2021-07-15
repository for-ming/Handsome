<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-icons.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/theme-vendors.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/productlist/style.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/responsive.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/productlist/brand.css" />
        
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>

        
    </head>
    <body data-mobile-nav-style="classic">
        <!-- start header -->
       	<jsp:include page="../Header.jsp"></jsp:include>
        <!-- end header -->
        <!-- start page title -->
        <section class="half-section parallax" data-parallax-background-ratio="0.5" style="background-image:url('images/portfolio-bg.jpg');">
            <div class="container">
                <div class="row align-items-stretch justify-content-center extra-small-screen">
                    <div class="col-12 col-xl-6 col-lg-7 col-md-8 page-title-extra-small text-center d-flex justify-content-center flex-column">
                        <h1 class="alt-font text-gradient-sky-blue-pink margin-15px-bottom d-inline-block">Shop fullwide</h1>
                        <h4 class="text-extra-dark-gray alt-font font-weight-500 letter-spacing-minus-1px line-height-50 sm-line-height-45 xs-line-height-30 no-margin-bottom">${brandname}</h4>
                    </div>
                </div>
            </div>
        </section>
        <!-- end page title -->
        <!-- start section -->
        <section class="pt-0 padding-five-lr xs-no-padding-lr">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 shopping-content">
                        <ul class="product-listing shop-wrapper grid grid-loading grid-5col xl-grid-4col lg-grid-3col md-grid-2col sm-grid-2col xs-grid-1col gutter-extra-large text-center">
                            <li class="grid-sizer"></li>
                           
                           	<c:forEach var="product" items="${productlist}">
                           		<c:set var="productcolors" value="${productcolorlist[product.id]}"/>
                           	 <!-- start shop item -->
				    			<li class="grid-item wow animate__fadeIn">
	                                <div class="product-box margin-45px-bottom lg-margin-25px-bottom xs-no-margin-bottom">
	                                   <!-- start product image -->
	                                   <div class="product-image border-radius-6px">
                                       		<a href="${pageContext.request.contextPath}/productdetail/${product.id}">
                                       			<c:set var="loop_flag" value="false" />
                                       			<c:forEach var="productcolor" items="${productcolors}">
                                       				<c:if test="${not loop_flag }">
                                     					<img class="default-image" src="${pageContext.request.contextPath}/resources/images/product/${product.sex}/${product.maincategory_id}/${product.subcategory_id}/${productcolor.imagePath}.jpg" alt=""/>
                                     					<img class="hover-image" src="${pageContext.request.contextPath}/resources/images/product/${product.sex}/${product.maincategory_id}/${product.subcategory_id}/${productcolor.imagePath}.jpg" alt=""/>
                                       					<c:set var="loop_flag" value="true" />
                                       				 </c:if>
                                       			</c:forEach>
	                                        </a>
	                                        <div class="product-overlay bg-gradient-extra-midium-gray-transparent"></div>
	                                        <div class="product-hover-bottom text-center padding-30px-tb">
	                                            <a href="${pageContext.request.contextPath}/productdetail/${product.id}" class="move-top-bottom" data-toggle="tooltip" data-placement="top" title="">
	                                            	<div class="productdetail" data-value="${product.id}">
		                                            	<div class="detailcontainer">${brandName}</div>
	                                            		<div class="detailcontainer">${product.title}</div>
		                                            	<div class="detailcontainer">₩<f:formatNumber value="${product.price}" pattern="#,###" /></div>
		                                            	<div class="colorscontainer detailcontainer">
                                            	          	<c:forEach var="productcolor" items="${productcolors}">
		                                            			<div class="colorcontainer" style="background-color:#${productcolor.color}"></div>
		                                            		</c:forEach>
		                                            	</div>
		                                  
	                                            	</div>
	                                            </a>
	                                        </div>
	                                    </div>
	                                    <!-- end product image -->
	                                </div>
                           		</li>
                            <!-- end shop item -->
							</c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- end section -->
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
        <a class="scroll-top-arrow" href="javascript:void(0);"><i class="feather icon-feather-arrow-up"></i></a>
        <!-- end scroll to top -->
        <!-- javascript -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/theme-vendors.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    </body>
</html>