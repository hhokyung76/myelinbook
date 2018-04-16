$.ajaxSetup({
	cache:false
});

//Paging 처리
function fn_paging(curPage, totBlockSize, fnScript) {
	curPage = curPage * 1;
	totBlockSize = totBlockSize * 1;
	var blockSize = 10;	// 블록 크기
	var skipSize = 1; // 이전/다음 선택시 이동할 페이지 갯수
	var lastPage = false;
	if(curPage == totBlockSize) lastPage = true; // 현재페이지가 마지막 페이지와 같다면
	var pgStart = parseInt(Math.max(curPage - blockSize / 2, 1));
	var pgEnd = pgStart + blockSize;
	
	// Options
	var goFirstUse = true;							// 처음 페이지 사용 여부
	var goLastUse = true;							// 마지막 페이지 사용 여부
	var goPrevUse = false;							// 이전 페이지 사용 여부
	var goNextUse = false;							// 다음 페이지 사용 여부

	
	if (pgEnd > totBlockSize + 1) {
		var diff = pgEnd - totBlockSize;
		pgStart -= diff - 1;
		if (pgStart < 1) pgStart = 1;
		pgEnd = totBlockSize + 1;
	}
	var pageHtml = "<div class=\"row\"><div class=\"col-md-12 text-center\"><ul class=\"pagination\">";
	
	// 처음 페이지
	if (goFirstUse) {
		pageHtml += "<li><a href=\"#\" onclick=\""+ fnScript +"('1');return false;\">&laquo;</a></li>";		
	}
	// 이전 페이지
	if (goPrevUse) {
		if (curPage > 1){
			var moveSize = curPage-skipSize;
			if (moveSize < 1) moveSize = 1;
			pageHtml += "<li><a href=\"#\" onclick=\""+ fnScript +"('" + moveSize + "');return false;\">&lsaquo;</a></li>";
		}
	}
	// 각 페이지 뿌리기
	for (var i = pgStart; i < pgEnd; i++) {
		// 현재 페이지
		if (i == curPage) pageHtml += "<li class=\"active\"><a>"+ i +"</a></li>";
		// 기타 페이지
		else pageHtml += "<li><a href=\"#\" onclick=\""+ fnScript +"('" + i + "');return false;\">" + i + "</a></li>";
	}
	// 다음 페이지
	if (goNextUse) {
		if (!lastPage){
			var moveSize = curPage + skipSize;
			if (moveSize > totBlockSize) moveSize = totBlockSize;
			pageHtml += "<li><a href=\"#\" onclick=\""+ fnScript +"('"+moveSize+"');return false;\">&rsaquo;</a></li>";
		}
	}
	// 마지막 페이지
	if (goLastUse) {
		pageHtml += "<li><a href=\"#\" onclick=\""+ fnScript +"('"+ totBlockSize +"');return false;\">&raquo;</a></li>";
	}
	
	pageHtml += "</ul></div></div>";
	return pageHtml;
}


/**
 * Util
 * 		- boolean isEmpty(string) : 빈값인지 체크(비었을 경우 true, 값이 있을 경우 false 리턴)
 * 		- string numberFormat(NumberValue, ['si':SI 단위계로 변환]) : 숫자를 단위로 변경하여 리턴
 * 		- string dateFormat(string[yyyyMMddhhmmss]) : 숫자를 날짜 형식으로 변경하여 리턴한다. ex) 20150213121540 > 2015.02.13 12:15 40
 * 		- int charByteSize(char) : char를 byte size로 변경하여 리턴
 * 		- int stringByteSize(string) : string을 byte size로 변경하여 리턴
 * 		- string randomNumber(int length) : 0-9까지의 숫자를 랜덤하게 length 길이만큼 생성한다. default length : 6
 * 		- string trim(string) : trimAll
 * 		- boolean onlyNumber(event) : 숫자만 입력가능
 * 		- string encHtml(string) : 꺽쇠 등 특수문자를 인코딩 한다. (< = &lt;, > = &gt;)
 * 		- string decHtml(string) : encode된 HTML을 디코딩 한다. (&lt; = <, &gt; = >)
 * @date 2015.02.13
 * @author ks-choi
 * @update kws
 */
