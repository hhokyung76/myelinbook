<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<title>상세조회</title>
	
	<!-- 공통 css -->
	<link rel="stylesheet" href="../css/reset.css"/>
	<link rel="stylesheet" href="../css/style.css"/>
	<link rel="stylesheet" href="../css/theme.css"/>
	
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
	<!--<script src="http://code.jquery.com/jquery-1.7.2.min.js "></script>-->
	
	<!-- 제이쿼리 -->
	<script src="../js/jquery-1.11.1.min.js"></script>
</head>
<body class="bgc_light_grey">
			
	<div class="wrap main">
		
		<div class="main_content"> 
		
			<div class="popup_title">
					<h2>상세조회</h2>
			</div>
			
			
			<div class="content_box">
				<div class="table_box">
					<table class="set combined_td">
						<tbody>
						
							<tr> 
								<th rowspan="4">제품 기본 정보</th>
								<td>
									<label>• RFID 태그</label>
									<label>- A0000B0000C00D00001</label>
								</td>
								<td> 
									<label>• 제품분류</label>
									<label>- 신발</label>
									<label>- 샌들</label>
								</td>
							</tr>
							<tr> 
								<td> 
									<label>• 제품번호 </label>
									<label>- AB12345CD</label>
								</td>
								<td> 
									<label>• 제품명</label>
									<label>- 소가죽 샌들</label>
								</td>
							</tr>
							<tr> 
								<td> 
									<label>• 작업분류</label>
									<label>- 2D</label>
								</td>
								<td> 
									<label>• 촬영 컷 개수</label>
									<label>- 5</label>
								</td>
							</tr>
							<tr> 
								<td> 
									<label>• 등록일시</label>
									<label>
										- 
										<span>2017-10-01</span>
										<span> 14:10:20</span>
									</label>
								</td>
								<td> 
									<label>• 등록자</label>
									<label>- 홍길동</label>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="submit_btn_box" style="margin-top:5px;margin-bottom:0;"> 
					<button class="save" type="submit">저장</button>
				</div>
				
			</div>
			
			<div class="content_box">		
				<div class="table_box">
					<table class="set">
						<tbody> 
							<tr>
								<th>* 입고여부</th>
								<td>
									<input type="radio" name="boolean_check_1" value="yes">예
									<input type="radio" name="boolean_check_1" value="no">아니오
								</td>
							</tr>
							<tr>
								<th>제품사진</th>
								<td>
								
									<div class="td_img_container">
										<div class="img_box product_img">	
											<img class="" src="images/sample.jpg" alt="" />
											<div class="td_btn_box">
												<button type="button" class="td_btn td_btn_cancel"></button>
											</div>
										</div>
									</div>
										<div class="file_box"> 
											<label for="">• 파일명 - AB12345CD</label>
											<input type="text" readonly/>
											<button type="button">파일 찾기</button>
										</div>
									
								</td>
							</tr>
							<tr>
								<th>검수사진</th>
								<td>
									<div class="td_img_container">
										<div class="img_box check_img">	
											<img class="" src="images/sample.jpg" alt="" />
											<div class="td_btn_box">
												<button type="button" class="td_btn td_btn_cancel"></button>
											</div>
										</div>
										<div class="img_box check_img">	
											<img class="" src="images/sample.jpg" alt="" />
											<div class="td_btn_box">
												<button type="button" class="td_btn td_btn_cancel"></button>
											</div>
										</div>
										<div class="img_box check_img">	
											<img class="" src="images/sample.jpg" alt="" />
											<div class="td_btn_box">
												<button type="button" class="td_btn td_btn_cancel"></button>
											</div>
										</div>
										<div class="img_box check_img">	
											<img class="" src="images/sample.jpg" alt="" />
											<div class="td_btn_box">
												<button type="button" class="td_btn td_btn_cancel"></button>
											</div>
										</div>
									</div>
								
									<div class="file_box"> 
										<label for="">• 파일명 - AB12345CD</label>
										<input type="text" readonly/>
										<button type="button">파일 찾기</button>
									</div>
									<div class="file_box"> 
										<label for="">• 파일명 - AB12345CD</label>
										<input type="text"readonly/>
										<button type="button">파일 찾기</button>
									</div>
									<div class="file_box"> 
										<label for="">• 파일명 - AB12345CD</label>
										<input type="text" readonly/>
										<button type="button">파일 찾기</button>
									</div>
									<div class="file_box">
										<label for="">• 파일명 - AB12345CD</label>
										<input type="text" readonly/>
										<button type="button">파일 찾기</button>
									</div>
									
								</td>
							</tr>
							<tr>
								<th>제품상태</th>
								<td>
									<input type="radio" name="faulty_check_1" value="normal">정상
									<input type="radio" name="faulty_check_1" value="faulty">불량
								</td>
							</tr>
							<tr>
								<th>불량사유</th>
								<td>
									<div class="note_box"> 
										<input type="text" />
									</div>
								</td>
							</tr>
							<tr>
								<th>스팀여부</th>
								<td>
									<input type="radio" name="boolean_check_2" value="yes">예
									<input type="radio" name="boolean_check_2" value="no">아니오
								</td>
							</tr>
							<tr>
								<th>실측사이즈 측정</th>
								<td>
									<div class="note_box"> 
										<input type="text" />
									</div>
								</td>
							</tr>
							<tr>
								<th>케어텍</th>
								<td>
									<div class="td_img_container">
										<div class="img_box caretag_img">	
											<img class="" src="images/care_tag.png" alt="" />
											<div class="td_btn_box">
												<button type="button" class="td_btn td_btn_down"></button>
												<button type="button" class="td_btn td_btn_cancel"></button>
											</div>
										</div>
										<div class="img_box caretag_img">	
											<img class="" src="images/care_tag2.png" alt="" />
											<div class="td_btn_box">
												<button type="button" class="td_btn td_btn_down"></button>
												<button type="button" class="td_btn td_btn_cancel"></button>
											</div>
										</div>
									</div>
									
									<div class="file_box"> 
										<label for="">• 파일명 - AB12345CD</label>
										<input type="text" readonly/>
										<button type="button">파일 찾기</button>
									</div>
									<div class="file_box"> 
										<label for="">• 파일명 - AB12345CD</label>
										<input type="text"readonly/>
										<button type="button">파일 찾기</button>
									</div>
									
								</td>
							</tr>
							
						</tbody>
					</table><!-- set -->
				</div>
				<!-- table_box -->
			</div>	
			<!-- content_box -->
		</div>
		<!-- main_content -->
	</div>
	<!-- wrap main -->
	<script type="text/javascript"> 
		$(function(){
		
			// 저장
			$(".save").on("click",function(){
		
				/*
					부모화면으로 일자 / 시간 리턴 해야 함
					
				*/
				
				//닫기
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