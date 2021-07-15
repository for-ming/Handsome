<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
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
<link rel="stylesheet" type="text/css" href="../resources/css/product/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/responsive.css" />
<link rel="stylesheet" type="text/css" href="../resources/css/product/product.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>


<script type="text/javascript" src="../resources/js/user_activity.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function(){
	var radioVal = $('input[name="color"]:checked').val();

	 $('.product_image').each(function(){
		 var eachproductcolor = $(this).data("value");
		 
		 if(eachproductcolor == radioVal){
			 $(this).addClass("product_image_show");
		 }
		 });
	
});
function colorclick(clickedcolor){
	var color = $(clickedcolor).val();

	$('.product_image').removeClass("product_image_show");

	 $('.product_image').each(function(){
		 var eachproductcolor = $(this).data("value");
		 
		 if(eachproductcolor == color){
			 $(this).addClass("product_image_show");
		 }
	 	 });
}

$(function(){
    $('#submit').on("click",function () {

        var form1 = $("#form").serialize();

        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/product/review",
            data: form1,
            dataType: 'text',
            success: function (data) {
                alert("리뷰가 등록되었습니다.");
               	location.href = location.href;
            },
            error: function (request, status, error) {
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

            }
        });
    });
});

function addCart(productid){
	var checkedcolor = $('input[name="color"]:checked').val();
	var checkedsize = $('input[name="size"]:checked').val();
	var quantity = $('input[name="quantity"]').val();
	console.log("productid : "+productid);
	console.log("checkedcolor : "+checkedcolor);
	console.log("checkedsize : "+checkedsize);
	console.log("quantity : "+quantity);
	
	var insert_url = "${pageContext.request.contextPath}/cart/insert/"+productid+"/"+checkedcolor+"/"+checkedsize+"/"+quantity;
    $.ajax({
     type : "GET",
     url : insert_url,
     success: function(data){
        Swal.fire({
             title: '장바구니에 상품이 정상적으로<br>담겼습니다.',
             icon: 'success',
             showDenyButton: true,
             confirmButtonText: `계속 쇼핑하기`,
             denyButtonText: `장바구니로 이동`,
             confirmButtonColor: '#85b8d6',
             denyButtonColor: '#db943d'
           }).then((confirmresult) => {
             if (confirmresult.isDenied) {
                    window.location.href= "${pageContext.request.contextPath}/cart/";
             }
        })
     },
     error : function(request, status, error){
        Swal.fire('장바구니에 다시 담아주세요.');
     }
  });
}
</script>
<body data-mobile-nav-style="classic" onload="startTimer()">

   <!-- start header -->
   <jsp:include page="../Header.jsp"></jsp:include>
   <!-- end header -->


	   <!-- start section -->
	   <section class="big-section wow animate__fadeIn">
	      <div class="container">
	         <div class="row">
	         	<c:set var="product" value="${productDTO}"/>
        			<c:set var="productcolors" value="${productcolorlist[product.id]}"/>
	            <div
	               class="col-12 shopping-content d-flex flex-column flex-lg-row align-items-md-center">
	               <div class="imagecontainer">
	                  <div class="product-images-box lightbox-portfolio row">
	                     <div class="col-12 col-lg-12 px-lg-0 order-lg-2 products-image md-margin-10px-bottom">
                      			<c:forEach var="productcolor" items="${productcolors}">
                      					<div class="product_image" data-value="${productcolor.color}">
                      							<img class="eachimage" src="${pageContext.request.contextPath}/resources/images/product/${product.sex}/${product.maincategory_id}/${product.subcategory_id}/${productcolor.imagePath}.jpg" alt=""/>
                      					</div>
                      			</c:forEach>
	                     </div>
	
	                  </div>
	               </div>
	               <div
	                  class="product-summary padding-7-rem-left lg-padding-3-rem-left md-no-padding-left">
	                  <div class="text-small p-0">
	                     <!-- start breadcrumb -->
	                     <h4 class="item_name">
	                     	<div class="brand_name">
	                     		<a href="${pageContext.request.contextPath}/brand/${brandlistmap[product.brand_id]}"><c:out value="${brandlistmap[product.brand_id]}"></c:out></a>
	                     	</div>
	                     	<div class="product_title">${product.title}</div>
	                     </h4>
	                     <!-- end breadcrumb -->
	                  </div>
	                  <div
	                     class="d-flex align-items-center margin-20px-top margin-20px-bottom md-margin-1-half-rem-tb">
	                     <div class="flex-grow-1">
	                        <span class="product-price text-extra-medium"><f:formatNumber value="${product.price}" pattern="#,###" />원</span>
	                     </div>
	                     <div class="text-right line-height-30px">
	                        <div>
	                           <div class="letter-spacing-3px"> 
	                             <c:set var="average_review" value="${average_review}"/>
	                             <c:choose>
	                             	<c:when test="${average_review ne 0}">
	                                	<%for(int i = 0; i<(int)pageContext.getAttribute("average_review"); i++){ %>
                                    	<i class="fas fa-star text-very-small text-golden-yellow"></i> 
                                    	<%
                                    	} %>
	                             	</c:when>
	                             	<c:otherwise>
	                             		<div class="text-golden-yellow">(리뷰없음)</div>
	                             	</c:otherwise>
	                             </c:choose>

       
	                              </div>
	                        </div>

	                     </div>
	                  </div>
	                  <div class="number_code">상품품번 : <span>${product.id}</span></div>
	                  <p class="longdetail">${product.longdetail}</p>
	                  <div class="shortdetail">${product.shortdetail}</div>
	                  
	                  <div class="margin-2-rem-top">
	                     <div class="margin-20px-bottom">
	                        <label
	                           class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-60px">color</label>
	                        <ul class="alt-font shop-color">
                      			<c:forEach var="productcolor" items="${productcolors}">
		                           <li>
		                           	<input class="d-none" type="radio" id="${productcolor.color}" value="${productcolor.color}" name="color" checked onClick="colorclick(this)"/> 
		                           	<label for="${productcolor.color}"><span style="background-color: #${productcolor.color}"></span></label>
	                              </li>
                                </c:forEach>
	                        </ul>
	                     </div>
	                     <div class="margin-4-rem-bottom">
	                        <label
	                           class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-60px">Size</label>
	                        <ul class="text-extra-small shop-size">
	                       	 <c:forEach var="productsize" items="${productsizelist}">
	                           <li><input class="d-none" type="radio" id="${productsize.sizelabel}" value="${productsize.sizelabel}" name="size" checked /> <label for="${productsize.sizelabel}" class="width-80"><span>${productsize.sizelabel}</span></label>
	                           </li>
                          	 </c:forEach>	
	                        </ul>
	                        <label class="size-chart text-uppercase w-60px margin-10px-left">
	                           <a
	                           class="modal-popup alt-font text-extra-small text-decoration-line-bottom"
	                           href="#modal-popup">Size Guide</a>
	                        </label>
	                        <div id="modal-popup"
	                           class="white-popup-block mfp-hide w-55 mx-auto position-relative bg-white modal-popup-main padding-5-rem-all xl-w-70 md-w-80 md-padding-4-rem-all xs-w-95 xs-padding-3-rem-all">
	                           <div class="table-style-01">
	                              <table>
	                                 <tbody>
	                                    <tr
	                                       class="alt-font bg-extra-dark-gray font-weight-500 text-white">
	                                       <th>SIZE</th>
	                                       <th>S</th>
	                                       <th>M</th>
	                                       <th>L</th>
	                                       <th>XL</th>
	                                       <th>XXL</th>
	                                       <th>2XL</th>
	                                       <th>3XL</th>
	                                    </tr>
	                                    <tr>
	                                       <td>Collar</td>
	                                       <td>14</td>
	                                       <td>15</td>
	                                       <td>16</td>
	                                       <td>17</td>
	                                       <td>18</td>
	                                       <td>19</td>
	                                       <td>20</td>
	                                    </tr>
	                                    <tr class="bg-light-gray">
	                                       <td>Shoulder</td>
	                                       <td>16</td>
	                                       <td>17</td>
	                                       <td>18</td>
	                                       <td>19</td>
	                                       <td>20</td>
	                                       <td>21</td>
	                                       <td>22</td>
	                                    </tr>
	                                    <tr>
	                                       <td>Chest, waist, hips</td>
	                                       <td>28-29</td>
	                                       <td>30-31</td>
	                                       <td>32-33</td>
	                                       <td>34-35</td>
	                                       <td>36-37</td>
	                                       <td>38-39</td>
	                                       <td>40-41</td>
	                                    </tr>
	                                    <tr class="bg-light-gray">
	                                       <td>Cuff</td>
	                                       <td>9</td>
	                                       <td>9.5</td>
	                                       <td>10</td>
	                                       <td>10.5</td>
	                                       <td>11</td>
	                                       <td>11.5</td>
	                                       <td>12</td>
	                                    </tr>
	                                    <tr>
	                                       <td>Short-sleeve length</td>
	                                       <td>10</td>
	                                       <td>10.5</td>
	                                       <td>11</td>
	                                       <td>11.5</td>
	                                       <td>12</td>
	                                       <td>12.5</td>
	                                       <td>13</td>
	                                    </tr>
	                                    <tr class="bg-light-gray">
	                                       <td>Long-sleeve length</td>
	                                       <td>23</td>
	                                       <td>23.5</td>
	                                       <td>24</td>
	                                       <td>24.5</td>
	                                       <td>25</td>
	                                       <td>25.5</td>
	                                       <td>26</td>
	                                    </tr>
	                                    <tr>
	                                       <td>Arm Hole</td>
	                                       <td>22</td>
	                                       <td>22.5</td>
	                                       <td>32</td>
	                                       <td>23.5</td>
	                                       <td>24</td>
	                                       <td>24.5</td>
	                                       <td>25</td>
	                                    </tr>
	                                 </tbody>
	                              </table>
	                           </div>
	                        </div>
	                     </div>
	                  </div>
	                  <div>
	                     <div class="quantity margin-15px-right">
	                        <label class="screen-reader-text">Quantity</label> <input
	                           type="button" value="-" class="qty-minus qty-btn"
	                           data-quantity="minus" data-field="quantity"> <input
	                           class="input-text qty-text" type="number" name="quantity"
	                           value="1"> <input type="button" value="+"
	                           class="qty-plus qty-btn" data-quantity="plus"
	                           data-field="quantity">
	                     </div>
	                     <div onClick="addCart('${product.id}');" class="btn btn-dark-gray btn-medium">Add to cart</div>
	                     <div class="margin-25px-top">
	                        <a style="cursor: pointer;" onclick="insertUserActivity_wish()"
	                           class="text-uppercase text-extra-small alt-font margin-20px-right font-weight-500 "><i
	                           class="feather icon-feather-heart align-middle margin-5px-right"></i>Add
	                           to wishlist</a> 
	 
	                     </div>
	                  </div>
	               </div>
	            </div>
	         </div>
	      </div>
	   </section>
   <!-- end section -->
  
   <!-- start section -->
   <section
      class="border-top border-width-1px border-color-medium-gray pt-0 wow animate__fadeIn">
      <div class="container-fluid">
         <div class="row">
            <div class="col-12 p-0 tab-style-07">
               <ul
                  class="nav nav-tabs justify-content-center text-center alt-font font-weight-500 text-uppercase margin-9-rem-bottom border-bottom border-color-medium-gray md-margin-50px-bottom sm-margin-35px-bottom">
                  <li class="nav-item active"><a class="nav-link active" data-toggle="tab"
                     href="#reviews">Reviews (${count_review})</a></li>
               </ul>
            </div>
         </div>
      </div>
      <div class="container">
         <div class="tab-content">
            <!-- start tab item -->
            <div id="reviews" class="tab-pane fade in active show">
           
	            <div class="row align-items-center justify-content-center">
	                  <div class="col-12 col-lg-10">
	                     <ul class="blog-comment margin-5-half-rem-bottom">
	                     <c:forEach var="review" items="${reviewlist}">
	                        <li>
	                           <div
	                              class="d-block d-md-flex w-100 align-items-center align-items-md-start">
	
	                              <div
	                                 class="w-100 last-paragraph-no-margin sm-no-padding-left">
	                                 <a href="#" class="text-extra-dark-gray text-fast-blue-hover alt-font font-weight-500 text-medium">${review.member_id}</a> 
	                                    <span class="text-orange text-extra-small float-right letter-spacing-2px">
	                                    <c:set var="rating" value="${review.rating}"/>
	                                    <%for(int i = 0; i<(int)pageContext.getAttribute("rating"); i++){ %>
	                                    <i class="fas fa-star"></i>
	                                    <%
	                                    } %>
		     
	                                    </span>
	                                 <p class="w-85">${review.comments }</p>
	                              </div>
	                           </div>
	                        </li>
	                     </c:forEach>
	   
	                     </ul>
	                  </div>
	               </div>
	               <hr>
            
     
               <div class="reviewtitle row justify-content-center">
                  <div class="col-12 col-lg-10">
                     <h6
                        class="alt-font text-extra-dark-gray font-weight-500 margin-5px-bottom">리뷰 작성</h6>
                  </div>
               </div>
               <div class="row justify-content-center">
                  <div class="col-12 col-lg-10">
                     <form id="form">
                        <div class="row align-items-center">
                           <div class="col-md-12 col-sm-12 col-xs-12 margin-30px-bottom">
                              <label class="margin-15px-bottom"> Your rating <span
                                 class="text-radical-red">*</span>
                              </label>
                              <div class="star-rating">
                                 <input type="radio" id="5-stars" name="rating" value="5"
                                    v-model="ratings" /> <label for="5-stars" class="star">★</label>
                                 <input type="radio" id="4-stars" name="rating" value="4"
                                    v-model="ratings" /> <label for="4-stars" class="star">★</label>
                                 <input type="radio" id="3-stars" name="rating" value="3"
                                    v-model="ratings" /> <label for="3-stars" class="star">★</label>
                                 <input type="radio" id="2-stars" name="rating" value="2"
                                    v-model="ratings" /> <label for="2-stars" class="star">★</label>
                                 <input type="radio" id="1-star" name="rating" value="1"
                                    v-model="ratings" /> <label for="1-star" class="star">★</label>
                              </div>
                           </div>
                           <div class="col-md-12 col-sm-12 col-xs-12">
                              <div class="margin-15px-bottom">리뷰</div>
                              <textarea
                                 class="medium-textarea border-radius-4px bg-white h-120px margin-2-half-rem-bottom"
                                 rows="6" id ="comments" name="comments" placeholder="리뷰를 작성하세요."></textarea>
                           </div>
                           <div class="col-12 sm-margin-20px-bottom">
                              <input id="product_id" type="hidden" name="product_id"
                                 value="${productDTO.id}" /> 
                               <input id="member_id" type="hidden" name="member_id"
                               value="<%=(String)session.getAttribute("id") %>" /> 
                               <input
                                 class="btn btn-medium btn-dark-gray mb-0 btn-round-edge-small"
                                 type="button" name="submit" id="submit" value="등록">
                           </div>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
            <!-- end tab item -->
         </div>
      </div>
   </section>
   <!-- end section -->
   
   <!-- start footer -->
   <footer class="footer-dark bg-slate-blue">
      <div
         class="footer-top padding-five-tb lg-padding-eight-tb md-padding-50px-tb">
         <div class="container">
            <div class="row">
               <!-- start footer column -->
               <div
                  class="col-12 col-lg-3 col-sm-6 md-margin-40px-bottom xs-margin-25px-bottom">
                  <span
                     class="alt-font font-weight-500 d-block text-white margin-20px-bottom xs-margin-10px-bottom">Company</span>
                  <ul>
                     <li><a href="about-us.html">About company</a></li>
                     <li><a href="our-services.html">Company services</a></li>
                     <li><a href="our-team.html">Job opportunities</a></li>
                     <li><a href="contact-us-classic.html">Contact us</a></li>
                  </ul>
               </div>
               <!-- end footer column -->
               <!-- start footer column -->
               <div
                  class="col-12 col-lg-3 col-sm-6 md-margin-40px-bottom xs-margin-25px-bottom">
                  <span
                     class="alt-font font-weight-500 d-block text-white margin-20px-bottom xs-margin-10px-bottom">Customer</span>
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
                  <span
                     class="alt-font font-weight-500 d-block text-white margin-20px-bottom xs-margin-10px-bottom">Get
                     in touch</span>
                  <p class="w-85 margin-15px-bottom">27 Eden walk eden centre,
                     Orchard view, Paris, France</p>
                  <div>
                     <i
                        class="feather icon-feather-phone-call icon-very-small margin-10px-right text-white"></i>+1
                     234 567 8910
                  </div>
                  <div>
                     <i
                        class="feather icon-feather-mail icon-very-small margin-10px-right text-white"></i><a
                        href="#">info@yourdomain.com</a>
                  </div>
               </div>
               <!-- end footer column -->
               <!-- start footer column -->
               <div class="col-12 col-lg-3 col-sm-6">
                  <span
                     class="alt-font font-weight-500 d-block text-white margin-20px-bottom">Follow
                     us on Instagram</span>
                  <div class="w-100 d-inline-block margin-10px-top">
                     <ul
                        class="instafeed-grid instafeed-wrapper grid grid-3col xl-grid-3col lg-grid-3col md-grid-3col sm-grid-3col xs-grid-3col gutter-small"
                        data-total="3">
                        <li class="grid-item"><figure>
                              <a href="#" data-href="{{link}}" target="_blank"><img
                                 src="#" data-src="{{image}}" class="insta-image" alt="" /><span
                                 class="insta-counts"><i class="fab fa-instagram"></i>{{likes}}</span></a>
                           </figure></li>
                     </ul>
                     <a
                        class="alt-font text-extra-small text-uppercase font-weight-500 margin-20px-top d-inline-block"
                        href="https://www.instagram.com/" target="_blank"><i
                        class="fab fa-instagram icon-extra-small align-middle margin-10px-right text-gradient-light-purple-light-orange"></i><span
                        class="d-inline-block align-middle">Follow instagram</span></a>
                  </div>
               </div>
               <!-- end footer column -->
            </div>
         </div>
      </div>
      <div
         class="footer-bottom padding-40px-tb border-top border-color-white-transparent">
         <div class="container">
            <div class="row align-items-center">
               <div
                  class="col-12 col-md-3 text-center text-md-left sm-margin-20px-bottom">
                  <a href="index.html" class="footer-logo"><img
                     src="../resources/images/logo-white.png"
                     data-at2x="../resources/images/logo-white@2x.png" alt=""></a>
               </div>
               <div
                  class="col-12 col-md-6 text-center last-paragraph-no-margin sm-margin-20px-bottom">
                  <p>
                     &copy; 2021 Litho is Proudly Powered by <a
                        href="https://www.themezaa.com/" target="_blank">ThemeZaa</a>
                  </p>
               </div>
               <div class="col-12 col-md-3 text-center text-md-right">
                  <div class="social-icon-style-12">
                     <ul class="extra-small-icon light">
                        <li><a class="facebook" href="https://www.facebook.com/"
                           target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a class="dribbble" href="http://www.dribbble.com"
                           target="_blank"><i class="fab fa-dribbble"></i></a></li>
                        <li><a class="twitter" href="http://www.twitter.com"
                           target="_blank"><i class="fab fa-twitter"></i></a></li>
                        <li><a class="instagram" href="http://www.instagram.com"
                           target="_blank"><i class="fab fa-instagram"></i></a></li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </footer>
   <!-- end footer -->
   <!-- start scroll to top -->
   <a class="scroll-top-arrow" href="javascript:void(0);"><i
      class="feather icon-feather-arrow-up"></i></a>
   <!-- end scroll to top -->
   <!-- javascript -->
   <script type="text/javascript" src="../resources/js/jquery.min.js"></script>
   <script type="text/javascript"
      src="../resources/js/theme-vendors.min.js"></script>
   <script type="text/javascript" src="../resources/js/main.js"></script>
</body>
</html>