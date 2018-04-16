<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<title>카테고리 관리</title>
	
	<!-- 공통 css -->
	<link rel="stylesheet" href="../css/reset.css"/>
	<link rel="stylesheet" href="../css/style.css"/>
	<link rel="stylesheet" href="../css/theme.css"/>
	
	<!-- font-awesome -->
	<link rel="stylesheet" href="../plugin/font-awesome/font-awesome-4.7.0/css/font-awesome.css">
	
	<!-- 트리메뉴 css -->
	<link rel="stylesheet" href="../plugin/hummingbird_treeview/hummingbird-treeview.css">

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
			
				<div class="main_title" style="padding:30px 45px 15px 25px">
					<h2>카테고리 관리</h2>
				</div>
				
				<!-- 분기선 -->
				<!-- <div style="padding:0 13px"> 
					
				</div> -->
				<!-- 카테고리 -->
				<div class="main left_side_40 fluid_in_800">
					
					<div class="main_content" style="padding:0"> 
					
					
						<div class="content_box">								
						
							<div class="sub_title">
								<h3>
									<i class="fa fa-tags" aria-hidden="true" style="font-size:14px;margin-right:3px"></i>
									<span>카테고리</span>
								</h3>
								<hr />
							</div>
				
							
							
							<!-- 트리뷰 -->
							<ul id="treeview">
								
								<!-- span 클릭 시 부모요소 li의 아이디를 console 에 출력 -->
								<!-- 카테고리 정보를 저장, 추가, 삭제 하기 위한 id 를 li 마다 지정해야 함. -->
								<li> 
									<i class="fa fa-plus category_parent"></i><span class="tree_name pointer">카테고리</span>
									<ul>
									
										<!-- 숙녀 -->
										<li><i class="fa fa-plus"></i><span class="tree_name pointer">숙녀</span>
											
											<ul>
												<li>&bull;<span class="tree_name pointer">니트</span></li>
												<li>&bull;<span class="tree_name pointer">드레스(롱)</span></li>
												<li>&bull;<span class="tree_name pointer">드레스(숏)</span></li>
												<li>&bull;<span class="tree_name pointer">맨투맨</span></li>
												<li>&bull;<span class="tree_name pointer">베스트</span></li>
												<li>&bull;<span class="tree_name pointer">블라우스</span></li>
												<li>&bull;<span class="tree_name pointer">셔츠</span></li>
												<li>&bull;<span class="tree_name pointer">스커트(롱)</span></li>
												<li>&bull;<span class="tree_name pointer">스커트(숏)</span></li>
												<li>&bull;<span class="tree_name pointer">자켓</span></li>
												<li>&bull;<span class="tree_name pointer">점퍼</span></li>
												<li>&bull;<span class="tree_name pointer">코트</span></li>
												<li>&bull;<span class="tree_name pointer">트렌치코트</span></li>
												<li>&bull;<span class="tree_name pointer">티셔츠(긴팔)</span></li>
												<li>&bull;<span class="tree_name pointer">티셔츠(민소매)</span></li>
												<li>&bull;<span class="tree_name pointer">티셔츠(반팔)</span></li>
												<li>&bull;<span class="tree_name pointer">팬츠(긴바지)</span></li>
											</ul>
										</li>
										
										<!-- 신사 -->
										<li><i class="fa fa-plus"></i><span class="tree_name pointer">신사</span>
											
											<ul>
												<li>&bull;<span class="tree_name pointer">가디건</span></li>
												<li>&bull;<span class="tree_name pointer">니트</span></li>
												<li>&bull;<span class="tree_name pointer">맨투맨</span></li>
												<li>&bull;<span class="tree_name pointer">베스트</span></li>
												<li>&bull;<span class="tree_name pointer">셔츠(긴팔)</span></li>
												<li>&bull;<span class="tree_name pointer">셔츠(반팔)</span></li>
												<li>&bull;<span class="tree_name pointer">수트자켓</span></li>
												<li>&bull;<span class="tree_name pointer">수트팬츠</span></li>
												<li>&bull;<span class="tree_name pointer">점퍼</span></li>
												<li>&bull;<span class="tree_name pointer">집업자켓</span></li>
												<li>&bull;<span class="tree_name pointer">카라티셔츠(긴팔)</span></li>
												<li>&bull;<span class="tree_name pointer">카라티셔츠(반팔)</span></li>
												<li>&bull;<span class="tree_name pointer">코트</span></li>
												<li>&bull;<span class="tree_name pointer">티셔츠(긴팔)</span></li>
												<li>&bull;<span class="tree_name pointer">티셔츠(반팔)</span></li>
												<li>&bull;<span class="tree_name pointer">팬츠(롱)</span></li>
												<li>&bull;<span class="tree_name pointer">팬츠(숏)</span></li>
												<li>&bull;<span class="tree_name pointer">폴라티</span></li>
												<li>&bull;<span class="tree_name pointer">후드티</span></li>
											</ul>
										</li>
										
										<!-- 아웃도어 -->
										<li><i class="fa fa-plus"></i><span class="tree_name pointer">아웃도어</span>
											
											
											<ul>
												<li>&bull;<span class="tree_name pointer">드레스</span></li>
												<li>&bull;<span class="tree_name pointer">레깅스</span></li>
												<li>&bull;<span class="tree_name pointer">셔츠</span></li>
												<li>&bull;<span class="tree_name pointer">수영복(상의)</span></li>
												<li>&bull;<span class="tree_name pointer">수영복(하의)</span></li>
												<li>&bull;<span class="tree_name pointer">스커트(롱)</span></li>
												<li>&bull;<span class="tree_name pointer">스커트(숏)</span></li>
												<li>&bull;<span class="tree_name pointer">이너웨어(상의)</span></li>
												<li>&bull;<span class="tree_name pointer">이너웨어(하의)</span></li>
												<li>&bull;<span class="tree_name pointer">자켓</span></li>
												<li>&bull;<span class="tree_name pointer">점퍼</span></li>
												<li>&bull;<span class="tree_name pointer">티셔츠(긴팔)</span></li>
												<li>&bull;<span class="tree_name pointer">티셔츠(반팔)</span></li>
												<li>&bull;<span class="tree_name pointer">팬츠(긴바지)</span></li>
												<li>&bull;<span class="tree_name pointer">팬츠(반바지)</span></li>
											</ul>
										</li>
										<!-- 잡화 -->
										<li><i class="fa fa-plus"></i><span class="tree_name pointer">잡화</span>
											
											<ul>
												<!-- 잡화1 -->
												<li>&bull;<span class="tree_name pointer">골프공</span></li>
												<li>&bull;<span class="tree_name pointer">골프백</span></li>
												<li>&bull;<span class="tree_name pointer">골프백 케이스</span></li>
												<li>&bull;<span class="tree_name pointer">남성구두</span></li>
												<li>&bull;<span class="tree_name pointer">넥타이</span></li>
												<li>&bull;<span class="tree_name pointer">담배케이스</span></li>
												<li>&bull;<span class="tree_name pointer">등산화</span></li>
												<li>&bull;<span class="tree_name pointer">마스크</span></li>
												<li>&bull;<span class="tree_name pointer">머니클립</span></li>
												<li>&bull;<span class="tree_name pointer">머플러</span></li>
												<li>&bull;<span class="tree_name pointer">메신저백</span></li>
												<li>&bull;<span class="tree_name pointer">모자(썬캡)</span></li>
												<li>&bull;<span class="tree_name pointer">모자(캡)</span></li>
												<li>&bull;<span class="tree_name pointer">목걸이형 카드지갑</span></li>
												<li>&bull;<span class="tree_name pointer">반지갑</span></li>
												<li>&bull;<span class="tree_name pointer">발매트</span></li>
												<li>&bull;<span class="tree_name pointer">백팩</span></li>
												<li>&bull;<span class="tree_name pointer">벨트</span></li>
												<li>&bull;<span class="tree_name pointer">보조배터리</span></li>
												<li>&bull;<span class="tree_name pointer">선글라스(아웃도어)</span></li>
												<li>&bull;<span class="tree_name pointer">손목밴드</span></li>
												<li>&bull;<span class="tree_name pointer">손수건</span></li>
												<li>&bull;<span class="tree_name pointer">쇼퍼백</span></li>
												<li>&bull;<span class="tree_name pointer">숄더백</span></li>
												<li>&bull;<span class="tree_name pointer">스카프(1)</span></li>
												<li>&bull;<span class="tree_name pointer">스카프(2)</span></li>
												<li>&bull;<span class="tree_name pointer">슬리퍼</span></li>
												<li>&bull;<span class="tree_name pointer">신발끈</span></li>
												<li>&bull;<span class="tree_name pointer">아웃도어 백팩</span></li>
												<li>&bull;<span class="tree_name pointer">양말</span></li>
												<li>&bull;<span class="tree_name pointer">양말(케이스)</span></li>
												<li>&bull;<span class="tree_name pointer">양말(패키지)</span></li>
												<li>&bull;<span class="tree_name pointer">양산</span></li>
												<li>&bull;<span class="tree_name pointer">여성구두</span></li>
												
												<!-- 잡화2 -->
												<li>&bull;<span class="tree_name pointer">우산(long)</span></li>
												<li>&bull;<span class="tree_name pointer">우산(short)</span></li>
												<li>&bull;<span class="tree_name pointer">의자</span></li>
												<li>&bull;<span class="tree_name pointer">장갑</span></li>
												<li>&bull;<span class="tree_name pointer">장지갑</span></li>
												<li>&bull;<span class="tree_name pointer">주얼리(세분화)</span></li>
												<li>&bull;<span class="tree_name pointer">중지갑</span></li>
												<li>&bull;<span class="tree_name pointer">지팡이</span></li>
												<li>&bull;<span class="tree_name pointer">참장식</span></li>
												<li>&bull;<span class="tree_name pointer">카드지갑</span></li>
												<li>&bull;<span class="tree_name pointer">캐리어</span></li>
												<li>&bull;<span class="tree_name pointer">캐주얼화</span></li>
												<li>&bull;<span class="tree_name pointer">캠핑용품(세분화)</span></li>
												<li>&bull;<span class="tree_name pointer">컵</span></li>
												<li>&bull;<span class="tree_name pointer">크로스백</span></li>
												<li>&bull;<span class="tree_name pointer">클러치백</span></li>
												<li>&bull;<span class="tree_name pointer">키홀더</span></li>
												<li>&bull;<span class="tree_name pointer">타올</span></li>
												<li>&bull;<span class="tree_name pointer">타이핀</span></li>
												<li>&bull;<span class="tree_name pointer">토시</span></li>
												<li>&bull;<span class="tree_name pointer">토트백</span></li>
												<li>&bull;<span class="tree_name pointer">핸드폰 케이스</span></li>
												<li>&bull;<span class="tree_name pointer">홀더 및 케이스</span></li>
												<li>&bull;<span class="tree_name pointer">힙색</span></li>
												
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
				
				
				
				<!-- 카테고리 정보 -->
				<div class="main right_side_60 fluid_in_800">
					<div class="main_content" style="padding:0"> 
						
						<div class="content_box">
						
							<div class="sub_title">
								<h3>
									<i class="fa fa-info-circle" aria-hidden="true" style="font-size:16px;margin-right:3px"></i>
									<span>카테고리 정보</span>
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
											<th>* 카테고리ID</th>
											<td>
												<div class="name_box"> 
													<input type="text" disabled/>
												</div>
											</td>
										</tr>
										<tr>
											<th>* 카테고리명</th>
											<td>
												<div class="name_box"> 
													<input type="text" />
												</div>
											</td>
										</tr>
										<tr>
											<th>* 상위카테고리ID</th>
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