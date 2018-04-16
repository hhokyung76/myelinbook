<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<title>컨펌 관리자</title>
	
	<!-- 공통 css -->
	<link rel="stylesheet" href="css/reset.css"/>
	<link rel="stylesheet" href="css/style.css"/>
	<link rel="stylesheet" href="css/theme.css"/>
	
	<!-- font-awesome -->
	<link rel="stylesheet" href="plugin/font-awesome/font-awesome-4.7.0/css/font-awesome.css">
	
	<!-- 데이트피커 css -->
	<link rel="stylesheet" href="plugin/zebra_datepicker/css/default/zebra_datepicker.css" type="text/css">
	
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
	<!--<script src="http://code.jquery.com/jquery-1.7.2.min.js "></script>-->
	
	<!-- 제이쿼리 -->
	<script src="js/jquery-1.11.1.min.js"></script>
	<!-- 데이트피커 js -->
	<script type="text/javascript" src="plugin/zebra_datepicker/zebra_datepicker.min.js"></script>
	<!-- 공통 js -->
	<script src="js/custom.js"></script>
</head>
<body>
	<div class="wrap"> 
	
		<header class="top_section"> 
		
			
			<nav class="clearfix navigation left" id="menu">
				<div class="logo_box"> 
					<a href="#none">
						<h1>LOGO</h1>
					</a>
				</div>
				
				<ul class="gnb">
					<li>
						<a href="#none">고객사 <i class="caret caret_down"></i></a>
						<ul class="snb">
							<li><a href="customer.html">고객사관리</a></li>
							<li><a href="brand.html">브랜드관리</a></li>
							<li><a href="contract.html">계약관리</a></li>
						</ul>
					</li>
					<li>
						<a href="#none">입고 <i class="caret caret_down"></i></a>
						<ul class="snb">
							<li><a href="product.html">제품관리</a></li>
							<li><a href="warehousing.html">입고관리</a></li>
						</ul>
					</li>
					<li>
						<a href="#none">촬영 <i class="caret caret_down"></i></a>
						<ul class="snb">
							<li><a href="photo_assign.html">촬영작업분배</a></li>
							<li><a href="#none">촬영관리</a></li>
						</ul>
					</li>
					<li>
						<a href="#none">편집 <i class="caret caret_down"></i></a>
						<ul class="snb">
							<li><a href="edit_assign.html">편집작업분배</a></li>
							<li><a href="#none">편집관리</a></li>
						</ul>	
					</li>
					<li>
						<a href="#none">컨펌 <i class="caret caret_down"></i></a>
						<ul class="snb">
							<li><a href="confirm_admin.html">관리자</a></li>
							<li><a href="confirm_customer.html">고객사</a></li>
						</ul>
					</li>
					<li>
						<a href="#none">작업통계정보</a>
						<!-- <ul class="snb">
						</ul> -->
					</li>
					<li>
						<a href="#none">운영관리 <i class="caret caret_down"></i></a>
						<ul class="snb">
							<li><a href="user.html">사용자관리</a></li>
							<li><a href="category.html">카테고리관리</a></li>
							<li><a href="RFID.html">RFID 태그관리</a></li>
							<li><a href="code.html">코드관리</a></li>
							<li><a href="menu.html">메뉴관리</a></li>
							<li><a href="authority.html">권한관리</a></li>
						</ul>
					</li>
				</ul>
				
				
				<a id="showmenu" href="#none"><i class="fa fa-align-justify"></i></a>
				
				<ol class="member">
					<li>홍길동</li>
					<li><a href="#none">내정보</a></li>
					<li><a href="login.html">로그아웃</a></li>
				</ol>
				
				
				
			</nav>
					
		</header>
		<!-- top_section -->
		
		<div class="middle_section">
		
			<div class="clearfix">
				<div class="main"> 
					<div class="main_content"> 
						
						<div class="content_box">
							<div class="table_box">
								<table class="set combined_td">
									<tbody style="">
										<tr>
											<th rowspan="2" colspan="2" style="text-align:center;">
												<p>현재 진행 상태</p>
												<p class="progress">촬영 완료</p>
											</th>
											<td>
												<label>• 총 컨펌 제품 수 </label>
												<label>- 250 EA</label>
											</td>
											
										</tr>
										<tr> 
											<td>
												<label>• 전체 진행률</label>
												<label>- 70%</label>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							
						</div>
						<!-- content_box -->
					</div>
				</div> <!-- .main -->
			</div> <!-- clearfix -->
	
		
			<div class="middle_section_contents">
				<div class="main left_side_30 fluid_in_1200">
					<div class="main_content" style="padding:0"> 
					
						<!-- <div class="main_title">
								<h2></h2>
						</div> -->
						
					
					
					
						<div class="content_box">		

							<form class="srch_box_align_left"> 
								<label for="">• 고객사명</label>
								<input type="text" id="" readonly/>
								<span class="img_srch">
									<button type="button"></button>
								</span>
							</form>
							
							<form class="srch_box_align_left"> 
								<label for="">• 브랜드명</label>
								<select name="" id="">
									<!-- 고객사에 따라 브랜드 option 추가  -->
									<!-- 
										<option value=""></option>
										<option value=""></option>
										<option value=""></option> 
									-->
								</select>
							</form>
							
							<form class="srch_box_align_left"> 
								<label for="">• 입고일자</label>
								<input type="text" id="warehousing_date"/>
							</form>
							
							<div class="submit_btn_box"> 
								<button class="inquiry" type="button">조회</button>
							</div>
							
							<div class="table_box">
								<table class="list" style="width:100%;overflow-x:auto">
									<thead> 
										<tr> 
											<th>No</th>
											<th>제품명</th>
											<th>제품 컷개수</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody> 
										<tr> 
											<td>1</td>
											<td></td>
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
				<!-- main -->
				
				<div class="main right_side_70 fluid_in_1200">
					<!-- <div class="main_title">
							<h2></h2>
					</div> -->
					<div class="main_content" style="padding:0"> 
						<div class="content_box">
							<div class="table_box">
								<table class="set">
									<tbody> 
										<tr>
											<th>촬영담당자</th>
											<td>
												홍길동
											</td>
											<th>편집담당자</th>
											<td>
												아무개
											</td>
										</tr>
									</tbody>
								</table><!-- set -->
							</div>
							
							
							<div class="submit_btn_box" style="margin-top:5px;margin-bottom:0"> 
								<button class="save" type="button" style="padding-top:9px">OK</button>
								<button class="save" type="button">반송</button>
								<button class="cancel" type="button">반송대기</button>
							</div>
							
							
							
						<!-- 사진 편집 화면 ( canvas ) -->	
							<!-- <div class="a clearfix">
							
								<div class="c"> 
									<div class="clearfix">
										<div style="border:1px solid red">
											<a href="#none">
												<img src="images/sample.jpg" alt="" style=""/>
											</a>
										</div>
										
										<div style="border:1px solid red">
											<a href="#none">
												<img src="images/sample.jpg" alt="" style="" />
											</a>
										</div>
									</div>
								</div>
							
							
								<div class="b">
									<div class="bb">
											<img class="img" src="images/sample4.jpg" alt=""/>
									
											
									</div>	 
									
									<div style="border:2px dotted blue"> 
										<div style="float:left">
											<a style="display:block" href="">
												<img src="images/sample3.jpg" alt="" style="display:block;max-width:180px"/>
											</a>
										</div> 
										<div style="float:left">
											<a style="display:block" href="">
												<img src="images/sample3.jpg" alt="" style="display:block;max-width:180px"/>
											</a>
										</div> 
										<div style="float:left">
											<a style="display:block" href="">
												<img src="images/sample3.jpg" alt="" style="display:block;max-width:180px"/>
											</a>
										</div> 
										<div style="float:left">
											<a style="display:block" href="">
												<img src="images/sample3.jpg" alt="" style="display:block;max-width:180px"/>
											</a>
										</div> 
										<div style="float:left">
											<a style="display:block" href="">
												<img src="images/sample3.jpg" alt="" style="display:block;max-width:180px"/>
											</a>
										</div> 
										<div style="float:left">
											<a style="display:block" href="">
												<img src="images/sample3.jpg" alt="" style="display:block;max-width:180px"/>
											</a>
										</div>
									</div>
									 
								 </div>
							</div> -->
							
							
						</div>
					</div>
				</div>
				
				
			</div><!-- middle_section_contents -->
		</div>
		<!-- middle_section -->
		
	</div>
	<!-- wrap -->
	
	<script type="text/javascript"> 
	$(function(){
		$('#warehousing_date').Zebra_DatePicker();	
		
		
		// ( 위로 긴 이미지 - 가로를 가득메우면 높이가 너무 커져버리는 경우 )
		if( $(".img").width() < $(".img").height() ){
		
			// ( 높이가 600보다 큰 경우 )
			//if( $(".img").height() > 600 ){
			
				$(".img").css("width","initial")
				$(".img").css("max-height","600");
				
			//}	
			
			
		}
		
	});
		
	</script>
</body>
</html>