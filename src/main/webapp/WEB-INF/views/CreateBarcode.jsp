<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-barcode.js"></script>
</head>
<body>
	<form>
		''-@ 바코드 만들어드립니다 <br><br>
		Product ID : <input type="text" id="pid">
		Color : 	<input type="text" id="color">
		Size : 		<input type="text" id="size"><br>
		<button onclick="create();">만들기</button>
	</form>	
	숫자 코드가 소문자<div id="barcode1" style="margin-top:30px; width: 500px;"></div><br>
	<div id="result"></div>
	시연하려던 바코드 색상 소문자 <div id="barcode2" style="margin-top:30px; width: 500px;"></div><br>
</body>

<script type="text/javascript">
		function create(){
			var pid = $("#pid").val();
			var color = $("#color").val();
			var size = $("#size").val();
			var url = pid+"/"+color+"/"+size;
			
			document.getElementById('result').innerText = $("#barcode").barcode(url, "code93");
			
			
			
		}
		 $("#barcode1").barcode("YN2B3TTO612NM1/694b41/M", "code93");
         $("#barcode2").barcode("IL2B0QOT771WS/cca07c/82", "code93");
</script>

</html>