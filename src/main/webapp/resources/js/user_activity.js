	function getProductId() {
		let url = location.href;
		return url.substring(url.lastIndexOf("/") + 1);
	}

	$(document).ready(function() {
		document.getElementById("submit_product_id").value = getProductId();
		console.log(getProductId());
	});

	var count;

	function startTimer() {
		var time = new Date();
		hours = time.getHours();
		mins = time.getMinutes();
		secs = time.getSeconds();
		ms = time.getMilliseconds();
		enterTime = hours * 3600 * 60 + mins * 60 * 60 + secs * 60 + ms;
		Timer();
	}

	function Timer() {
		var time = new Date();
		hours = time.getHours();
		mins = time.getMinutes();
		secs = time.getSeconds();
		ms = time.getMilliseconds();
		curTime = hours * 3600 * 60 + mins * 60 * 60 + secs * 60 + ms;
		timeSpent();
	}

	function timeSpent() {
		count = curTime - enterTime;
		console.log(count);
		window.setTimeout("Timer()", 1000);
	}

	// 페이지 첫 방문 후 페이지 이탈 시 행동 데이터 삽입
	function insertUserActivity() {

		$.ajax({
			type : 'POST',
			url : './insertUserActivity/' + getProductId(),
			data : {
				stay_time : count,
				rating : -1,
				is_like : -1
			}
		});
	}

	// 페이지 첫 방문 후 페이지 이탈 시 행동 데이터 삽입
	function insertUserActivity_wish() {

		$.ajax({
			type : 'POST',
			url : './insertUserActivity/' + getProductId(),
			data : {
				stay_time : count,
				rating : -1
			},
			success : function(data) {
				alert("위시리스트에 추가되었습니다.");
			}
		});
	}

	// 페이지 첫 방문 후 페이지 이탈 시 행동 데이터 삽입
	function insertUserActivity_review() {

		$.ajax({
			type : 'POST',
			url : './insertUserActivity/' + getProductId(),
			data : {
				stay_time : count,
				rating : -1,
				is_like : -1
			},
			success : function(data) {
				alert("리뷰가 작성되었습니다.");
			}
		});
	}

	/* // 페이지 첫 방문 후 페이지 이탈 시 행동 데이터 삽입
	function insertUserActivity() {

		$.ajax({
			type : 'POST',
			url : './insertUserActivity',
			data : {
				stay_time : count,
				rating : -1,
				is_like : -1
			}
		});
	}

	// 페이지 첫 방문 후 페이지 이탈 시 행동 데이터 삽입
	function insertUserActivity_wish() {

		$.ajax({
			type : 'POST',
			url : './insertUserActivity',
			data : {
				stay_time : count,
				rating : -1
			},
			success : function(data) {
				alert("위시리스트에 추가되었습니다.");
			}
		});
	}

	// 페이지 첫 방문 후 페이지 이탈 시 행동 데이터 삽입
	function insertUserActivity_review() {

		$.ajax({
			type : 'POST',
			url : './insertUserActivity',
			data : {
				stay_time : count,
				rating : -1,
				is_like : -1
			},
			success : function(data) {
				alert("리뷰가 작성되었습니다.");
			}
		});
	} */

	window.onbeforeunload = function() {
		insertUserActivity();
	}