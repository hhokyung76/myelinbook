$.ajaxSetup({
	cache:false
});


/**
 * AJAX
 */
var ajaxUtil = {
		req : function(url, param, callback, sync, method) {
			sync = sync || true; // 지정하지 않으면 POST로 전송
			method = method || "post"; // 지정하지 않으면 POST로 전송
			
			$.ajax({
				type : method,
				url : url, 
				data : param,
				async : sync,
				success : function(data, status, xhr){
					var result;
					try{
						result = eval('('+data+')');
					} catch(e){
						if(data.indexOf('login_page_body') != -1)
							$("#session_over").show();
						return false;
					}
					
					if (callback != '' && callback != null) {
						var callbackFuntion = callback + '(result)';
						eval(callbackFuntion); // 콜백 함수 호출
					} else {
						console.log("callback funtion empty");
					}
				},
				error : function(xhr, status, thr){
					console.log("Ajax Error : " + xhr.responseText);
				},
				complete:function(xhr, status) {
					
				}
			});
			
		}
}

