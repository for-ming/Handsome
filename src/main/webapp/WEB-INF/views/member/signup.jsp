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
	
<meta name="description"
	content="Litho is a clean and modern design, BootStrap 4 responsive, business and portfolio multipurpose HTML5 template with 36+ ready homepage demos.">

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
href="../resources/css/member/signup.css" />
</head>
<body data-mobile-nav-style="classic">
	<!-- start header -->
	<jsp:include page="../Header.jsp"></jsp:include>
	<!-- end header -->
	<!-- start page title -->
	<section
		class="wow animate__fadeIn bg-light-gray padding-25px-tb page-title-small">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-12 col-xl-8 col-lg-6">
					<h1
						class="alt-font text-extra-dark-gray font-weight-500 no-margin-bottom text-center text-lg-left">My
						account</h1>
				</div>
				<div
					class="col-12 col-xl-4 col-lg-6 breadcrumb justify-content-center justify-content-lg-end text-small alt-font md-margin-10px-top">
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
			<div class="row justify-content-center">

				<div class="col-12 col-xl-5 offset-xl-1 col-md-6 lg-padding-30px-lr md-padding-15px-lr">
					<h6 class="alt-font font-weight-500 text-extra-dark-gray">Register</h6>
					<form action="${pageContext.request.contextPath}/member/signupAction" class="border-all border-color-medium-gray padding-4-rem-all lg-margin-35px-top md-padding-2-half-rem-all was-validated"  method="POST" onsubmit="return registerCheck()">

						<div class="form-group">
						<label class="margin-15px-bottom">Phonenumber</label>	
							<div class="flexdisplay">
								<input type="tel" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" class="form-control" id="uphone" placeholder="전화번호 입력 (ex 010-1234-5678)" name="phone" required>
								<input type="button" class="btn btn-primary btn-dark-gray" onclick="duplicationPhone();" value="중복확인" />						
							</div>

						</div>
						<br />
						
						
						<div class="form-group">
							<label class="margin-15px-bottom">이름</label>	
							<div class="flexdisplay">
								<input type="text" class="form-control" id="uname" placeholder="이름 입력" name="name" required>
							</div>

						</div>
						<br />
						
						
						<div class="form-group">
							<label class="margin-15px-bottom">성별</label>	
							<div class="flexdisplay ">
								<label class="radio">
								  <input type="radio" name ="gender" id="ugender" value="m"> 남자
								</label>
								<label class="radio">
								  <input type="radio" name ="gender"  id="ugender" value="w"> 여자
								</label>
							</div>

						</div>
						<br />
						
												
						<div class="form-group">
							<label class="margin-15px-bottom">주소</label>	
							<div class="flexdisplay">
								<input type="text" class="form-control" id="uaddress" placeholder="주소 입력" name="address" required>
							</div>

						</div>
						<br />
						
						<div class="form-group">
							<label class="margin-15px-bottom">생년월일</label>	
							<div class="flexdisplay">
								<input type="text" class="form-control" id="ubirth" placeholder="생년월일 입력 (ex 19980108)" name="birth" required>
							</div>

						</div>
						<br />
						
						<input type="hidden" id="uage" name="age" value="">
						
												
						<div class="form-group">
							<label class="margin-15px-bottom">선호 브랜드</label>	
							<div class="form-control">
								<select id="upreferbrand" name="prefer_brand_id" required>
							    	<option value="">선호 브랜드 선택</option>
							    	<c:forEach var="brand" items="${brandlist}">
							    	<option value="${brand.id}">${brand.name}</option>
								</c:forEach>
								</select>		
							</div>

						</div>
						<br />
						
						<div class="form-group">
							<label class="margin-15px-bottom">선호 매장</label>	
							<div class="form-control">
								<select id="upreferdepartment" name="prefer_department_id" required>
							    	<option value="">선호 매장 선택</option>
							    	<c:forEach var="department" items="${departmentlist}">
							    	<option value="${department.id}">${department.name}</option>
								</c:forEach>
								</select>		
							</div>

						</div>
						<br />
						
						<div class="form-group">
						<label class="margin-15px-bottom">아이디</label>
							<div class ="flexdisplay">
								<input type="text" class="form-control" id="uid" placeholder="아이디 입력" name="id" required> 
								<input id="idck" type="button"  onclick="duplicationId();" class="btn btn-primary btn-dark-gray"  value="중복확인"/>
							</div>

						</div>
						<br/>
						<div class="form-group">
							<label class="margin-15px-bottom">비밀번호</label>
							<div class="flexdisplay">
								<input type="password" class="form-control" id="pwd" placeholder="비밀번호 입력" name="password" required>
							</div>

						</div>
						<div class="form-group">
							<div class="flexdisplay">
								<input type="password" class="form-control" id="pwdChk" placeholder="비밀번호 확인" name="pwdChk" required>
							</div>
								</div>
						<div class="pwd-1" >비밀번호를 입력해주세요.</div>
						<br />
						<div class="form-group " >
							<button type="submit" class="btn btn-medium btn-primary w-100 btn-dark-gray btn-fancy" id="registerButton">가입하기</button>
						</div>
						<br />
						<div class="form-group">
							이미 가입하셨다면?&nbsp;
							<a href="${pageContext.request.contextPath}/member/signin">로그인</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- end section -->

	<!-- start footer -->

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
	<script>
  	$("#pwd").keyup(function(){
  		$("#registerButton").attr("disabled", true);
  		$(".pwd-1").text("");
  	});
  	$("#pwdChk").keyup(function(){
  		if($(this).val()===$("#pwd").val()){
  			$(".pwd-1").text("비밀번호와 일치합니다.").css("color", "green");
  			$("#registerButton").attr("disabled", false);
  			
  		}else{
  			$(".pwd-1").text("비밀번호와 일치하지 않습니다.").css("color", "red");
	  		$("#registerButton").attr("disabled", true);
  		}
  	});
  </script>
  <script type="text/javascript">
  	var idck = 0;
 	function duplicationId() {
 		var userid = $("#uid").val();
 		$.ajax({
				async: false,
				type: 'POST',
				data : {"id": userid },
				url : '${pageContext.request.contextPath}/member/check/idcheck',
				success : function(data) {
					if(data == "exist") {
						alert('아이디가 존재합니다. 다른 아이디를 입력해주세요.');
	  					$("#uid").focus();
	  					idck = 0;
	  				} else {
	  					alert('사용가능한 아이디입니다.');
	  					$('#uid').focus();
	  					idck = 1;
	  				}
				},
				error : function(error) {
					alert('error : ' + error);
				}
			});
 	}

	var phoneck = 0;
 	function duplicationPhone() {
 		var userphone = $("#uphone").val();
 		$.ajax({
				async: false,
				type: 'POST',
				data : {"phone": userphone },
				url : '${pageContext.request.contextPath}/member/check/phonecheck',
				success : function(data) {
					if(data == "exist") {
						alert( '번호가 사용중입니다. 다른 번호를 입력해주세요.');
	  					$("#uphone").focus();
	  					phoneck = 0;
	  				} else {
	  					alert('사용가능한 번호입니다.');
	  					$('#uphone').focus();
	  					phoneck = 1;
	  				}
				},
				error : function(error) {
					alert('실패', 'error : ' + error, 'error');
				}
			});
 	}
 	$('#uid').on('keyup', function() {
		idck = 0;
	});

 	$('#uphone').on('keyup', function() {
 		phoneck = 0;
	});
 	
 	var ageck = 0;
 	function getAge(){
 		var birth = $("#ubirth").val();
 		if(birth!=""){
 	 		var date = new Date();
 		    var year = date.getFullYear();
 		    var month = (date.getMonth() + 1);
 		    var day = date.getDate();
 		    if (month < 10) month = '0' + month;
 		    if (day < 10) day = '0' + day;
 		    var monthDay = month + day;
 		    var birthdayy = birth.substr(0, 4);
 		    var birthdaymd = birth.substr(4, 4);
 		    var age = monthDay < birthdaymd ? year - birthdayy - 1 : year - birthdayy;
 		    $("#uage").val(age);
 	
 		    ageck=1;
 		}

 		
 	}
 	
 	function registerCheck() {
 		getAge();
 		
 		if(ageck == 0){
			alert('생년월일을 입력해주세요.');
 			return false;
 		}
 		
 		if(idck == 0) {
			alert('아이디 중복 여부를 확인해주세요.');
 			return false;
 		}
 		if(phoneck == 0) {
 			alert('핸드폰 중복 여부를 확인해주세요.');
 			return false;
 		}
 		return true;
 	}
 	
  </script>
</body>
</html>