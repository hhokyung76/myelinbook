<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<title>권한 관리</title>
	
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
					<h2>권한 관리</h2>
				</div>
				
				<div class="main left_side_40 fluid_in_800">
					<div class="main_content" style="padding:0"> 
					
						<div class="content_box">		
						
						
							<div class="sub_title">
								<h3>
									<i class="fa fa-code-fork" aria-hidden="true" style="font-size:14px;margin-right:3px"></i>
									<span>권한정보</span>
								</h3>
							</div>
						
						
							<div class="submit_btn_box"> 
								<button class="inquiry" type="button">조회</button>
							</div>
							<div class="table_box">
								<table class="list" style="width:100%;overflow-x:auto">
									<thead> 
										<tr> 
											<th>No</th>
											<th>권한명</th>
											<th class="th_delete">삭제</th>
										</tr>
									</thead>
									<tbody> 
										<tr> 
											<td>1</td>
											<td>전체관리자</td>
											<td>
												<button type="button" class="td_btn td_btn_cancel"></button>
											</td>
										</tr> 
										<tr> 
											<td>2</td>
											<td>관리자</td>
											<td>
												<button type="button" class="td_btn td_btn_cancel"></button>
											</td>
										</tr> 
										<tr> 
											<td>3</td>
											<td>팀장</td>
											<td>
												<button type="button" class="td_btn td_btn_cancel"></button>
											</td>
										</tr> 
										<tr> 
											<td>4</td>
											<td>스타일리스트</td>
											<td>
												<button type="button" class="td_btn td_btn_cancel"></button>
											</td>
										</tr> 
										<tr> 
											<td>5</td>
											<td>포토그래퍼</td>
											<td>
												<button type="button" class="td_btn td_btn_cancel"></button>
											</td>
										</tr>
										<tr>
											<td>6</td>
											<td>웹디자이너</td>
											<td>
												<button type="button" class="td_btn td_btn_cancel"></button>
											</td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- table_box -->
							
							<!-- pagination -->
							
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
									<i class="fa fa-tags" aria-hidden="true" style="font-size:14px;margin-right:3px"></i>
									<span>권한</span>
								</h3>
								<div class="spacer"></div>
							</div>
						
							<form class="srch_box_align_left" style=""> 
								<label for="">• 권한명</label>
								<input type="text" id=""/>
							</form>
							
							
							<div class="submit_btn_box" style=""> 
								<button class="save" type="button">저장</button>
								<button class="cancel" type="button">초기화</button>
							</div>
							
							<div class="srch_box_align_left" style="line-height:23px;float:right;margin-left:20px;margin-right:10px">	
								<span class="check_sample red"></span><label for="">&nbsp;조회권한</label>
								<span class="check_sample blue"></span><label for="">&nbsp;모든권한</label>
							</div>
							
							<hr />
							<div class="spacer"></div>
							
							
							<!-- 트리뷰 -->
							<ul id="treeview">
							
								<li> 
									<i class="fa fa-minus"></i><span class="tree_name">메뉴</span>
									
									<ul>
										<li> <i class="fa fa-minus"></i><span class="tree_name">고객사</span>
												
												<label for="1-1">
													<input class="class_A" id="1-1" data-id="1-1" type="checkbox" />
													<span></span>
												</label>
												<label>
													<input class="class_B" id="1-2" data-id="1-2" type="checkbox" />
													<span></span>
												</label>
												
											<ul>
												<li>&bull;<span class="tree_name">고객사관리</span>
													<label>
														<input class="class_A" id="" data-id="" type="checkbox" style=""/>
														<span></span>
													</label>
													<label>
														<input class="class_B" id="" data-id="" type="checkbox" />
														<span></span>
													</label>
												</li>
												<li>&bull;<span class="tree_name">브랜드관리</span>
													<label>
														<input class="class_A" id="" data-id="" type="checkbox" />
														<span></span>
													</label>
													<label>
														<input class="class_B" id="" data-id="" type="checkbox" />
														<span></span>
														
													</label>
												</li>
												<li>&bull;<span class="tree_name">계약관리</span>
													<label>
														<input class="class_A" id="" data-id="" type="checkbox" />
														<span></span>
													</label>
													<label>
														<input class="class_B" id="" data-id="" type="checkbox" />
														<span></span>
													</label>
												</li>
											</ul>
										</li>
										
										<li> <i class="fa fa-plus"></i><span class="tree_name">입고</span>
											<label>
												<input class="class_A" id="" data-id="" type="checkbox" />
												<span></span>
											</label>
											<label>
												<input class="class_B" id="" data-id="" type="checkbox" />
												<span></span>
											</label>
											
											<ul>
												<li>&bull;<span class="tree_name">제품관리</span>
													<label>
														<input class="class_A" id="" data-id="" type="checkbox" />
														<span></span>
													</label>
													<label>
														<input class="class_B" id="" data-id="" type="checkbox" /> 
														<span></span>
													</label>
												</li>
												<li>&bull;<span class="tree_name">입고관리</span>
													<label>
														<input class="class_A" id="" data-id="" type="checkbox" />
														<span></span>
													</label>
													<label>
														<input class="class_B" id="" data-id="" type="checkbox" />
														<span></span>
													</label>	
												</li>
											</ul>
										</li>
										
										<li> <i class="fa fa-plus"></i><span class="tree_name">촬영</span>
											<label>
												<input class="class_A" id="" data-id="" type="checkbox" />
												<span></span>
											</label>
											<label>
												<input class="class_B" id="" data-id="" type="checkbox" />
												<span></span>
											</label>
											
											<ul>
												<li>&bull;<span class="tree_name">촬영작업분배</span>
													<label>
														<input class="class_A" id="" data-id="" type="checkbox" />
														<span></span>
													</label>
													<label>
														<input class="class_B" id="" data-id="" type="checkbox" /> 
														<span></span>
													</label>
												</li>
												<li>&bull;<span class="tree_name">촬영관리</span>
													<label>
														<input class="class_A" id="" data-id="" type="checkbox" />
														<span></span>
													</label>
													<label>
														<input class="class_B" id="" data-id="" type="checkbox" />
														<span></span>
													</label>	
												</li>
											</ul>
										</li>
										
										<li> <i class="fa fa-plus"></i><span class="tree_name">편집</span>
											<label>
												<input class="class_A" id="" data-id="" type="checkbox" />
												<span></span>
											</label>
											<label>
												<input class="class_B" id="" data-id="" type="checkbox" />
												<span></span>
											</label>
											
											<ul>
												<li>&bull;<span class="tree_name">편집작업분배</span>
													<label>
														<input class="class_A" id="" data-id="" type="checkbox" />
														<span></span>
													</label>
													<label>
														<input class="class_B" id="" data-id="" type="checkbox" /> 
														<span></span>
													</label>
												</li>
												<li>&bull;<span class="tree_name">편집관리</span>
													<label>
														<input class="class_A" id="" data-id="" type="checkbox" />
														<span></span>
													</label>
													<label>
														<input class="class_B" id="" data-id="" type="checkbox" />
														<span></span>
													</label>	
												</li>
											</ul>
										</li>
										
										<li> <i class="fa fa-plus"></i><span class="tree_name">컨펌</span>
											<label>
												<input class="class_A" id="" data-id="" type="checkbox" />
												<span></span>
											</label>
											<label>
												<input class="class_B" id="" data-id="" type="checkbox" />
												<span></span>
											</label>
											
											<ul>
												<li>&bull;<span class="tree_name">관리자</span>
													<label>
														<input class="class_A" id="" data-id="" type="checkbox" />
														<span></span>
													</label>
													<label>
														<input class="class_B" id="" data-id="" type="checkbox" /> 
														<span></span>
													</label>
												</li>
												<li>&bull;<span class="tree_name">고객사</span>
													<label>
														<input class="class_A" id="" data-id="" type="checkbox" />
														<span></span>
													</label>
													<label>
														<input class="class_B" id="" data-id="" type="checkbox" />
														<span></span>
													</label>	
												</li>
											</ul>
										</li>
										<li><i class="fa fa-plus" aria-hidden="true"></i><span class="tree_name">작업통계정보</span>
											<label>
												<input class="class_A" id="" data-id="" type="checkbox" />
												<span></span>
											</label>
											<label>
												<input class="class_B" id="" data-id="" type="checkbox" />
												<span></span>
											</label>
										</li>
										
										<li> <i class="fa fa-plus"></i><span class="tree_name">운영관리</span>
											<label>
												<input class="class_A" id="" data-id="" type="checkbox" />
												<span></span>
											</label>
											<label>
												<input class="class_B" id="" data-id="" type="checkbox" />
												<span></span>
											</label>
											
											<ul>
												<li>&bull;<span class="tree_name">사용자관리</span>
													<label>
														<input class="class_A" id="" data-id="" type="checkbox" />
														<span></span>
													</label>
													<label>
														<input class="class_B" id="" data-id="" type="checkbox" /> 
														<span></span>
													</label>
												</li>
												<li>&bull;<span class="tree_name">카테고리관리</span>
													<label>
														<input class="class_A" id="" data-id="" type="checkbox" />
														<span></span>
													</label>
													<label>
														<input class="class_B" id="" data-id="" type="checkbox" />
														<span></span>
													</label>	
												</li>
												<li>&bull;<span class="tree_name">RFID 태그관리</span>
													<label>
														<input class="class_A" id="" data-id="" type="checkbox" />
														<span></span>
													</label>
													<label>
														<input class="class_B" id="" data-id="" type="checkbox" />
														<span></span>
													</label>
												</li>
												<li>&bull;<span class="tree_name">코드관리</span>
													<label>
														<input class="class_A" id="" data-id="" type="checkbox" />
														<span></span>
													</label>
													<label>
														<input class="class_B" id="" data-id="" type="checkbox" />
														<span></span>
													</label>	
												</li>
												<li>&bull;<span class="tree_name">메뉴관리</span>
													<label>
														<input class="class_A" id="" data-id="" type="checkbox" />
														<span></span>
													</label>
													<label>
														<input class="class_B" id="" data-id="" type="checkbox" />
														<span></span>
													</label>	
												</li>
												<li>&bull;<span class="tree_name">권한관리</span>
													<label>
														<input class="class_A" id="" data-id="" type="checkbox" />
														<span></span>
													</label>
													<label>
														<input class="class_B" id="" data-id="" type="checkbox" />
														<span></span>
													</label>	
												</li>
											</ul>
										</li>
									</ul>
								</li>
							</ul>
							<!-- #treeview -->
							
							
							
						</div><!-- content_box -->
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
	
	$("#treeview").hummingbird("expandNode",{attr:"id",name:"1-1",expandParents:true});
	
// get checked nodes
	
	//클릭시 체크된 체크박스 확인
	$("").on("click",function(){
		getChecked();
	});
	
	// 체크확인 함수
	function getChecked(){
		var List = [];
		$("#treeview").hummingbird("getChecked",{
		  attr:"id",
		  list: List,
		  OnlyFinalInstance:true
		});
		
		// 체크된 것 확인
		console.log(List)
	}
});
</script>
	
</body>
</html>