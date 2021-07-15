<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<style>

canvas.drawing, canvas.drawingBuffer {
	position: absolute;
}

video{
	position: absolute;
	 width: 640;
     height: 480;
}
.dh{font-family: 'Do Hyeon', sans-serif;}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/quagga.js"></script>

</head>
<body>
 <!-- start header -->
 <jsp:include page="Header.jsp"></jsp:include>
 <!-- end header -->
 <!-- start section -->
<section class="big-section wow animate__fadeIn " >
    <div class="container ">
        <div class="row justify-content-center bg-light-cream">
            <div class="col-md-12 text-center margin-eight-all ">
                <b></b><h6 class="alt-font text-extra-dark-gray font-weight-500">바코드 스캔 장바구니 서비스</h6></b>
            </div>
        </div>
        <div class="row row-cols-1 row-cols-lg-4 row-cols-sm-2 justify-content-center bg-light-cream">
            <!-- start progress step item -->
            <div class="col-10 text-center process-step-style-03 simple md-margin-5-rem-bottom wow animate__fadeIn" data-wow-delay="0.2s">
                <div class="process-step-item">
                    <div class="process-step-item-box">
                        <span class="process-step-item-box-bfr bg-medium-gray"></span>
                        <div class="process-step-icon">
                            <span class="process-step-number text-white font-weight-500">
                                <span class="process-step-number-bfr bg-light-peach "></span>1<span class="process-step-number-afr bg-gradient-magenta-orange-2"></span>
                            </span>
                        </div>
                        <div class="process-content last-paragraph-no-margin">
                            <span class="alt-font d-inline-block font-weight-500 text-medium-slate-blue text-uppercase margin-10px-bottom">상품 고르기</span>
                            <p>한섬 매장에서 마음에 드는 상품을 발견하셨나요? </p>
                        </div>                        
                    </div>
                </div>
            </div>
            <!-- end progress step item -->
            <!-- start progress step item -->
            <div class="col-10 text-center process-step-style-03 simple md-margin-5-rem-bottom wow animate__fadeIn" data-wow-delay="0.2s">
                <div class="process-step-item">
                    <div class="process-step-item-box">
                        <span class="process-step-item-box-bfr bg-medium-gray"></span>
                        <div class="process-step-icon">
                            <span class="process-step-number text-white font-weight-500">
                                <span class="process-step-number-bfr bg-light-peach "></span>2<span class="process-step-number-afr bg-gradient-magenta-orange-2"></span>
                            </span>
                        </div>
                        <div class="process-content last-paragraph-no-margin">
                            <span class="alt-font d-inline-block font-weight-500 text-medium-slate-blue text-uppercase margin-10px-bottom">바코드 스캐너 이용하기</span>
                            <p>마음에 드는 상품의 바코드를 찍어 온라인 장바구니에 상품을 담을 수 있어요.</p>
                        </div>                        
                    </div>
                </div>
            </div>
            <!-- end progress step item -->
            <!-- start progress step item -->
            <div class="col-10 text-center process-step-style-03 simple xs-margin-5-rem-bottom wow animate__fadeIn" data-wow-delay="0.4s">
                <div class="process-step-item">
                    <div class="process-step-item-box">
                        <span class="process-step-item-box-bfr bg-medium-gray"></span>
                        <div class="process-step-icon">
                            <span class="process-step-number text-white font-weight-500">
                                <span class="process-step-number-bfr bg-light-peach"></span>3<span class="process-step-number-afr bg-gradient-magenta-orange-2"></span>
                            </span>
                        </div>
                        <div class="process-content last-paragraph-no-margin">
                            <span class="alt-font d-inline-block font-weight-500 text-medium-slate-blue text-uppercase margin-10px-bottom">온라인 장바구니 구매</span>
                            <p>나의 장바구니 속 상품을 온라인을 통해 주문해보세요!</p>
                        </div>                        
                    </div>
                </div>
            </div>
            <!-- end progress step item -->
            <!-- start progress step item -->
            <div class="col-10 text-center process-step-style-03 simple wow animate__fadeIn" data-wow-delay="0.5s">
                <div class="process-step-item">
                    <div class="process-step-item-box">
                        <span class="process-step-item-box-bfr bg-medium-gray"></span>
                        <div class="process-step-icon">
                            <span class="process-step-number text-white font-weight-500">
                                <span class="process-step-number-bfr bg-light-peach"></span>4<span class="process-step-number-afr bg-gradient-magenta-orange-2"></span>
                            </span>
                        </div>
                        <div class="process-content last-paragraph-no-margin">
                            <span class="alt-font d-inline-block font-weight-500 text-medium-slate-blue text-uppercase margin-10px-bottom">상품 픽업하기</span>
                            <p>구매한 상품은 즉시 픽업존에서 준비됩니다.<br> 원하는 지점에서 픽업해보세요!</p>
                        </div>                        
                    </div>
                </div>
            </div>
            <!-- end progress step item -->
        </div>
    </div>
