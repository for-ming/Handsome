<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-barcode.js"></script>
</head>
<body>
     <div id="barcode" style="margin-top:30px;"></div>
     <div id="barcode2" style="margin-top:30px;"></div>
     <div id="barcode3" style="margin-top:30px;"></div>
</body>

<script type="text/javascript">
         $("#barcode").barcode("CM2B1KCD033M", "code128");
         $("#barcode2").barcode("1234567890128", "ean13",{barWidth:2, barHeight:30});
         $("#barcode3").barcode("1234567", "int25",{barWidth:2, barHeight:30});
</script>

</html>