<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<title>사용자 회원가입</title>
	
	<!-- 공통 css -->
	<link rel="stylesheet" href="../css/reset.css"/>
	<link rel="stylesheet" href="../css/style.css"/>
	<link rel="stylesheet" href="../css/theme.css"/>
	
</head>
<body class="bgc_light_grey">
			
	<div class="wrap main">
		
		<div class="main_content membership register"> 
		
			<div class="main_title">
					<h2>사용자 회원가입</h2>
			</div>
			
			<div class="content_box">		
				<div class="table_box">
					<table class="set">
						<tbody> 
							<tr>
								<th>* 이메일</th>
								<td>
									<div class="mail_box"> 
										<input type="text" />
										<span>@</span>
										<input type="text" readonly/>
										<select name="" id="">
											<option value="">선택</option>
											<option value="">직접입력</option>
											<option value="">google.com</option>
											<option value="">naver.com</option>
											<option value="">daum.net</option>
										</select>
										<button type="button">중복확인</button>
									</div>
								</td>
							</tr>
							<tr>
								<th>* 비밀번호</th>
								<td>
									<div class="name_box"> 
										<input type="text" />
									</div>
								</td>
							</tr>
							<tr>
								<th>* 비밀번호 확인</th>
								<td>
									<div class="name_box"> 
										<input type="text" />
									</div>
								</td>
							</tr>
							<tr>
								<th>* 이름</th>
								<td>
									<div class="name_box"> 
										<input type="text" />
									</div>
								</td>
							</tr>
							<tr>
								<th>* 휴대폰 번호</th>
								<td>
									<div class="phone_num_box"> 
										<select name="" id="">
											<option value="">010</option>
											<option value="">060</option>
											<option value="">070</option>
										</select>
										<span>-</span>
										<input type="text" />
										<span>-</span>
										<input type="text" />
									</div>
								</td>
							</tr>
						</tbody>
					</table><!-- set -->
				</div>
				<!-- table_box -->
				
				<div class="submit_btn_box"> 
					<button type="submit" class="save">저장</button>
					<button type="button" class="cancel" onClick="location.href='login.html'">취소</button>
				</div>
				
			</div>	
			<!-- content_box -->
		</div>
		<!-- main_content -->
	</div>
	<!-- wrap main -->

</body>
</html>