<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/icon/favicon.png">
<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/icon/favicon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="${pageContext.request.contextPath}/resources/icon/favicon.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="${pageContext.request.contextPath}/resources/icon/favicon.png">

<!-- style sheets and font icons  -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-icons.min.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/member/font-icons.min.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/member/theme-vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/member/style.css" />
<link rel="stylesheet" type="text/css"
	href="../resources/css/member/responsive.css" />
<link rel="stylesheet" type="text/css"
href="../resources/css/member/signin.css" />
</head>
<body data-mobile-nav-style="classic">
	<!-- start header -->
	<jsp:include page="../Header.jsp"></jsp:include>
	<!-- end header -->
	<!-- start page title -->
        <section class="wow animate__fadeIn bg-light-gray padding-25px-tb page-title-small">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="col-12 col-xl-8 col-lg-6">
                        <h1 class="alt-font text-extra-dark-gray font-weight-500 no-margin-bottom text-center text-lg-left">My account</h1>
                    </div>
                    <div class="col-12 col-xl-4 col-lg-6 breadcrumb justify-content-center justify-content-lg-end text-small alt-font md-margin-10px-top">
                        <ul class="xs-text-center">
                            <li><a href="index.html">Home</a></li>
                            <li>My account</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- end page title -->
        <!-- start section -->
        <section class="wow animate__fadeIn">
            <div class="container">
                <div class="row justify-content-center margin-30px-top">
                    <div class="col-12 col-xl-5 col-md-6 lg-padding-30px-lr md-padding-15px-lr sm-margin-40px-bottom">
                        <h6 class="alt-font font-weight-500 text-extra-dark-gray">Login</h6>
                        <form action="${pageContext.request.contextPath}/member/signinAction" class="border-all border-color-medium-gray padding-4-rem-all lg-margin-35px-top md-padding-2-half-rem-all was-validated"  method="POST" >
							<div class="form-group">
								<label class="margin-15px-bottom">아이디</label>
								<div class ="flexdisplay">
									<input type="text" id="uid" class="inputcontainer" placeholder="아이디 입력" name="id" required> 
								</div>
							</div>
							<div class="form-group">
								<label class="margin-15px-bottom">비밀번호</label>
								<div class ="flexdisplay">
									<input type="text"id="upassword" class="inputcontainer" placeholder="비밀번호 입력" name="password" required> 
								</div>
							</div>
         					<div class="form-group " >
								<button type="submit" class="btn btn-medium btn-primary w-100 btn-dark-gray btn-fancy" id="loginbutton">로그인</button>
							</div>
                         </form>
                    </div>

                </div>
                <div class="row justify-content-center">
	               <div class="col-12 col-xl-5 col-md-6 lg-padding-30px-lr md-padding-15px-lr sm-margin-40px-bottom form-group">
					아직 가입 안하셨다면?&nbsp;
						<a href="${pageContext.request.contextPath}/member/signup">회원가입</a>
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
        <script type="text/javascript" src="../resources/js/jquery.min.js"></script>
        <script type="text/javascript" src="../resources/js/theme-vendors.min.js"></script>
        <script type="text/javascript" src="../resources/js/main.js"></script>
    </body>
</html>