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
     
      

  
      
      function filteractiongendermain(){
	   	var url = window.location.pathname;
	   	var urlvar = url.split("/");
	   	
	   	var data;
	   	
	   	var sex;
	   	var maincategory_id="";
// 	   	var subcategory_id="";
	   	

		sex = urlvar[3];
		data = {"sex":sex};
		if(urlvar[4] != null){
			maincategory=urlvar[4];
			data.maincategory_id = maincategory;
// 			if(urlvar[5]!=null){
// 				subcategory=urlvar[5];
// 				data.subcategory_id = subcategory;
// 			}
		}

  	 	var color = $('input[name="color"]:checked').val();	
    	if(color != null){
    		data.colorfilter = color;
    	}
 
    	var brandfilter=[];
    	$('input[name="brand"]:checked').each(function(i){
    		brandfilter.push($(this).val());
    	});
	   	if(brandfilter != ""){
	   		data.brandfilter = brandfilter;
	   	}
    	
	   	console.log(brandfilter);
	   	
	   	console.log(data);

   		$.ajax({
 			type : 'post',
 			headers:{"Content-type" : "application/json","X-HTTP-Method-Override":"POST"},
 			traditional : true,
 			url : '${pageContext.request.contextPath}/product/filtergendermain',
 			data : JSON.stringify(data),
 			dataType:"json",
 			contentType: "application/json",
 			async : false,
 			success : function(result) {
 				$('.product-listing').empty();
 				$('.product-listing').append("<li class=\"grid-sizer\"></li>");
 				var productcolorlist = result.productcolorlist;
 				var productlistmap = result.productlistmap;
 				var brandlistmap = result.brandlistmap;
 				
 				console.log(productcolorlist);
 				for(var i in productlistmap){
 					var str="";
 					var product_id = productlistmap[i].id;

 					var productcolors = productcolorlist[product_id];

 					str += " <a href=\"${pageContext.request.contextPath}/productdetail/"+product_id+"\">";
 					str += "<li class=\"productcontainer grid-item wow animate__fadeIn\">";
 					str += "<div class=\"product-box margin-45px-bottom lg-margin-25px-bottom xs-no-margin-bottom\" >";
 					str += "<div class=\"product-image border-radius-6px\">";
 					for(var j in productcolors){
 						str+="<img class=\"default-image\" src=\"${pageContext.request.contextPath}/resources/images/product/"+productlistmap[i].sex+"/"+productlistmap[i].maincategory_id+"/"+productlistmap[i].subcategory_id+"/"+productcolors[j].imagePath+".jpg\" />";
 						str+="<img class=\"hover-image\" src=\"${pageContext.request.contextPath}/resources/images/product/"+productlistmap[i].sex+"/"+productlistmap[i].maincategory_id+"/"+productlistmap[i].subcategory_id+"/"+productcolors[j].imagePath+".jpg\" />";
 						break;
 					}
 					console.log(str);
 					str+=" <div class=\"product-overlay bg-gradient-extra-midium-gray-transparent\"></div>";
 					str+="<div class=\"product-hover-bottom text-center padding-30px-tb\">";
 					str+="<a href=\"#\" class=\"move-top-bottom\" data-toggle=\"tooltip\" data-placement=\"top\" ></a>";
 					str+="</div>";
 					str+="</div>";
 					str+="<div class=\"productdetail\" data-value=\""+product_id+"\">";
 					str+="<div class=\"detailcontainer brand\" data-value=\""+productlistmap[i].brand_id+"\">";
 					str+=brandlistmap[productlistmap[i].brand_id];
 					str+="</div>";
 					str+="<div class=\"detailcontainer title\">"+productlistmap[i].title+"</div>";
 					str+="<div class=\"detailcontainer\">₩"+productlistmap[i].price.toLocaleString()+"</div>";
 					str+="<ul class=\"colorscontainer detailcontainer\">";
 					for(var j in productcolors){
 						str+="<li class=\"colorlist\">";
 						str+="<input class=\"d-none\" type=\"radio\" id=\""+productcolors[j].color+"\" value=\""+productcolors[j].color+"\" name=\"color\" checked onClick=\"colorclick(this)\"/> ";
 						str+="<label for=\""+productcolors[j].color+"\"><span style=\"background-color: #"+productcolors[j].color+"; border-radius:0; border:0.2px solid gray\"></span></label>";
 						str+="</li>";
 					}
 					str+="</ul>";
 					str+="</div>";
 					str+="</div>";
 					str+="</li>";
 					str+="</a>";
 					$('.product-listing').append(str);
 					
 					console.log(str);
 				}

 			},
 			error : function(request, status, error) {
 				alert("code:" + request.status + "\n" + "message:"
 						+ request.responseText + "\n" + "error:" + error);
 			}
 		});
      }


    </script>
    <body data-mobile-nav-style="classic">
        <!-- start header -->
          <jsp:include page="../Header.jsp"></jsp:include>
        <!-- end header -->
        <!-- start page title -->
        <section class="half-section parallax" data-parallax-background-ratio="0.5" style="background-image:url('images/portfolio-bg.jpg');">
            <div class="container">
                <div class="row align-items-stretch justify-content-center extra-small-screen">
                    <div class="col-12 col-xl-8 col-lg-7 col-md-8 page-title-extra-small text-center d-flex justify-content-center flex-column">
                        <h1 class="alt-font text-gradient-sky-blue-pink margin-15px-bottom d-inline-block">
                     상품 목록
                       </h1>
                        <h4 class="text-extra-dark-gray alt-font font-weight-500 letter-spacing-minus-1px line-height-50 sm-line-height-45 xs-line-height-30 no-margin-bottom">
                              <div class = "categorycontainer">
                                  <div class="categorygender"><c:out value="${gender}"></c:out></div>
                              <c:if test="${maincategory ne null}"><div class="categoryicon">></div><div class="categorymain"><c:out value="${maincategory}"></c:out></div></c:if>
                              <c:if test="${subcategory ne null}"><div class="categoryicon">></div><div class="categorymain"><c:out value="${subcategory}"></c:out></div></c:if>
                              </div>
                  </h4>
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
                                 <div class="checkcontainer"><input class="inputcheck" type="checkbox" name="brand" value="${brand.key}" ></div><label><c:out value="${brand.value}"></c:out></label>
                              </div>
                           </c:forEach>

                        </div>                                               
                          </div>
                          <div class="eachfilter " onClick="showfilter(this)">
                             <div class="select" >
                           <div class="filtertitle">색상</div>
                           <div class="filterselected"></div>
                           <div class="arrow"><img alt="" src="${pageContext.request.contextPath}/resources/images/icon/arrow.png"></div>
                        </div>   
                        <div class="list colorfilter">
                         <ul class="alt-font shop-color ">
                                  <c:forEach var="maincolor" items="${maincolorlist}">
                                    <li class="eachcolorlist">
                                       <input class="d-none" type="radio" id="${maincolor.color}" value="${maincolor.color}" name="color" /> 
                                       <label for="${maincolor.color}"><span style="border-radius:0; background-color: #${maincolor.color}"></span></label>
                                    </li>
                                   </c:forEach>
                        </ul>
                        </div>   
                          </div>
                          
                          <div class="eachfilter filter_buttons">
                             <a href="" onClick="top.location='javascript:location.reload()" class="filter_reset">
                                초기화
                             </a>
                             <div class="filter_action" onClick="filteractiongendermain()">
                                적용
                             </div>
                             
                          </div>
                          <div class="eachfilter total_products">
                             <div>전체</div>
                             <div class="total"><strong>${total_product}</strong>개</div>
                          </div>
     
                       </div>
                        <ul class="product-listing shop-wrapper grid grid-loading grid-5col xl-grid-4col lg-grid-3col md-grid-2col sm-grid-2col xs-grid-1col gutter-extra-large text-center">
                            <li class="grid-sizer"></li>
                           
                              <c:forEach var="product" items="${productlist}">
                                 <c:set var="productcolors" value="${productcolorlist[product.id]}"/>
                               <!-- start shop item -->
                               <a href="${pageContext.request.contextPath}/productdetail/${product.id}">
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