var util = {
		isEmpty : function(v){
			var result = false;
			if (v==undefined||v=='undefined'||v.replace(/ /g,'').length==0){
				result = true;
			}
			return result;
		},
		getTextLength : function(v){
			var len = 0;
			for (var i = 0; i < v.length; i++) {
				if (escape(v.charAt(i)).length == 6) {
					len++;
				}
				len++;
			}
			return len;
		},
		numberFormat : function(v, o){
			if(v==undefined||v.isNaN)return v;
			switch (o) {
			case 'si':	// killo, mega, giga, tera...
				siArr = ['','k','M','G','T','P','E','Z','Y'];
				// 딱 맞아 떨어진다면?
				var _v = v+'';
				var x = Math.floor(_v.length/3);
				if (x > 0 && _v.length%3 == 0){
					x -= 1;
				}
				var result = _v.substring(0, _v.length-(x*3));
				if (_v.length>3) result = result+'.'+_v.substring(result.length, result.length+2);
				return result + siArr[x]+'B';
			}
		},
		dateFormat : function(v){
			if(v==undefined||v.isNaN)return v;
			var _v = v+'';
			var pArr = ['.', '.', ' ', ':', ' ']
			var lArr = [4,2,2,2,2,2];
			var result = '';
			for (var i = 0; i < lArr.length; i++){
				result += _v.substring(0,lArr[i]) + (pArr.length>i?pArr[i]:'');
				_v = _v.substring(lArr[i]);
			}
			
			
			return result;
		},
		charByteSize : function(v){
			if (v == null || v.length == 0) {
				return 0;
			}

			var vCharCode = v.charCodeAt(0);

			if (vCharCode <= 0x00007F) {
				return 1;
			} else if (vCharCode <= 0x0007FF) {
				return 2;
			} else if (vCharCode <= 0x00FFFF) {
				return 3;
			} else {
				return 4;
			}
		},
		stringByteSize : function(v){
			if (v == null || v.length == 0) {
				return 0;
			}
			var vSize = 0;

			for (var i = 0; i < v.length; i++) {
				vSize += this.charByteSize(v.charAt(i));
			}
			return vSize;
		},
		randomNumber : function(l){
			var len = l && l.length>0 && !isNaN(l)?l:6
				, text = ''
				, possible = '1234567890';
		    for( var i=0; i < len; i++ )
		        text += possible.charAt(Math.floor(Math.random() * possible.length));
		    return text;
		},
		trim : function(v){
			if (v==undefined||v=='undefined'||v.replace(/ /g,'').length==0){
				return '';
			} else {
				return v.replace(/ /g,'');
			}
		},
		encHtml : function(v){
			if (v==undefined||v=='undefined'||v.replace(/ /g,'').length==0){
				return '';
			} else {
				return $("<p/>").text(v).html();
			}
		},
		decHtml : function(v){
			if (v==undefined||v=='undefined'||v.replace(/ /g,'').length==0){
				return '';
			} else {
				return $("<p/>").html(v).text();
			}
		},
		round : function(n, pos) { // 지정자리 반올림 (값, 자릿수)
			if((n).toString().indexOf('.') == -1 ) return n; // 소수점 이하가 아니라면 그대로 리턴
			
			var digits = Math.pow(10, pos);

			var sign = 1;
			if (n < 0) {
				sign = -1;
			}

			// 음수이면 양수처리후 반올림 한 후 다시 음수처리
			n = n * sign;
			var num = Math.round(n * digits) / digits;
			num = num * sign;

			return num.toFixed(pos);
		},
		floor : function(n, pos) { // 지정자리 버림 (값, 자릿수)
			if((n).toString().indexOf('.') == -1 ) return n; // 소수점 이하가 아니라면 그대로 리턴
			
			var digits = Math.pow(10, pos);

			var num = Math.floor(n * digits) / digits;

			return num.toFixed(pos);
		},
		ceiling : function(n, pos) { // 지정자리 올림 (값, 자릿수)
			if((n).toString().indexOf('.') == -1 ) return n; // 소수점 이하가 아니라면 그대로 리턴
			
			var digits = Math.pow(10, pos);

			var num = Math.ceil(n * digits) / digits;

			return num.toFixed(pos);
		},
		comma : function(str) { //콤마찍기
			str = String(str);
			if (str.toString().indexOf('.') == -1) { // 소수가 아니라면
			    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
			} else {
				// 소수라면
				var strArray = str.split('.');
				var returnString = strArray[0].replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
				return returnString = returnString + '.' + strArray[1];
			}
		},
		uncomma : function(str) { //콤마풀기
			str = String(str);
			return str.replace(/[,]+/g, '');
		}
}

