<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<title>로그인</title>
	
	<link rel="stylesheet" href="<c:url value="/css/reset.css" />"/>
	<link rel="stylesheet" href="<c:url value="/css/style.css" />"/>
	<link rel="stylesheet" href="<c:url value="/css/theme.css" />"/>
	
</head>

<body class="bgc_light_grey">
			
	<div class="wrap main">
		
		<div class="main_content membership login"> 
		
			<div class="main_title">
					<h2>로그인</h2>
			</div>
			
			<div class="content_box">
				
				<form  action="" class="text-right" id="login_form" method="post" name="login_form">
					<div class="clearfix">
						<div class="srch_box_align_left"> 
							<input type="text" id="userId" name="userId" placeholder="&nbsp;&nbsp;아이디"/>
						</div>
						
						<div class="srch_box_align_left "> 
							<input type="password" style="margin-bottom:5px" id="pwd" name="pwd" placeholder="&nbsp;&nbsp;비밀번호"/>
						</div>
						
						<div style="float:left"> 
							<input type="checkbox" value="yes">
							<label>ID저장</label>
						</div>
						
						<div class="submit_btn_box" style="float:right">
							<button type="button" id=btnLogin class="save">로그인</button>
						</div>
						<div class="text-right" style="float:right">
							<br>
							<br>
							<c:if test="${msg == 'failure'}">
			                    <div style="color: red">
			                        아이디 또는 비밀번호가 일치하지 않습니다.
			                    </div>
			                </c:if>
			                <c:if test="${msg == 'logout'}">
			                    <div style="color: red">
			                        로그아웃되었습니다.
			                    </div>
			                </c:if>
						</div>
					</div>
				</form>
				<hr/>
				
				<div class="submit_btn_box"> 
					<button type="button" class="save" onClick="location.href='<c:url value="/signup" />'">회원가입</button>
					<button type="button" class="save" onClick="location.href='<c:url value="/find/id" />'">아이디 찾기</button>
					<button type="button" class="save" onClick="location.href='<c:url value="/find/pwd" />'">비밀번호 찾기</button>
				</div>
				
			</div>	
			<!-- content_box -->
		</div>
		<!-- main_content -->
	</div>
	<!-- wrap main -->
	
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="<c:url value="/js/jquery-1.10.2.js" />" type="text/javascript"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="<c:url value="/js/bootstrap.min.js" />" type="text/javascript"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="<c:url value="/js/valid/jquery.validate.min.js" />" type="text/javascript"></script>
	<script src="<c:url value="/js/valid/localization/messages_ko.min.js" />" type="text/javascript"></script>
	<script src="<c:url value="/js/mask/jquery.mask.min.js" />" type="text/javascript"></script>
	<script src="<c:url value="/js/util.ajax.js" />"></script>
	<script type="text/javascript">
	$('#id').mask('AAAAAAAAAA', {'translation': { A: {pattern: /[A-Za-z0-9]/ } } });
	
	var loginValid = $('#login_form').validate({
		rules: {
			userId : { minlength:5, maxlength:10, required: true },
			pwd : { minlength:6, maxlength:10, required: true }
		},
		errorPlacement: function (label, element) {   
			$('<span class="error"></span>').insertAfter($(element).parent()).append(label)
			var parent = $(element).parent('.input-with-icon');
			parent.removeClass('success-control').addClass('error-control');
		}
	});
	
	
	$(document).ready(function(){
        $("#btnLogin").click(function(){
            // 태크.val() : 태그에 입력된 값
            // 태크.val("값") : 태그의 값을 변경 
            var userId = $("#txtUserId").val();
            var userPw = $("#txtUserPw").val();
            if(userId == ""){
                alert("아이디를 입력하세요.");
                $("#txtUserId").focus(); // 입력포커스 이동
                return; // 함수 종료
            }
            if(userPw == ""){
                alert("패스워드를 입력하세요.");
                $("#txtUserPw").focus();
                return;
            }
            var theForm  = document.login_form; 
            // 폼 내부의 데이터를 전송할 주소
            theForm.action = "${path}/login"
            // 제출
            theForm.submit();
        });
    });
	</script>
	
	
	
	
</body>
</html>