<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<title>RFID 태그관리</title>
	
	<!-- 공통 css -->
	<link rel="stylesheet" href="../css/reset.css"/>
	<link rel="stylesheet" href="../css/style.css"/>
	<link rel="stylesheet" href="../css/theme.css"/>
	
	<!-- font-awesome -->
	<link rel="stylesheet" href="../plugin/font-awesome/font-awesome-4.7.0/css/font-awesome.css">
	
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
	<!--<script src="http://code.jquery.com/jquery-1.7.2.min.js "></script>-->
	
	<!-- 제이쿼리 -->
	<script src="../js/jquery-1.11.1.min.js"></script>
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
								<h2>RFID 태그관리</h2>
						</div>
						<div class="content_box">
							<div class="submit_btn_box"> 
								<button type="button" class="save">저장</button>
							</div>
							<div class="table_box">
								<table class="set">
									<tbody> 
										<tr>
											<th>* 태그번호</th>
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
								<label for="">• 고객사명</label>
								<input type="text" id=""/>
							</form>

							<div class="submit_btn_box"> 
								<button class="inquiry" type="button">조회</button>
								<button class="cancel" type="button">삭제</button>
							</div>		
							
							<div class="table_box">
								<table class="list long_table" style="width:100%;overflow-x:auto">
									<thead> 
										<tr> 
											<th>No</th>
											<th class="th_check">
												<input type="checkbox" />
											</th>
											<th>태그번호</th>
										</tr>
									</thead>
									<tbody> 
										<tr> 
											<td>1</td>
											<td></td>
											<td></td>
										</tr>
										<tr> 
											<td>2</td>
											<td></td>
											<td></td>
										</tr>
										<tr> 
											<td>3</td>
											<td></td>
											<td></td>
										</tr>
										<tr> 
											<td>4</td>
											<td></td>
											<td></td>
										</tr>
										<tr> 
											<td>5</td>
											<td></td>
											<td></td>
										</tr>
										<tr> 
											<td>6</td>
											<td></td>
											<td></td>
										</tr>
										<tr> 
											<td>7</td>
											<td></td>
											<td></td>
										</tr>
										<tr> 
											<td>8</td>
											<td></td>
											<td></td>
										</tr>
										<tr> 
											<td>9</td>
											<td></td>
											<td></td>
										</tr>
										<tr> 
											<td>10</td>
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
</body>
</html>