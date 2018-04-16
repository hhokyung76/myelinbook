<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<title>담당자 찾기</title>
	
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
					<h2>담당자 찾기</h2>
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
								<th>* 마감시간</th>
								<td>
									<div class="name_box"> 
										<input id="deadline_time" type="text"/>
									</div>
								</td>
							</tr><!-- 
							<tr>
								
							</tr> -->
							
						</tbody>
					</table><!-- set -->
				</div>
				<!-- table_box -->
			</div>	
			<!-- content_box -->
			
			<div class="content_box">		
			
				<form class="srch_box_align_left"> 
					<label for="">• 권한</label>
					<select name="" id="" readonly>
					<!-- 
						selected 
						촬영에서 넘어왔으면 포토그래퍼 
						편집에서 넘어왔으면 웹디자이너 -->
						
						<option value="전체">전체</option>
						<option value="관리자">관리자</option>
						<option value="팀장">팀장</option>
						<option value="스타일리스트">스타일리스트</option>
						<option value="포토그래퍼">포토그래퍼</option>
						<option value="웹디자이너" selected>웹디자이너</option>
					</select>
				</form>
			
				<form class="srch_box_align_left"> 
					<label for="">• 직원명</label>
					<input type="text" id=""/>
				</form>
				
				<div class="submit_btn_box"> 
					<button class="inquiry" type="button">조회</button>
					<button class="cancel" type="button">닫기</button>
				</div>
				
				<div class="table_box">
					<table class="list" style="width:100%;overflow-x:auto">
						<thead> 
							<tr> 
								<th>No</th>
								<th>이름</th>
								<th>이메일 ( ID )</th>
								<th>권한</th>
							</tr>
						</thead>
						<tbody> 
							<tr> 
								<td>1</td>
								<td><a class="name_choose" href="#none">배은식</a></td>
								<td></td>
								<td></td>
							</tr> 
							<tr> 
								<td>2</td>
								<td></td>
								<td></td>
								<td></td>
							</tr> 
							<tr> 
								<td>3</td>
								<td></td>
								<td></td>
								<td></td>
							</tr> 
							<tr> 
								<td>4</td>
								<td></td>
								<td></td>
								<td></td>
							
							</tr> 
							<tr> 
								<td>5</td>
								<td></td>
								<td></td>
								<td></td>
								
							</tr> 
							<tr> 
								<td>6</td>
								<td></td>
								<td></td>
								<td></td>
							</tr> 
							<tr> 
								<td>7</td>
								<td></td>
								<td></td>
								<td></td>
							</tr> 
							<tr> 
								<td>8</td>
								<td></td>
								<td></td>
								<td></td>
							</tr> 
							<tr> 
								<td>9</td>
								<td></td>
								<td></td>
								<td></td>
							</tr> 
							<tr> 
								<td>10</td>
								<td></td>
								<td></td>
								<td></td>
								
							</tr>
						</tbody>
					</table>
				</div>
				<!-- table_box -->
				
				
				
				<div class="pagination"> 
					<ul>
						<li><a href="#none">≪</a></li>
						<li><a href="#none"><</a></li>
						
						<li><a href="#none">1</a></li>
						<li><a href="#none">2</a></li>
						<li><a href="#none">3</a></li>
						<li><a href="#none">4</a></li>
						<li><a href="#none">5</a></li>
						<li><a href="#none">6</a></li>
						<li><a href="#none">7</a></li>
						<li><a href="#none">8</a></li>
						<li><a href="#none">9</a></li>
						<li><a href="#none">10</a></li>
						
						<li><a href="#none">></a></li>
						<li><a href="#none">≫</a></li>
					</ul>
				</div>
				
			</div>	
			<!-- content_box -->
		</div>
		<!-- main_content -->
	</div>
	<!-- wrap main -->
	
	
	<script type="text/javascript"> 
		$(function(){
		
			// 날짜 설정
			$('#deadline_date').Zebra_DatePicker();	
		
			// 시간 설정
			$('#deadline_time').wickedpicker();
			
			
			// 이름 선택 했을 때
			$(".name_choose").on("click",function(){
		
				/*
					부모화면으로 ID(이메일) / 이름 리턴 해야 함
					
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