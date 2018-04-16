<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<title>가입</title>
	
	<link rel="stylesheet" href="<c:url value="/css/reset.css" />"/>
	<link rel="stylesheet" href="<c:url value="/css/style.css" />"/>
	<link rel="stylesheet" href="<c:url value="/css/theme.css" />"/>
	
	<link href="<c:url value="/js/sweetalert/sweetalert.css" />" rel="stylesheet" type="text/css" />
	<link href="<c:url value="/js/jquery-loading/jquery.loading.min.css" />" rel="stylesheet" type="text/css" />
	 
</head>
<body class="bgc_light_grey">

	<div class="wrap main">
		
		<div class="main_content membership register"> 
		
			<div class="main_title">
					<h2>사용자가입</h2>
			</div>
			
			<form id="signup_form">
			<div class="content_box">
				<div class="table_box">
					<table class="set">
						<tbody>
							<tr>
								<th>* 아이디</th>
								<td>
									<div class="name_box"> 
										<input type="text" id="userId" name="userId"/>
									</div>
								</td>
							</tr>
							<tr>
								<th>* 비밀번호</th>
								<td>
									<div class="name_box"> 
										<input type="password" id="pwd" name="pwd" />
									</div>
								</td>
							</tr>
							<tr>
								<th>* 비밀번호 확인</th>
								<td>
									<div class="name_box"> 
										<input type="password" id="pwd_again" name="pwd_again" />
									</div>
								</td>
							</tr>
							
							<tr>
								<th>* 이메일</th>
								<td>
									<div class="mail_box"> 
										<input type="text" class="form-control" id="emailId" name="emailId" placeholder="">
										<span>@</span>
										<input type="text" class="form-control" id="emailAddrNm" name="emailAddrNm" placeholder="">
										<select class="form-control" id="emailAddrCd" name="emailAddrCd" onchange="emailChange(this);">
											<c:choose>
												<c:when test="${!empty codeList}">
													<option value="">직접입력</option>
													<c:forEach var="codeList" items="${codeList}">
														<option value="${codeList.codeId}">${codeList.codeName}</option>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<option value="">없음</option>
												</c:otherwise>
											</c:choose>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<th>* 이름</th>
								<td>
									<div class="name_box"> 
										<input type="text" id="name" name="name"/>
									</div>
								</td>
							</tr>
							<tr>
								<th>* 휴대폰 번호</th>
								<td>
									<div class="phone_num_box"> 
										<select id="mobileNo1" name="mobileNo1">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>
										<span>-</span>
										<input type="text" id="mobileNo2" name="mobileNo2">
										<span>-</span>
										<input type="text" id="mobileNo3" name="mobileNo3">
									</div>
								</td>
							</tr>
						</tbody>
					</table><!-- set -->
				</div>
				<!-- table_box -->
				
				<div class="submit_btn_box"> 
					<button type="submit" class="save">저장</button>
					<button type="button" class="cancel" onClick="location.href='<c:url value="/login" />'">취소</button>
				</div>
				
			</div>
			</form>
			<!-- content_box -->
		</div>
		<!-- main_content -->
	</div>
	<!-- wrap main -->

	<script src="<c:url value="/js/jquery-1.10.2.js" />" type="text/javascript"></script>
	<script src="<c:url value="/js/bootstrap.min.js" />" type="text/javascript"></script>
	<script src="<c:url value="/js/valid/jquery.validate.min.js" />" type="text/javascript"></script>
	<script src="<c:url value="/js/valid/localization/messages_ko.min.js" />" type="text/javascript"></script>
	<script src="<c:url value="/js/mask/jquery.mask.min.js" />" type="text/javascript"></script>
	<script src="<c:url value="/js/util.ajax.js" />"></script>
	<script src="<c:url value="/js/util.js" />"></script>
	<script src="<c:url value="/js/sweetalert/sweetalert.min.js" />"></script>
	<script src="<c:url value="/js/jquery-loading/jquery.loading.min.js" />"></script>
	
	<script type="text/javascript">
	
	$('#mobileNo2').mask('0000');
	$('#mobileNo3').mask('0000');
	
	$('#mobileNo2').keyup(function (key) {
		if(this.value.length >= 4) $('#mobileNo3').focus(); 
	});
	
	jQuery.validator.addMethod("userIdRegular", function(value, element) {
		return this.optional( element ) || /[A-Za-z0-9]/.test( value );
	}, '영어와 숫자만 입력해주세요.');
	
	var valid = $('#signup_form').validate({
		rules: {
			userId : {
				userIdRegular : true,
				minlength:6, maxlength:10, required: true,
				remote: {
					url: '<c:url value="/check" />',
					type: 'post',
					data: {
						userId : function() {
							return $('#userId').val();
						}
					}
				}
			},
			pwd : { minlength:6, maxlength:10, required: true },
			pwd_again: { minlength:6, maxlength:10, required: true, equalTo: "#pwd" },
			name : { required: true },
			emailId : { maxlength:20, required: true },
			emailAddrNm : { maxlength:100, required: true }
		},
		messages: {
			userId: {
				remote : '아이디가 중복되었습니다. 다른 아이디를 입력해주세요.'
			}
		},
		errorPlacement: function (label, element) { // render error placement for each input type  
			$('<span class="error"></span>').insertAfter(element).append(label);
			var parent = $(element).parent('.input-with-icon');
			parent.removeClass('success-control').addClass('error-control');
		},
		submitHandler: function (form) {
			if (util.isEmpty($('#mobileNo1').val()) || util.isEmpty($('#mobileNo2').val()) || util.isEmpty($('#mobileNo3').val())) {
				if (util.isEmpty($('#mobileNo3').val())) $('#mobileNo3').focus();
				if (util.isEmpty($('#mobileNo2').val())) $('#mobileNo2').focus();
				swal({ title: "주의", text: "휴대전화번호를 입력해주세요.", type: "warning" });
				return false;
			} else {
				var mobileNo = $('#mobileNo1').val() + '-' + $('#mobileNo2').val() + '-' + $('#mobileNo3').val();
				$('#mobileNo').val(mobileNo);
			}
			
			$('.container').loading({ message: '저장중...' });
			ajaxUtil.req("<c:url value='/signup'/>", $('#signup_form').serialize(), 'signCallback');
		}
	});

	function signCallback(result) {
		if(result.success == "success"){
			swal({ title: "성공!", text: "관리자 승인이후 로그인 가능합니다", type: "success" }
				, function(){
					location.href = '<c:url value="/login" />';
				});
		} else {
			swal({ title: "오류가 발생했습니다.", text: "오류가 반복되면 관리자에게 문의하세요.", type: "error" });
			$('.container').loading('stop');
		}
	}

	function emailChange(obj) {
		if (util.isEmpty($(obj).val())) {
			$('#emailAddrNm').val(null);
			$('#emailAddrNm').removeAttr("readonly");
		} else {
			$('#emailAddrNm').attr("readonly", true);
			$('#emailAddrNm').val($(obj).find(':selected').text());
		}
	}

	</script>
</body>
</html>