/**
 * Watcher
 * 		- boolean onlyNumber(event) : 숫자만 입력가능
 * @date 2015.02.13
 * @author ks-choi
 * @update kws
 */
var watcher = {
		onlyNumber : function(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9) 
				return;
			else
				return false;
		}
}

/**
 * Pattern Validation
 * 
 * @date 2015.02.13
 * @author ks-choi
 * @update kws
 */
var valid = {
		pattern : {
			/** 숫자 */
			number : /^\d+$/
			
			/**이메일 승인 패턴*/
			, email : /[0-9A-z][_0-9A-z-]*@[_0-9A-z-]+(\.[_0-9A-z-]+){1,2}$/
			/**전화번호 승인 패턴*/
			, telNumber : /^0\d{1,2}-\d{3,4}-\d{4}$/
			/**아이디 승인 패턴*/
			, userId : /(^[A-z0-9\-_.]{5,50}$)/
			/**이름 승인 패턴*/
			, userName : /^[ㄱ-힣|A-z|0-9|\*]{1,50}$/
			/**암호 승인 패턴0*/
			, userPwd : /(^[A-z0-9\!@#$%^&*()\-_+=|[\]{}'";:\/?\.>,<]{6,20}$)/
			/**암호 불허 패턴1*/
			, seqNumber : /(0123)|(1234)|(2345)|(3456)|(4567)|(5678)|(6789)|(7890)/
			/**암호 불허 패턴2*/
			, sameWord3Over : /(\w)\1\1\1/
			/**우편번호 패턴*/
			, zipCode : /^\d{3}-\d{3}$/
			/** IP Address 패턴 */
			, ipAddress : /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/
			/** Mac Address ( - 하이픈)*/
			, macAddress : /^[0-9A-Fa-f]{2}-[0-9A-Fa-f]{2}-[0-9A-Fa-f]{2}-[0-9A-Fa-f]{2}-[0-9A-Fa-f]{2}-[0-9A-Fa-f]{2}$/
			/** Mac Address ( : 콜론) */
			, macAddressColon : /^[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}$/
		},
		/**이메일 형식 체크*/
		isEmail : function(v){
			var result = false;
			if (v!=undefined&&v!='undefined'&&v.replace(/ /g,'').length>0){
				result = this.pattern.email.test(v);
			}
			return result;
		},
		/**연락처 형식 체크*/
		isTelNumber : function(v){
			var result = false;
			if (v!=undefined&&v!='undefined'&&v.replace(/ /g,'').length>0){
				result = this.pattern.telNumber.test(v);
			}
			return result;
		},
		/**아이디 형식 체크*/
		isId : function(v){
			var result = false;
			if (v!=undefined&&v!='undefined'&&v.replace(/ /g,'').length>0){
				result = this.pattern.userId.test(v);
			}
			return result;
		},
		/**이름 형식 체크*/
		isName : function(v){
			var result = false;
			if (v!=undefined&&v!='undefined'&&v.replace(/ /g,'').length>0){
				result = this.pattern.userName.test(v);
			}
			return result;
		},
		/**암호 형식 체크*/
		isPwd : function(v){
			var result = false;
			if (v!=undefined&&v!='undefined'&&v.replace(/ /g,'').length>0){
				result = !this.pattern.seqNumber.test(v) && !this.pattern.sameWord3Over.test(v) && this.pattern.userPwd.test(v);
			}
			return result;
		},
		isZipCode : function(v){
			var result = false;
			if (v!=undefined&&v!='undefined'&&v.replace(/ /g,'').length>0){
				result = this.pattern.zipCode.test(v)
			}
			return result;
		},
		/**숫자 형식 체크*/
		isNumber : function(v){
			var result = false;
			if (v!=undefined&&v!='undefined'&&v.replace(/ /g,'').length>0){
				result = this.pattern.number.test(v)
			}
			return result;
		},
		/**IP 형식 체크*/
		isIpAddress : function(v){
			var result = false;
			if (v!=undefined&&v!='undefined'&&v.replace(/ /g,'').length>0){
				result = this.pattern.ipAddress.test(v)
			}
			if (result){
				var ipBlocks = v.split('.');
				if (ipBlocks[0] >= 0 && ipBlocks[0] <= 255 && ipBlocks[1] >= 0 && ipBlocks[1] <= 255 && ipBlocks[2] >= 0 && ipBlocks[2] <= 255 && ipBlocks[3] >= 0 && ipBlocks[3] <= 255 ){
				} else {
					result = false;
				}
			}
			return result;
		},
		/**MacAddress형식 체크 (하이픈)*/
		isMacAddress : function(v){
			var result = false;
			if (v!=undefined&&v!='undefined'&&v.replace(/ /g,'').length>0){
				result = this.pattern.macAddress.test(v)
			}
			return result;
		},
		/**MacAddress형식 체크 (콜론)*/
		isMacAddressColon : function(v){
			var result = false;
			if (v!=undefined&&v!='undefined'&&v.replace(/ /g,'').length>0){
				result = this.pattern.macAddressColon.test(v)
			}
			return result;
		},
		/** 공백 체크*/
		isSearchBlank : function(v){
			var result = false;
			if (v!=undefined&&v!='undefined'&&v.replace(/ /g,'').length>0){
				if(v.indexOf(" ") > -1) {
					result = true;
				}
			}
			return result;
		}
}
function post_to_url(path, params, method) {
	method = method || "post"; // Set method to post by default, if not specified.

	var form = document.createElement("form");
	form.setAttribute("method", method);
	form.setAttribute("action", path);

	for(var key in params) {
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", key);
		hiddenField.setAttribute("value", params[key]);
		
		form.appendChild(hiddenField);
	}

	document.body.appendChild(form);
	form.submit();
}


function fn_maxInputByte(obJ){
	var value = $(obJ).val();
	if(calculateBytes(value)> 200){
		alert('입력할 수 있는 글자 수(200 byte)를 초과하셨습니다. 초과된 글자는 자동으로 삭제 됩니다.');
		$(obJ).val(cropStrByte(value, 200, ""));
		return;
	}
}
//Byte 계산하는 로직
function calculateBytes(szValue) {
	var tcount = 0;
	var tmpStr = new String(szValue);
	var temp = tmpStr.length;
	var onechar;
	for ( k=0; k<temp; k++ )
	{
		onechar = tmpStr.charAt(k);
		if (escape(onechar).length > 4) {
			tcount += 2;
		}
		else {
			tcount += 1;
		}
	}
	return tcount;
}
//cropStrByte
function cropStrByte(str, cropByteSize, ellipse) {
	//ellipse 는 말줄임 문자
	if (str == null || str.length == 0) {
		return "";
	}
	
	var vSize = 0;
	var cropStr = "";

	for (var i = 0; i < str.length; i++) {
		vSize += util.charByteSize(str.charAt(i));
		cropStr += str.charAt(i);
		
		if(vSize >= cropByteSize) {
			return cropStr + ellipse;
		}
	}
	return cropStr;
}
