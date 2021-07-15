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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/search/style.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/responsive.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/productlist/category.css" />
   		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>

   		
   
    </head>
    <script type="text/javascript">
		function showfilter(filter){
			var list = $(filter).children('.list');

			if(list.hasClass('filterclicked') === false){
				$('.list').removeClass('filterclicked');
				list.addClass('filterclicked');
			}else{
				list.removeClass('filterclicked');
			}

		} 
		var brandfilter;
		
		function checkbrandfilter(checked){
		    var result = $('.brandfilterselected');
		    
		    if( checked.checked==true ){
		        console.log(result.text());
		        console.log("체크 하기");
		        if(result.text() == "" ){
		            result.text(checked.getAttribute("value"));
		        }else{
		            result.text(result.text() + ","+ checked.getAttribute("value"));
		        }

		    }else {
		    	 console.log("체크 풀기");
		        var resultArr = result.text().split(",");
		        console.log(resultArr);
		        for(var i=0; i<resultArr.length; i++){
		            if(resultArr[i] == checked.getAttribute("value")){
		                resultArr.splice(i,1);
		                break;
		            }
		        }
		        result.text(resultArr.join(","));

		    }
		    
		    
		    brandfilter = result.text().split(",");
		    
		    
			 $('.productcontainer').css("display","none");
			 
			 for(var i = 0; i<brandfilter.length; i++){
				 $('.productcontainer').each(function(){

					 if(brandfilter[i] == $(this).find(".brand").text()){
						 $(this).css("display","block");
					 }
					
					 });

			 }

		}
	
    </script>
    <body data-mobile-nav-style="classic">
        <!-- start header -->
       	<jsp:include page="../Header.jsp"></jsp:include>
        <!-- end header -->
        <!-- start page title -->
 		<section class="parallax half-section" data-parallax-background-ratio="0.5" style="background-image:url('https://placehold.it/1920x1100');">
            <div class="opacity-medium bg-extra-dark-gray"></div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 col-lg-7 col-md-9 d-flex flex-column justify-content-center align-items-center small-screen">

                        <div class="newsletter-style-02 position-relative w-100">
                            <form action="${pageContext.request.contextPath}/product/search" method="POST">
                                <input class="search-input large-input border-radius-4px m-0 border-0" name="product_title" placeholder="상품 이름을 검색하세요." type="text" value="${keyword}">
                                <button type="submit" class="btn btn-medium text-extra-dark-gray border-left border-0 border-color-extra-medium-gray font-weight-600 py-0 search-button"><i class="feather icon-feather-search margin-10px-right"></i>search</button>
                            </form>
                        </div>
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
                    	<div class="filtercontainer">
                    		<div class="eachfilter brand" onClick="showfilter(this)">
								<div class="select" >
									<div class="brandfiltertitle filtertitle">브랜드</div>
									<div class="brandfilterselected filterselected"></div>
									<div class="arrow"><img alt="" src="${pageContext.request.contextPath}/resources/images/icon/arrow.png"></div>
								</div>   
								<div class="list">
									<c:forEach var="brand" items="${brandlistmap}">
										<div class="eachlist">
											<div class="checkcontainer"><input class="inputcheck" type="checkbox" name="brand" value="${brand.value}" onchange="checkbrandfilter(this)"></div><label><c:out value="${brand.value}"></c:out></label>
										</div>
									</c:forEach>

								</div>								                 		
                    		</div>
                    		<div class="eachfilter color" onClick="showfilter(this)">
                    			<div class="select" >
									<div class="filtertitle">색상</div>
									<div class="filterselected"></div>
									<div class="arrow"><img alt="" src="${pageContext.request.contextPath}/resources/images/icon/arrow.png"></div>
								</div>   
								<div class="list">
									<c:forEach var="brand" items="${brandlistmap}">
										<div class="eachlist">
											<div class="checkcontainer"><input class="inputcheck" type="checkbox" name="color" value="${brand.key}" onchange="checkfilter(this)"></div><label><c:out value="${brand.value}"></c:out></label>
										</div>
									</c:forEach>

								</div>	
                    		</div>
                    		<div class="eachfilter size" onClick="showfilter(this)">
                 				<div class="select" >
									<div class="sizefiltertitle filtertitle">사이즈</div>
									<div class="sizefilterselected filterselected"></div>
									<div class="arrow"><img alt="" src="${pageContext.request.contextPath}/resources/images/icon/arrow.png"></div>
								</div>   
								<div class="list">
	
								</div>	
                    		</div>
                    	</div>
                        <ul class="product-listing shop-wrapper grid grid-loading grid-5col xl-grid-4col lg-grid-3col md-grid-2col sm-grid-2col xs-grid-1col gutter-extra-large text-center">
                            <li class="grid-sizer"></li>
                           
                           	<c:forEach var="product" items="${productlist}">
                           		<c:set var="productcolors" value="${productcolorlist[product.id]}"/>
                           	 <!-- start shop item -->
                           	 <a href="${pageContext.request.contextPath}/selectedproduct/${product.id}">
				    			<li class="productcontainer grid-item wow animate__fadeIn">
	                                <div class="product-box margin-45px-bottom lg-margin-25px-bottom xs-no-margin-bottom" >
	                                   <!-- start product image -->
	                                   <div class="product-image border-radius-6px">
                                       		
                                       			<c:set var="loop_flag" value="false" />
                                       			<c:forEach var="productcolor" items="${productcolors}">
                                       				<c:if test="${not loop_flag }">
                                     					<img class="default-image" src="${pageContext.request.contextPath}/resources/images/product/${product.sex}/${product.maincategory_id}/${product.subcategory_id}/${productcolor.imagePath}.jpg" alt=""/>
                                     					<img class="hover-image" src="${pageContext.request.contextPath}/resources/images/product/${product.sex}/${product.maincategory_id}/${product.subcategory_id}/${productcolor.imagePath}.jpg" alt=""/>
                                       					<c:set var="loop_flag" value="true" />
                                       				 </c:if>
                                       			</c:forEach>
	                                        
	                                        <div class="product-overlay bg-gradient-extra-midium-gray-transparent"></div>
	                                        <div class="product-hover-bottom text-center padding-30px-tb">
	                                            <a href="#" class="move-top-bottom" data-toggle="tooltip" data-placement="top" title="">
	                                            	
	                                            </a>
	                                        </div>
	                                    </div>
	                                    <!-- end product image -->
	                                    <div class="productdetail" data-value="${product.id}">
                                           	<div class="detailcontainer brand" data-value="${product.brand_id}"><c:out value="${brandlistmap[product.brand_id]}"></c:out></div>
                                          		<div class="detailcontainer title">${product.title}</div>
                                           	<div class="detailcontainer">₩<f:formatNumber value="${product.price}" pattern="#,###" /></div>
 
                                      	      <ul class="colorscontainer detailcontainer">
                                       		    <c:forEach var="productcolor" items="${productcolors}">
                                       		    	<li class="colorlist">
                                       		    	 	<input class="d-none" type="radio" id="${productcolor.color}" value="${productcolor.color}" name="color" checked onClick="colorclick(this)"/> 
                   									   	<label for="${productcolor.color}"><span style="background-color: #${productcolor.color}; border-radius:0; border:0.2px solid gray"></span></label>
                                       				</li>
                                       			</c:forEach>
                                         		</ul>

		                                  
                                         </div>
	                                </div>
                           		</li>
                          	</a>
                            <!-- end shop item -->
							</c:forEach>
                           
                            
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- end section -->
        <!-- start footer -->
        <footer class="footer-dark bg-slate-blue" style="z-index:0; position:relative;">
            <div class="footer-top padding-five-tb lg-padding-eight-tb md-padding-50px-tb">
                <div class="container">
                    <div class="row">
                        <!-- start footer column -->
                        <div class="col-12 col-lg-3 col-sm-6 md-margin-40px-bottom xs-margin-25px-bottom">
                            <span class="alt-font font-weight-500 d-block text-white margin-20px-bottom xs-margin-10px-bottom">Company</span>
                            <ul>
                                <li><a href="about-us.html">About company</a></li>
                                <li><a href="our-services.html">Company services</a></li>
                                <li><a href="our-team.html">Job opportunities</a></li>
                                <li><a href="contact-us-classic.html">Contact us</a></li>
                            </ul>
                        </div>
                        <!-- end footer column -->
                        <!-- start footer column -->
                        <div class="col-12 col-lg-3 col-sm-6 md-margin-40px-bottom xs-margin-25px-bottom">
                            <span class="alt-font font-weight-500 d-block text-white margin-20px-bottom xs-margin-10px-bottom">Customer</span>
                            <ul>                           
                                <li><a href="faq.html">Client support</a></li>
                                <li><a href="pricing-packages.html">Pricing packages</a></li>
                                <li><a href="our-story.html">Company history</a></li>
                                <li><a href="our-process.html">Our process</a></li>
                            </ul>
                        </div>
                        <!-- end footer column -->
                        <!-- start footer column -->
                        <div class="col-12 col-lg-3 col-sm-6 xs-margin-25px-bottom">
                            <span class="alt-font font-weight-500 d-block text-white margin-20px-bottom xs-margin-10px-bottom">Get in touch</span>
                            <p class="w-85 margin-15px-bottom">27 Eden walk eden centre, Orchard view, Paris, France</p>
                            <div><i class="feather icon-feather-phone-call icon-very-small margin-10px-right text-white"></i>+1 234 567 8910</div>
                            <div><i class="feather icon-feather-mail icon-very-small margin-10px-right text-white"></i><a href="#">info@yourdomain.com</a></div>
                        </div>
                        <!-- end footer column -->
                        <!-- start footer column -->
                        <div class="col-12 col-lg-3 col-sm-6">
                            <span class="alt-font font-weight-500 d-block text-white margin-20px-bottom">Follow us on Instagram</span>
                            <div class="w-100 d-inline-block margin-10px-top">
                                <ul class="instafeed-grid instafeed-wrapper grid grid-3col xl-grid-3col lg-grid-3col md-grid-3col sm-grid-3col xs-grid-3col gutter-small" data-total="3">
                                    <li class="grid-item"><figure><a href="#" data-href="{{link}}" target="_blank"><img src="#" data-src="{{image}}" class="insta-image" alt="" /><span class="insta-counts"><i class="fab fa-instagram"></i>{{likes}}</span></a></figure></li>
                                </ul>
                                <a class="alt-font text-extra-small text-uppercase font-weight-500 margin-20px-top d-inline-block" href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram icon-extra-small align-middle margin-10px-right text-gradient-light-purple-light-orange"></i><span class="d-inline-block align-middle">Follow instagram</span></a>
                            </div>
                        </div>
                        <!-- end footer column -->
                    </div>
                </div>
            </div>
            <div class="footer-bottom padding-40px-tb border-top border-color-white-transparent">
                <div class="container"> 
                    <div class="row align-items-center">
                        <div class="col-12 col-md-3 text-center text-md-left sm-margin-20px-bottom">
                            <a href="index.html" class="footer-logo"><img src="images/logo-white.png" data-at2x="images/logo-white@2x.png" alt=""></a>
                        </div>
                        <div class="col-12 col-md-6 text-center last-paragraph-no-margin sm-margin-20px-bottom">
                            <p>&copy; 2021 Litho is Proudly Powered by <a href="https://www.themezaa.com/" target="_blank">ThemeZaa</a></p>
                        </div>
                        <div class="col-12 col-md-3 text-center text-md-right">
                            <div class="social-icon-style-12">
                                <ul class="extra-small-icon light">
                                    <li><a class="facebook" href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                                    <li><a class="dribbble" href="http://www.dribbble.com" target="_blank"><i class="fab fa-dribbble"></i></a></li>
                                    <li><a class="twitter" href="http://www.twitter.com" target="_blank"><i class="fab fa-twitter"></i></a></li>
                                    <li><a class="instagram" href="http://www.instagram.com" target="_blank"><i class="fab fa-instagram"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
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