</section>
<!-- end section -->
 
 
 <div class="row justify-content-center">
	<div class="col-12 text-center">
		<input type="button" class="btn btn-extra-large btn-transparent-dark-gray btn-box-shadow-flat" id="btn" value="　　바코드 스캐너　　" />
	</div>
</div>
<!-- Div to show the scanner -->
<div id="scanner-container"></div>


<script>
    var _scannerIsRunning = false;
    
    function startScanner() {
        Quagga.init({
            inputStream: {
                name: "Live",
                type: "LiveStream",
                target: document.querySelector('#scanner-container'),
                constraints: {
                    width: 640,
                    height: 480,
                    facingMode: "environment"
                },
            },
            decoder: {
                readers: [
                    "code_93_reader"
                ],
                debug: {
                    showCanvas: true,
                    showPatches: true,
                    showFoundPatches: true,
                    showSkeleton: true,
                    showLabels: true,
                    showPatchLabels: true,
                    showRemainingPatchLabels: true,
                    boxFromPatches: {
                        showTransformed: true,
                        showTransformedBox: true,
                        showBB: true
                    }
                }
            },
        }, function (err) {
            if (err) {
                console.log(err);
                return
            }
            Quagga.start();
            _scannerIsRunning = true;
        });

        
        Quagga.onProcessed(function (result) {
            var drawingCtx = Quagga.canvas.ctx.overlay;
            var drawingCanvas = Quagga.canvas.dom.overlay;
            if (result) {
             if (result.boxes) {
                 drawingCtx.clearRect(0, 0, parseInt(drawingCanvas.getAttribute("width")), parseInt(drawingCanvas.getAttribute("height")));
                 result.boxes.filter(function (box) {
                     return box !== result.box;
                 }).forEach(function (box) {
                     Quagga.ImageDebug.drawPath(box, { x: 0, y: 1 }, drawingCtx, { color: "green", lineWidth: 2 });
                 });
             }

             if (result.box) {
                 Quagga.ImageDebug.drawPath(result.box, { x: 0, y: 1 }, drawingCtx, { color: "#00F", lineWidth: 2 });
             }

             if (result.codeResult && result.codeResult.code) {
                 Quagga.ImageDebug.drawPath(result.line, { x: 'x', y: 'y' }, drawingCtx, { color: 'red', lineWidth: 3 });
             }
            }
        });

        Quagga.onDetected(function (result) {
        	var insert_url = "${pageContext.request.contextPath}/cart/insert/"+result.codeResult.code;
        	alert(insert_url);
            $.ajax({
    			type : "GET",
    			url : insert_url,
    			success: function(data){
    				Swal.fire({
    					  title: '장바구니에 상품이 정상적으로<br>담겼습니다.',
    					  icon: 'success',
    					  showDenyButton: true,
    					  confirmButtonText: `계속 스캔하기`,
    					  denyButtonText: `장바구니로 이동`,
    					  confirmButtonColor: '#85b8d6',
    					  denyButtonColor: '#db943d'
    					}).then((confirmresult) => {
    					  if (confirmresult.isConfirmed) {
    						  Quagga.stop();
    						  startScanner();
    					  } else if (confirmresult.isDenied) {
    					   		window.location.href= "${pageContext.request.contextPath}/cart/";
    					  }
    				})
    			},
    			error : function(request, status, error){
    				Swal.fire('바코드를 다시 인식해주세요.');
    			}
    		});
            sleep(3000);
        });
    }
    
    function sleep(ms) {
    	  const wakeUpTime = Date.now() + ms;
    	  while (Date.now() < wakeUpTime) {}
    }
    
    // Start/stop scanner
    document.getElementById("btn").addEventListener("click", function () {
        if (_scannerIsRunning) {
            Quagga.stop();
            location.reload();
        } else {
            startScanner();
        }
    }, false);
   </script>
    
<!-- javascript -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/theme-vendors.min.js"></script>

</body>
</html>

