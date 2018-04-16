<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<title>사용자 관리</title>
	
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
	
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-kernel/master/dist/ax5ui.all.css"> 
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>  
	<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-kernel/master/dist/ax5ui.all.min.js"></script>
	<script src="<c:url value="/js/util.ajax.js" />"></script>
	<script src="<c:url value="/js/bootstrap.min.js" />"></script>
	<script src="../js/ax5/ax5dialog.min.js"></script>

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
								<h2>사용자 관리</h2>
						</div>
						<div class="content_box">
							<div class="submit_btn_box"> 
								<button type="button" class="save" id="saveUser">저장</button>
							</div>
							<div class="table_box">
								<table class="set">
									<tbody> 
										<tr>
											<th>* 아이디</th>
											<td colspan="3">
												<input id="userId" name="userId" type=text readonly />
											</td>
										</tr>
										<tr>
											<th>* 이메일</th>
											<td colspan="3">
												<input id="emailId" name="emailId" type=text />
											</td>
										</tr>
										<tr>
											<th>* 이름</th>
											<td colspan="3">
												<div class="name_box">
													<input id="name" name="name" type="text" />
												</div>
											</td>
										</tr>
										<tr>
											<th>* 휴대폰 번호</th>
											<td colspan="3">
												<div class="phone_num_box"> 
													<select name="mobileNo1" id="mobileNo1">
														<option value="010">010</option>
														<option value="060">060</option>
														<option value="070">070</option>
													</select>
													<span>-</span>
													<input name="mobileNo2" id="mobileNo2" type="text" />
													<span>-</span>
													<input name="mobileNo3" id="mobileNo3" type="text" />
												</div>
											</td>
										</tr>
										
										<tr>
											<th>* 권한</th>
											<td colspan="3">
												<div class="name_box"> 
													<select  name="euser_auth" id="euser_auth" disabled=true>
														<option value="">전체</option>
														<option value="01">Super Admin</option>
														<option value="02">관리자</option>
														<option value="03">팀장</option>
														<option value="04">촬영담당자</option>
														<option value="05">편집담당자</option>
														<option value="06">고객사담당자</option>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<th>* 승인여부</th>
											<td>
												<input type="radio" name="boolean_appr" value="yes">예
												<input type="radio" name="boolean_appr" value="no">아니오
											</td>
											<th>* 퇴사여부</th>
											<td>
												<input type="radio" name="boolean_del" value="yes" disabled=true>예
												<input type="radio" name="boolean_del" value="no" disabled=true>아니오
											</td>
										</tr>
										<!-- <tr>
											
										</tr> -->
									</tbody>
								</table>
							</div>						
						</div>
						<!-- content_box -->
					
					
					
						<div class="content_box">
						
							<form class="srch_box_align_left"> 
								<label for="">• 이름</label>
								<input type="text" id="user_name"/>
							</form>

							<form class="srch_box_align_left"> 
								<label for="">• 권한</label>
								<select name="user_auth" id="user_auth" readonly>
									<option value="">전체</option>
									<option value="01">Super Admin</option>
									<option value="02">관리자</option>
									<option value="03">팀장</option>
									<option value="04">촬영담당자</option>
									<option value="05">편집담당자</option>
									<option value="06">고객사담당자</option>
								</select>
							</form>
							
							<form class="srch_box_align_left"> 
								<label for="">• 퇴사여부</label>
								<select name="user_del_yn" id="user_del_yn" readonly>
									<option value="">전체</option>
									<option value="N">재직</option>
									<option value="Y">퇴사</option>
								</select>
							</form>
							
							<div class="submit_btn_box"> 
								<button class="inquiry" type="button"
								onclick="user.search.load(); return false;">조회</button>
								<button class="save" id="saveAppr" type="button">승인</button>
							</div>		
							
							<div class="table_box">
								<div data-ax5grid="data-grid1" data-ax5grid-config="{}" style="width:100%; height:400px;"></div>
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
<script type="text/javascript">

	$(document.body).ready(function () {
		
		gridView.initView();
		user.search.load(0);
	
		var confirmDialog = new ax5.ui.dialog();
	    confirmDialog.setConfig({
	        title: "승인 확인",
	        theme: "danger"
	    });
	
	    $('#saveUser').click(function () {
	        confirmDialog.confirm({
	            title: "사용자 정보 저장 확인",
	            msg: '사용자 정보를 저장 하시겠습니까?'
	        }, function(){
	            if(this.key == "ok"){
	                user.itemView.save();
	            }
	            else if(this.key == "cancel"){
	            }
	        });
	    });
	    
	    $('#saveAppr').click(function () {
	        confirmDialog.confirm({
	            title: "승인 확인",
	            msg: '승인처리 하시겠습니까?'
	        }, function(){
	            if(this.key == "ok"){
	                user.doAppr.execute();
	            }
	            else if(this.key == "cancel"){
	            }
	        });
	    });
	    
	    // toast init
	    axToast = new ax5.ui.toast({
            containerPosition: "top-left",
            onStateChanged: function(){
                console.log(this);
            }
        });
	});
	
	var curr_user_grid_page = 0;

    ax5.ui.grid.tmpl.page_status = function(){
    	//console.log("dataRowCount: "+ dataRealRowCount);
        return ''; //''<span>{{{progress}}} {{fromRowIndex}} - {{toRowIndex}} of {{dataRowCount}} {{#dataRealRowCount}}  현재페이지 {{.}}{{/dataRealRowCount}} {{#totalElements}}  전체갯수 {{.}}{{/totalElements}}</span>';        
    };
 
    
    var axToast;
    var toastView = {
    		viewMessage : function(message) {
    			axToast.push(message, function () {
                    // close toast
                    console.log(this);
                });
    		}
    		
    }
    var axUserGrid;
    
    var axUserGridSelectedIndex;
    
    var gridView = {
        initView: function () {
        	axUserGrid = new ax5.ui.grid();
        	axUserGrid.setConfig({
                target: $('[data-ax5grid="data-grid1"]'),
                frozenColumnIndex: 1,
                frozenRowIndex: 0,
                showLineNumber: true,
                showRowSelector: false,
                //multipleSelect: true,
                lineNumberColumnWidth: 40,
                rowSelectorColumnWidth: 28,
                sortable: true, // 모든 컬럼에 정렬 아이콘 표시
                multiSort: false, // 다중 정렬 여부
                remoteSort: false, // remoteSort에 함수를 sortable 컬럼이 클릭되었을때 실행 setColumnSort를 직접 구현. (remoteSort를 사용하면 헤더에 정렬 상태만 표시 하고 데이터 정렬은 처리 안함)
                header: {
                    align: "center",
                    columnHeight: 32
                },
                body: {
                    align: "center",
                    columnHeight: 32,
                    onClick: function () {
                    	//console.log(this.self.select(this.dindex));
                    	//toastView.viewMessage(axUserGrid.list[this.dindex].userId);
                        //console.log(this.dindex);
                        if (axUserGridSelectedIndex != null)
                        	this.self.select(axUserGridSelectedIndex, {selected: false});
                    	axUserGridSelectedIndex = this.dindex;
                        this.self.select(this.dindex);
                    	user.itemView.view(axUserGridSelectedIndex);
                    }

                },
                page: {
                    navigationItemCount: 9,
                    height: 30,
                    display: true,
                    firstIcon: '<i class="fa fa-step-backward" aria-hidden="true"></i>',
                    prevIcon: '<i class="fa fa-caret-left" aria-hidden="true"></i>',
                    nextIcon: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
                    lastIcon: '<i class="fa fa-step-forward" aria-hidden="true"></i>',
                    onChange: function () {
                    	console.log(this.page.selectPage);
                    	user.search.load(this.page.selectPage);
                        //gridView.setData(this.page.selectPage);
                    }
                },
                
                columns: [

                    {
                        key: "userId",
                        label: "아이디",
                        width: 170,
                        styleClass: function () {
                            return "ABC";
                        },
                        enableFilter: true,
                        align: "center"
                    },
                    {
                        key: "emailId",
                        label: "이메일",
                        width: 200,
                        styleClass: function () {
                            return "ABC";
                        },
                        enableFilter: true,
                        align: "center"
                    },
                    {
                        key: "name", 
                        label: "이름", 
                        width: 150,
                        align: "center"
                    },
                    {
                        key: "mobileNo", 
                        label: "전화번호", 
                        width: 130,
                        align: "center"
                    },
                    {
                        key: "typeName", 
                        label: "권한", 
                        width: 140,
                        align: "center"
                    },
                    
                    {
                        key: "apprYn", label: "승인여부", width: 70, sortable: false, align: "center"
                        , editor: {
                        	type: "checkbox", config: {height: 17, trueValue: "Y", falseValue: "N"}
                        }                	
                    },
                    {
                        key: "delDt", 
                        label: "퇴사여부",
                        width: 140, 
                        align: "center"
                    }
                ]
            });
            return this;
        },
        setData: function (_pageNo, _pageListSize, _totalPage, _totalCount, dataList) {

        	console.log("pageNo: "+_pageNo)
        	console.log("_pageListSize: "+_pageListSize)
        	console.log("_totalPage: "+_totalPage)
        	console.log("_totalCount: "+_totalCount)
            //var list = [];
            //for (var i = 0, l = dataList.length; i < l; i++) {
            //    list.push($.extend({}, dataList[i]));
           // }
 
            axUserGrid.setData({
                list: dataList,
                page: {
                    currentPage: _pageNo || 0,
                    pageSize: _pageListSize,
                    totalElements: _totalCount,
                    totalPages: _totalPage
                }
            });
            axUserGridSelectedIndex = null;
            return this;
        }
    };
 
    var user = {
    		search : {    			
    			load : function (page_no) {
    				console.log(page_no);
    				curr_user_grid_page = page_no;

    				console.log("curr_user_grid_page: "+curr_user_grid_page);
    				var chkIds = []; <%-- 체크된 값을 확인하기 위한 배열 변수 --%>
    				//$("input[name=cctv_chk]").each(function(){ if($(this).prop("checked")) chkIds.push($(this).val()); });
    				//if(chkIds.length != 1) return;
    				
    				var userAuth = $("select[name=user_auth]").val(); 
    				var userDelYn = $("select[name=user_del_yn]").val(); 
    				var userName = $("#user_name").val();
    				
    				console.log("userName: "+userName);
    				console.log("delYn: "+userDelYn);
    				
    				
    				var param =	{ 'name' : userName, 'typeCd' : userAuth, 'delId' : userDelYn,
    						'qCurrPage' : page_no
    						};
    				ajaxUtil.req("<c:url value='/operate/user/list'/>", param, 'user.search.loadCallback', false)
    			},
    			loadCallback : function (result) { 
					console.log("result.success: "+result.success);    				
    				if(result.success == "success"){
    					var myJSON = JSON.stringify(result);
    					//console.log("result myJSON: "+myJSON);    					
    					gridView.setData(curr_user_grid_page, result.pageListSize, result.totalPage, result.totalCount, result.list);
    					
    				} else {
    					//$('#mod_cctv').modal('hide');
    				}
    			}
    		},
    		doAppr : {
    			execute : function () {
    				var param = {};
    				for (ii = 0; ii < axUserGrid.list.length; ii++) {
    					//console.log(ii);
    					var itemTemp = axUserGrid.list[ii];
    					param['userList['+ii+'].userId'] = itemTemp.userId;
    					param['userList['+ii+'].apprYn'] = itemTemp.apprYn;
    				}
					
    				ajaxUtil.req("<c:url value='/operate/user/saveappr'/>", param, 'user.doAppr.callback', false);
    			},
    			callback : function (result) { 
					console.log("result.success: "+result.success);    				
					if(result.success == "success"){
						toastView.viewMessage("승인 처리되었습니다."); 
					} else {
						//$('#mod_cctv').modal('hide');
					}
				}
    		},
    		itemView : {
    			view: function(index) {
    				var itemTemp = axUserGrid.list[index];
    				    				
    				if (itemTemp.apprYn == "Y") {
    					$("input[name=boolean_appr][value='yes']").prop("checked",true);
    				}else if (itemTemp.apprYn == "N") {
       					$("input[name=boolean_appr][value='no']").prop("checked",true);
       				}

    				$("#userId").val(itemTemp.userId);
    				$("#emailId").val(itemTemp.emailId);
    				$("#name").val(itemTemp.name);
    				$("#euser_auth").val(itemTemp.typeCd);
    				$("#mobileNo1").val(itemTemp.mobileNo1);
    				$("#mobileNo2").val(itemTemp.mobileNo2);
    				$("#mobileNo3").val(itemTemp.mobileNo3);
    				
    				if (itemTemp.delDt == "") {
    					$("input[name=boolean_del][value='yes']").prop("checked",true);
    				}else {
       					$("input[name=boolean_del][value='no']").prop("checked",true);
       				}
    			},
    			save: function() {
    				var userId = $("#userId").val();
    				var emailId = $("#emailId").val();
    				var name = $("#name").val();
    				var euser_auth = $("#euser_auth").val();
    				var mobileNo1 = $("#mobileNo1").val();
    				var mobileNo2 = $("#mobileNo2").val();
    				var mobileNo3 = $("#mobileNo3").val();
    				var mobileNo = mobileNo1+"-"+mobileNo2+"-"+mobileNo3;

    				console.log("userId: "+userId);
    				console.log("emailId: "+emailId);
    				console.log("name: "+name);
    				console.log("euser_auth: "+euser_auth);
    				console.log("mobileNo1: "+mobileNo1+"-"+mobileNo2+"-"+mobileNo3);

    				var param =	{ 'userId' : userId, 'emailId' : emailId, 'name' : name, 'euser_auth' : euser_auth, 'mobileNo': mobileNo};
    				
    				ajaxUtil.req("<c:url value='/operate/user/moduser'/>", param, 'user.itemView.saveCallback', false);
    			},
    			saveCallback : function (result) { 
					console.log("result.success: "+result.success);    				
					if(result.success == "success"){
						toastView.viewMessage("사용자 정보가 수정되었습니다."); 
						user.search.load(0);
					} else {
						//$('#mod_cctv').modal('hide');
					}
				}
    		}
    }
</script>

