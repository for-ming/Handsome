<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String user = (String) session.getAttribute("id");
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
					<h1 class="text-extra-dark-gray no-margin-bottom text-center text-lg-center"> 주문 완료 </h1><hr>
				</div>
			</div>
		</div>
	</section>
	<!-- end page title -->
    <!-- start section -->
    <section class="wow animate__fadeIn checkout">
            <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-12 col-xl-8 col-lg-6">
					<h5 class="text-extra-dark-gray no-margin-bottom text-center text-lg-center"> 
					<i class="fas fa-check-circle text-dark-tussock margin-10px-right"></i> 주문이 완료되었습니다. </h5>
				</div>
			</div>
            <div class="row justify-content-center">
                <div class="d-sm-flex justify-content-center align-items-center padding-10px-bottom text-center">
                    <i class="far fa-calendar-alt text-dark-tussock margin-10px-right"></i>
                    <span class="text-extra-dark-gray alt-font"> 주문일시 : &nbsp;</span><span class="alt-font">00-00-00</span>
                </div>
            </div>
            <div class="d-sm-flex justify-content-center align-items-center text-center">
                <div class="d-sm-flex justify-content-center align-items-center padding-10px-all text-center">
                	<a href="${pageContext.request.contextPath}" class="btn btn-light-gray btn-large d-block btn-fancy margin-15px-top">
                    <i class="fas fa-user-circle text-extra-dark-gray margin-10px-right"></i>
                	주문내역 확인</a>
                </div>
                <div class="d-sm-flex justify-content-center align-items-center padding-10px-all text-center">
                	<a href="${pageContext.request.contextPath}" class="btn btn-tussock btn-large d-block btn-fancy margin-15px-top">
                    <i class="fas fa-shopping-cart text-white margin-10px-right"></i>
                    계속 쇼핑하기</a>
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