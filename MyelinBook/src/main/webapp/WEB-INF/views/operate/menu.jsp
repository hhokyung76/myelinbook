<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<title>메뉴 관리</title>
	
	<!-- 공통 css -->
	<link rel="stylesheet" href="../css/reset.css"/>
	<link rel="stylesheet" href="../css/style.css"/>
	<link rel="stylesheet" href="../css/theme.css"/>
	
	<!-- font-awesome -->
	<link rel="stylesheet" href="../plugin/font-awesome/font-awesome-4.7.0/css/font-awesome.css">
	
	<!-- 트리메뉴 css -->
	<link rel="stylesheet" href="../plugin/hummingbird_treeview/hummingbird-treeview.css">
	<!-- font-awesome -->
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
	<!--<script src="http://code.jquery.com/jquery-1.7.2.min.js "></script>-->
	
	<!-- 제이쿼리 -->
	<script src="../js/jquery-1.11.1.min.js"></script>
	<!-- 트리메뉴 js -->
	<script src="../plugin/hummingbird_treeview/hummingbird-treeview.js"></script>
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
			
				<div class="main_title" style="padding:30px 45px 8px 30px">
					<h2>메뉴 관리</h2>
				</div>
				
				<div class="main left_side_40 fluid_in_800">
					<div class="main_content" style="padding:0"> 
					
						<div class="content_box">		

							<div class="sub_title">
								<h3>
									<i class="fa fa-tags" aria-hidden="true" style="font-size:14px;margin-right:3px"></i>
									<span>메뉴</span>
								</h3>
								<hr />
							</div>
						
						
							<!-- 트리뷰 -->
							<ul id="treeview">
								
								<!-- span 클릭 시 부모요소 li의 아이디를 console 에 출력 -->
								<!-- 메뉴 정보를 저장, 추가, 삭제 하기 위한 id 를 li 마다 지정해야 함. -->
								<li> 
									<i class="fa fa-plus category_parent"></i><span class="tree_name pointer">메뉴</span>
									<ul>
									
										<!-- 고객사 -->
										<li><i class="fa fa-plus"></i><span class="tree_name pointer">고객사</span>
											
											<ul>
												<li>&bull;<span class="tree_name pointer">고객사관리</span></li>
												<li>&bull;<span class="tree_name pointer">브랜드관리</span></li>
												<li>&bull;<span class="tree_name pointer">계약관리</span></li>
											</ul>
										</li>
										
										<!-- 입고 -->
										<li><i class="fa fa-plus"></i><span class="tree_name pointer">입고</span>
											
											<ul>
												<li>&bull;<span class="tree_name pointer">제품관리</span></li>
												<li>&bull;<span class="tree_name pointer">입고관리</span></li>
											</ul>
										</li>
										
										<!-- 촬영 -->
										<li><i class="fa fa-plus"></i><span class="tree_name pointer">촬영</span>
											
											<ul>
												<li>&bull;<span class="tree_name pointer">촬영작업분배</span></li>
												<li>&bull;<span class="tree_name pointer">촬영관리</span></li>
											</ul>
										</li>
										
										<!-- 편집 -->
										<li><i class="fa fa-plus"></i><span class="tree_name pointer">편집</span>
											
											<ul>
												<li>&bull;<span class="tree_name pointer">편집작업분배</span></li>
												<li>&bull;<span class="tree_name pointer">편집관리</span></li>
											</ul>
										</li>
										
										<!-- 컨펌 -->
										<li><i class="fa fa-plus"></i><span class="tree_name pointer">컨펌</span>
											
											<ul>
												<li>&bull;<span class="tree_name pointer">관리자</span></li>
												<li>&bull;<span class="tree_name pointer">고객사</span></li>
											</ul>
										</li>
										
										<!-- 작업통계정보 -->
										<li><i class="fa fa-plus"></i><span class="tree_name pointer">작업통계정보</span></li>
										
										<!-- 운영관리 -->
										<li><i class="fa fa-plus"></i><span class="tree_name pointer">운영관리</span>
											
											<ul>
												<li>&bull;<span class="tree_name pointer">사용자관리</span></li>
												<li>&bull;<span class="tree_name pointer">카테고리관리</span></li>
												<li>&bull;<span class="tree_name pointer">RFID 태그관리</span></li>
												<li>&bull;<span class="tree_name pointer">코드관리</span></li>
												<li>&bull;<span class="tree_name pointer">메뉴관리</span></li>
												<li>&bull;<span class="tree_name pointer">권한관리</span></li>
											</ul>
										</li>
										
									</ul>
								</li>
							</ul>
							<!-- #treeview -->
						
							

							
							
							
							
						</div>	
						<!-- content_box -->
					</div>
					<!-- main_content -->
				</div>
				<!-- main -->
				
				<div class="main right_side_60 fluid_in_800">
					<div class="main_content" style="padding:0"> 
					
						<div class="content_box">
						
						
							<div class="sub_title">
								<h3>
									<i class="fa fa-info-circle" aria-hidden="true" style="font-size:16px;margin-right:3px"></i>
									<span>메뉴정보</span>
								</h3>
								<hr />
							</div>
						
						
							<div class="submit_btn_box"> 
								<button type="button" class="save">저장</button>
								<button type="button" class="save">추가</button>
								<button type="button" class="cancel">삭제</button>
							</div>
							<div class="table_box">
								<table class="set">
									<tbody> 
										<tr>
											<th>* 메뉴ID</th>
											<td>
												<div class="name_box"> 
													<input type="text" disabled/>
												</div>
											</td>
										</tr>
										<tr>
											<th>* 메뉴명</th>
											<td>
												<div class="name_box"> 
													<input type="text" />
												</div>
											</td>
										</tr>
										<tr>
											<th>* 상위메뉴ID</th>
											<td>
												<div class="name_box"> 
													<input type="text" />
												</div>
											</td>
										</tr>
										<tr>
											<th>* 비고</th>
											<td>
												<div class="note_box"> 
													<input type="text" style="width:80%;min-width:145px"/>
												</div>
											</td>
										</tr>
									</tbody>
								</table><!-- set -->
							</div>
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

	// 트리뷰 사용
	$("#treeview").hummingbird();
	
	// 체크박스 사용 안할 시에는 펼침 메소드를 사용할 수 없다. 
	// 트리거로 카테고리 목록 [ 숙녀, 신사, 아웃도어, 잡화 ] 펼친다.
	$("#treeview").find(".category_parent").trigger("click");

	// 리스트 클릭 시 아이디 얻기 위한 코드 ( 카테고리관리, 메뉴관리 )
	$("#treeview").on("click", 'li>span.tree_name', function() {
		console.log("클릭한 요소 아이디", $(this).parent().attr('id'));
	});
	
});
	</script>
</body>
</html>