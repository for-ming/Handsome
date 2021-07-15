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
<c:set var="member" value="${memberDTO}" />
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

<style>
.bh{font-family: 'Black Han Sans', sans-serif; }
.dh{font-family: 'Do Hyeon', sans-serif;}
</style>

<script>

$(function() {
	rank();
});

function rank(){
	var orderCount = '<%=orderCount%>';
	if(orderCount == 0){
		document.getElementById('myrank').innerText = " 회원 등급은 현재 FRIEND 입니다.";
	}
	else if(orderCount < 5){
		document.getElementById('myrank').innerText = " 회원 등급은 현재 CREW 입니다.";
	}
	else if(orderCount < 10){
		document.getElementById('myrank').innerText = "회원 등급은 현재 MANIA 입니다.";
	}
	else if(orderCount < 15){
		document.getElementById('myrank').innerText = "회원 등급은 현재 STAR 입니다.";
	}
	else{
		document.getElementById('myrank').innerText = "회원 등급은 현재 THE STAR 입니다.";
	}
}

</script>

</head>
<body>
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
			<label class="bh text-extra-dark-gray title-small font-weight-500 alt-font text-uppercase">내 정보</label>
		</h2>
		<div class="bg-extra-light-gray margin-60px-bottom h-1px"></div>
		<div class="jumbotron" style="height: 80%; overflow: hidden; background-color: #FFFFFF;">
			
			
		<div class="row justify-content-center">
			<div class="col-12 text-center">
			<h2>
			<label class="bh text-extra-dark-gray title-small font-weight-500 alt-font text-uppercase">한섬 온라인 등급</label>
			</h2>
			<p id="grd_subtxt_online">더한섬닷컴 구매실적을 기준으로 등급별 혜택을 제공합니다.</p>
			
			 <label class="dh text-extra-dark-gray text-extra-medium font-weight-500 alt-font text-uppercase">
				[ ${member.name} ] 님의 <div id="myrank"></div>
			 </label>
			 <br><br>
			<input type="button" class="btn btn-extra-large btn-transparent-dark-gray btn-box-shadow-flat" id="btn" value="2021년 온라인 등급별 혜택 보기" />
			</div>
		</div>

         <div class="bg-extra-light-gray margin-50px-bottom h-1px"></div>
        
                       
		</div>
		</div>
	</div>
</div>
	<!--  Bootstrap core JavaScript-->
	<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.bundle.min.js" />"></script>
</body>
</html>