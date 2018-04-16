<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<title>촬영 샘플사진 설정</title>
	
	<!-- 공통 css -->
	<link rel="stylesheet" href="../css/reset.css"/>
	<link rel="stylesheet" href="../css/style.css"/>
	<link rel="stylesheet" href="../css/theme.css"/>
	
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
	<!--<script src="http://code.jquery.com/jquery-1.7.2.min.js "></script>-->
	
	<!-- 제이쿼리 -->
	<script src="../js/jquery-1.11.1.min.js"></script>

</head>
<body> 
	<div class="wrap main">
		
		<div class="main_content"> 
		
			<div class="popup_title">
			
					
					<h2>
						<!-- 촬영 / 편집 페이지별 제목 변경 -->
						촬영(편집) 샘플사진 설정
					</h2>
					
					
			</div>
			
			<div class="content_box">		
			
				<form class="srch_box_align_left"> 
					<label for="">• 제품분류</label>
					<select name="" id="" readonly>
						<option value="선택">선택</option>
						<!-- option 추가  -->
					</select>
					<select name="" id="" disabled>
						<option value="선택">선택</option>
						<!-- option 추가  -->
					</select>
				</form>
				
				<form class="srch_box_align_left"> 
					<label for="">• 제품명</label>
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
								<th>대분류</th>
								<th>소분류</th>
								<th>제품명</th>
								<th>제품사진</th>
								<th>촬영샘플사진</th>
							</tr>
						</thead>
						<tbody> 
							<tr> 
								<td>1</td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<a class="save" href="#none">
										<img src="images/sample.jpg" alt="" />
									</a>
									<a class="save" href="#none">
										<img src="images/sample.jpg" alt="" />
									</a>
									<a class="save" href="#none">
										<img src="images/sample.jpg" alt="" />
									</a>
									<a class="save" href="#none">
										<img src="images/sample.jpg" alt="" />
									</a>
									
								</td>
								<td>
									<a class="save" href="#none">
										<img src="images/sample.jpg" alt="" />
									</a>
								</td>
							</tr> 
							<tr> 
								<td>2</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr> 
							<tr> 
								<td>3</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr> 
							<tr> 
								<td>4</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							
							</tr> 
							<tr> 
								<td>5</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								
							</tr> 
							<tr> 
								<td>6</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr> 
							<tr> 
								<td>7</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr> 
							<tr> 
								<td>8</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr> 
							<tr> 
								<td>9</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr> 
							<tr> 
								<td>10</td>
								<td></td>
								<td></td>
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