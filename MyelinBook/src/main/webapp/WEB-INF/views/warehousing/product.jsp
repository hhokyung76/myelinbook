<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<title>제품 관리</title>
	
	<!-- 공통 css -->
	<link rel="stylesheet" href="../css/reset.css"/>
	<link rel="stylesheet" href="../css/style.css"/>
	<link rel="stylesheet" href="../css/theme.css"/>
	
	<!-- font-awesome -->
	<link rel="stylesheet" href="../plugin/font-awesome/font-awesome-4.7.0/css/font-awesome.css">
	
	<!-- 데이트피커 css -->
	<link rel="stylesheet" href="../plugin/zebra_datepicker/css/default/zebra_datepicker.css" type="text/css">
	
	
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
	<!--<script src="http://code.jquery.com/jquery-1.7.2.min.js "></script>-->
	
	<!-- 제이쿼리 -->
	<script src="../js/jquery-1.11.1.min.js"></script>
	<!-- 데이트피커 js -->
	<script type="text/javascript" src="../plugin/zebra_datepicker/zebra_datepicker.min.js"></script>
	<!-- 공통 js -->
	<script src="../js/custom.js"></script>
</head>
<body>
	<div class="wrap"> 
	
		<header class="top_section"> 
			<jsp:include page="../header/top_navi.jsp" flush="false" />
		</header>
		<!-- top_section -->
		
		<div class="middle_section"> 
			<div class="middle_section_contents">
				<div class="main">
					
					<div class="main_content"> 
					
						<div class="main_title">
								<h2>제품 관리</h2>
						</div>
						<div class="content_box">
						
							
							<form class="srch_box_align_left"> 
								<label for="">• 고객사명</label>
								<input type="text" id="" readonly/>
								<span class="img_srch">
									<button type="button"></button>
								</span>
							</form>
						
							<form class="srch_box_align_left"> 
								<label for="">• 브랜드</label>
								<input type="text" id="" readonly/>
							</form>
							
							
						
							<div class="submit_btn_box"> 
								<button type="button" class="save">저장</button>
								<button type="button" class="cancel">취소</button>
								<button type="button" class="inquiry">Excel Import</button>
							</div>
							<div class="table_box">
								<table class="set">
									<tbody> 
										<tr>
											<th>* RFID TAG</th>
											<td colspan="3">
												<div class="name_box"> 
													<input type="text" />
												</div>
											</td>
										</tr>
										<tr>
											<th>* 제품분류</th>
											<td colspan="3">
												<div class="name_box"> 
												
													<!-- 대분류 -->
													<select name="" id="">
														<option value="선택">선택</option>
														<!-- 제품분류 option 추가  -->
													</select>
													
													<!-- 소분류 -->
													<select name="" id="" disabled>
														<option value="선택">선택</option>
														<!-- 제품분류 option 추가  -->
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<th>* 제품 번호</th>
											<td>
												<div class="name_box"> 
													<input type="text" />
												</div>
											</td>
											<th>* 제품명</th>
											<td>
												<div class="name_box"> 
													<input type="text" />
												</div>
											</td>
										</tr>
										<tr>
											<th>* 작업분류</th>
											<td>
												<div class="name_box"> 
													<select name="" id="">
														<option value="2D">2D</option>
														<option value="3D">3D</option>
														<option value="Slider">Slider</option>
														<!-- 제품분류 option 추가  -->
													</select>
												</div>
											</td>
										
											<th>촬영 컷 개수</th>
											<td>
												<div class="name_box"> 
													<input type="text" />
												</div>
											</td>
											
										</tr>
									</tbody>
								</table>
							</div>							
						</div>
						<!-- content_box -->
					
					
					
						<div class="content_box">		

							<form class="srch_box_align_left"> 
								<label for="">• 제품명</label>
								<input type="text" id=""/>
							</form>
							
							<form class="srch_box_align_left"> 
								<label for="">• 등록일자</label>
								<input type="text" id="registration_date"/>
							</form>
							
							<div class="submit_btn_box"> 
								<button class="inquiry" type="button">조회</button>
							</div>
							
							<div class="table_box">
								<table class="list" style="width:100%;overflow-x:auto">
									<thead> 
										<tr> 
											<th>No</th>
											<th>RFID TAG</th>
											<th>제품분류</th>
											<th>제품번호</th>
											<th>제품명</th>
											<th>작업분류</th>
											<th>등록(수정)일자</th>
											<th>등록(수정)자</th>
										</tr>
									</thead>
									<tbody> 
										<tr> 
											<td>1</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr> 
										<tr> 
											<td>2</td>
											<td></td>
											<td></td>
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
				<!-- main -->
			</div>
		</div>
		<!-- middle_section -->
		
	</div>
	<!-- wrap -->
	
	<script type="text/javascript"> 
	$(function(){
		$('#registration_date').Zebra_DatePicker();	
	});
		
	</script>
	
	
</body>
</html>