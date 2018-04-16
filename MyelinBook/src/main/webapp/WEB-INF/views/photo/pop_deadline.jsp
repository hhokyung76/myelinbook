<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<title>마감일시 설정</title>
	
	<!-- 공통 css -->
	<link rel="stylesheet" href="../css/reset.css"/>
	<link rel="stylesheet" href="../css/style.css"/>
	<link rel="stylesheet" href="../css/theme.css"/>
	
	<!-- 데이트피커 css -->
	<link rel="stylesheet" href="../plugin/zebra_datepicker/css/default/zebra_datepicker.css" type="text/css">
	<!-- 타임피커 css -->
	<link rel="stylesheet" href="../plugin/wickedpicker/dist/wickedpicker.min.css" type="text/css">
	
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
	<!--<script src="http://code.jquery.com/jquery-1.7.2.min.js "></script>-->
	
	<!-- 제이쿼리 -->
	<script src="../js/jquery-1.11.1.min.js"></script>
	<!-- 데이트피커 js -->
	<script type="text/javascript" src="../plugin/zebra_datepicker/zebra_datepicker.min.js"></script>
	<!-- 타임피커 js -->
	<script type="text/javascript" src="../plugin/wickedpicker/dist/wickedpicker.min.js"></script>
	
	
</head>
<body class="bgc_light_grey">
			
	<div class="wrap main">
		
		<div class="main_content"> 
		
			<div class="popup_title">
					<h2>마감일시 설정</h2>
			</div>
			
			<div class="content_box">		
				<div class="table_box">
					<table class="set">
						<tbody> 
							<tr>
								<th>* 마감일자</th>
								<td>
									<div class="name_box"> 
										<input id="deadline_date" type="text"/>
									</div>
								</td>
							</tr>
							<tr>
								<th>* 마감시간</th>
								<td>
									<div class="name_box"> 
										<input id="deadline_time" type="text"/>
									</div>
								</td>
							</tr>
						</tbody>
					</table><!-- set -->
				</div>
				<!-- table_box -->
				<div class="submit_btn_box"> 
					<button class="save" type="button">설정</button>
					<button class="cancel" type="button">닫기</button>
				</div>
			</div>	
			<!-- content_box -->
		</div>
		<!-- main_content -->
	</div>
	<!-- wrap main -->
	
	
	<script type="text/javascript"> 
		$(function(){
			$('#deadline_date').Zebra_DatePicker();	
		
		
			$('#deadline_time').wickedpicker();
		
			// 설정완료
			$(".save").on("click",function(){
		
				/*
					부모화면으로 일자 / 시간 리턴 해야 함
					
				*/
				
				//닫기
				 close();
			});
			//닫기 버튼 누를 때 
			$(".cancel").on("click",function(){
				close();
			});
			
			// 창 닫기 함수
			function close(){
				parent.close();
				window.close();
				self.close();
			}
		});
	</script>
	
	
	
</body>
</html>