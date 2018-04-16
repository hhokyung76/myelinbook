<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<title>편집작업분배</title>
	
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
			<jsp:include page="../header/top_navi.jsp" flush="false" />
		</header>
		<!-- top_section -->
		
		<div class="middle_section"> 
			<div class="middle_section_contents">
				<div class="main">
					
					<div class="main_content"> 
					
						<div class="main_title">
								<h2>편집작업 분배</h2>
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
								<label for="">• 브랜드명</label>
								<select name="" id="" readonly>
									<option value="선택">선택</option>
									<!-- 고객사에 따라 브랜드 option 추가  -->
									
								</select>
							</form>
						
							<form class="srch_box_align_left"> 
								<label for="">• 제품명</label>
								<input type="text" id=""/>
							</form>
							
							<form class="srch_box_align_left"> 
								<label for="">• 편집담당자 설정 여부</label>
								<select name="" id="" readonly>
									<option value="전체">전체</option>
									<option value="예">예</option>
									<option value="아니오">아니오</option>
								</select>
							</form>
							
							<form class="srch_box_align_left"> 
								<label for="">• 편집샘플사진 설정 여부</label>
								<select name="" id="" readonly>
									<option value="전체">전체</option>
									<option value="예">예</option>
									<option value="아니오">아니오</option>
								</select>
							</form>
							
							<form class="srch_box_align_left"> 
								<label for="">• 담당자변경요청</label>
								<select name="" id="" readonly>
									<option value="전체">전체</option>
									<option value="예">예</option>
									<option value="아니오">아니오</option>
								</select>
							</form>
							
							
							<div class="submit_btn_box"> 
								<button class="inquiry" type="button">조회</button>
								<button class="manual_input incharge_set" type="button">편집담당자 설정</button>
								<button class="manual_input sample_set" type="button">편집샘플사진 설정</button>
								<button class="cancel" type="button">편집담당자 설정취소</button>
								<button class="cancel" type="button">편집샘플사진 설정취소</button>
								<button class="manual_input deadline_set" type="button">마감시간 설정</button>
							</div>
							
							<div class="table_box">
								<table class="list long_table" style="width:100%;overflow-x:auto">
									<thead> 
										<tr> 
											<th>No</th>
											<th class="th_check">
												<input type="checkbox" />
											</th>
											<th>제품사진</th>
											<th>RFID TAG</th>
											<th>제품분류</th>
											<th>제품번호</th>
											<th>제품명</th>
											
											<th style="background-color:#FFD1AA">편집 담당자</th>
											<th style="background-color:#FFD1AA">편집 샘플 사진</th>
											<th style="background-color:#FFD1AA">마감일시</th>
										</tr>
									</thead>
									<tbody> 
										<tr> 
											<td>1</td>
											<td>
												<input type="checkbox" />
											</td>
											<td>
												<img src="images/sample.jpg" alt="" />
											</td>
											<td>12345678910</td>
											<td>abc</td>
											<td>12345678910</td>
											<td>미디어플로우</td>
											
											<td>
												<button type="button" class="td_btn td_btn_srch incharge_set">선택</button>
											</td>
											<td>
												<button type="button" class="td_btn td_btn_srch sample_set">선택</button>
											</td>
											<td>
												<span>2017.11.01</span> 
												<br /> 
												<span>17:00</span>
											</td>
										</tr> 
										<tr> 
											<td>2</td>
											<td>
												<input type="checkbox" />
											</td>
											<td>
												<img src="images/sample.jpg" alt="" />
											</td>
											<td>12345678910</td>
											<td>abc</td>
											<td>12345678910</td>
											<td>미디어플로우</td>
											
											<td>
												배은식
												
												<div class="td_btn_box">
													<button type="button" class="td_btn td_btn_edit" disabled></button>
													<button type="button" class="td_btn td_btn_cancel"></button>
												</div>
											</td>
											<td>
												<img src="images/sample.jpg" alt="" />
												
												<div class="td_btn_box">
													<button type="button" class="td_btn td_btn_cancel"></button>
												</div>
											</td>
											<td>
												<span>2017.11.01</span> 
												<br /> 
												<span>17:00</span>
											</td>
										</tr> 
										<tr> 
											<td>3</td>
											<td>
												<input type="checkbox" />
											</td>
											<td></td>
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
											<td>
												<input type="checkbox" />
											</td>
											<td></td>
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
											<td>
												<input type="checkbox" />
											</td>
											<td></td>
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
											<td>
												<input type="checkbox" />
											</td>
											<td></td>
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
											<td>
												<input type="checkbox" />
											</td>
											<td></td>
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
											<td>
												<input type="checkbox" />
											</td>
											<td></td>
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
											<td>
												<input type="checkbox" />
											</td>
											<td></td>
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
											<td>
												<input type="checkbox" />
											</td>
											<td></td>
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
	
		//팝업창
		
		// 편집담당자
		$(".incharge_set").on("click",function(){
			window.open("pop_incharge_srch.html","","width=780, height=850, resizable=no, scrollbars=no, status=no;");
		});
		
		// 편집샘플사진
		$(".sample_set").on("click",function(){
			window.open("pop_photo_sample_edit.html","","width=1000, height=1000, resizable=no, scrollbars=no, status=no;");
		});
		
		// 마감시간
		$(".deadline_set").on("click",function(){
			window.open("pop_deadline.html","","width=450, height=250, resizable=no, scrollbars=no, status=no;");
		});
			
		
		
	});
	</script>
	
	
</body>
</html>