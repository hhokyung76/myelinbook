<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>코드 관리</title>
<!-- 공통 css -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/style.css" />
<link rel="stylesheet" href="../css/theme.css" />
<style>
label, input {
	display: block;
}

input.text {
	margin-bottom: 12px;
	width: 95%;
	padding: .4em;
}

input.text_rdoy {
	margin-bottom: 12px;
	width: 95%;
	padding: .4em;
	color: #0000ff;
	font-weight: bold;
}

fieldset {
	padding: 0;
	border: 0;
	margin-top: 25px;
}

div#users-contain {
	width: 350px;
	margin: 20px 0;
}

div#users-contain table {
	margin: 1em 0;
	border-collapse: collapse;
	width: 100%;
}

div#users-contain table td, div#users-contain table th {
	border: 1px solid #eee;
	padding: .6em 10px;
	text-align: left;
}

.ui-dialog .ui-state-error {
	padding: .3em;
}

.validateTips {
	border: 1px solid transparent;
	padding: 0.3em;
}
</style>
<!-- 공통 css -->
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-calendar/master/dist/ax5calendar.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-picker/master/dist/ax5picker.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-select/master/dist/ax5select.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-grid/master/dist/ax5grid.css">
<link rel="stylesheet" type="text/css" href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-dialog/master/dist/ax5dialog.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-toast/master/dist/ax5toast.css" />

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"	src="https://cdn.rawgit.com/ax5ui/ax5core/master/dist/ax5core.min.js"></script>
<script type="text/javascript"	src="https://cdn.rawgit.com/ax5ui/ax5ui-calendar/master/dist/ax5calendar.min.js"></script>
<script type="text/javascript"	src="https://cdn.rawgit.com/ax5ui/ax5ui-picker/master/dist/ax5picker.min.js"></script>
<script type="text/javascript"	src="https://cdn.rawgit.com/ax5ui/ax5ui-formatter/master/dist/ax5formatter.min.js"></script>
<script type="text/javascript"	src="https://cdn.rawgit.com/ax5ui/ax5ui-select/master/dist/ax5select.min.js"></script>
<script type="text/javascript"	src="https://cdn.rawgit.com/ax5ui/ax5ui-grid/master/dist/ax5grid.min.js"></script>
<script type="text/javascript"	src="https://cdn.rawgit.com/ax5ui/ax5ui-dialog/master/dist/ax5dialog.min.js"></script>
<script type="text/javascript"	src="https://cdn.rawgit.com/ax5ui/ax5ui-toast/master/dist/ax5toast.min.js"></script>
<!-- 공통 js -->
<script src="<c:url value="/js/custom.js" />"></script>
<script src="<c:url value="/js/util.ajax.js" />"></script>

</head>
<body>
	<div class="wrap">

		<header class="top_section">
			<jsp:include page="../header/top_navi.jsp" flush="false" />
		</header>
		<!-- top_section -->

		<div class="middle_section">
			<div class="middle_section_contents">

				<div class="main_title" style="padding: 30px 45px 8px 25px">
					<h2>코드 관리</h2>
				</div>

				<div class="main left_side_30 fluid_in_1200">
					<div class="main_content" style="padding: 0">

						<div class="content_box">


							<div class="sub_title">
								<h3>
									<i class="fa fa-code-fork" aria-hidden="true"
										style="font-size: 14px; margin-right: 3px"></i> <span>그룹코드정보</span>
								</h3>
								<div class="spacer"></div>
							</div>


							<form class="srch_box_align_left">
								<label for="">• 그룹명</label><input type="text" id="codeGroupName"  name="codeGroupName" />
							</form>

							<div class="submit_btn_box">
								<button class="inquiry" type="button"
									onclick="codeGroupAct.search(); return false;">조회</button>
								<button type="button" class="cancel"
									onclick="delCodeGroupConfirm(); return false;">삭제</button>
							</div>

							<hr />

							<div class="table_box">
								<div data-ax5grid="grp-grid" data-ax5grid-config="{
																		showLineNumber: true,
																		showRowSelector: true,											
                    													sortable: true
																		}" style="height: 300px;"></div>
							</div>
							<!-- table_box -->

							<!-- pagination -->


							<div class="spacer"></div>

							<div class="submit_btn_box">
								<button type="button" class="save" onclick="codeGroupAct.add(); return false;">저장</button>
								<button type="button" class="cancel"  onclick="codeGroupAct.cleanInit(); return false;">초기화</button>
							</div>
							<div class="table_box">
								<table class="set">
									<tbody>
										<tr>
											<th>* 그룹코드</th>
											<td>
												<div class="name_box">
													<input type="text" name="txtCodeGroupId" id="txtCodeGroupId"/><button type="button" id="btnCodeGroupCheckDupl" class="cancel" onclick="codeGroupAct.checkDuplicate(); return;">중복확인</button>
													<input type="hidden" name="hdCheckDuplicate" id="hdCheckDuplicate" value="N"> 
													<input type="hidden" name="hdUpdateYn" id="hdUpdateYn" value="N"> 
												</div>
											</td>
										</tr>
										<tr>
											<th>* 그룹명</th>
											<td>
												<div class="name_box">
													<input type="text" name="txtCodeGroupName" id="txtCodeGroupName"/>
												</div>
											</td>
										</tr>

									</tbody>
								</table>
							</div>



						</div>
						<!-- content_box -->
					</div>
					<!-- main_content -->
				</div>
				<!-- main -->

				<div class="main right_side_70 fluid_in_1200">
					<div class="main_content" style="padding: 0">
						<div class="content_box">


							<div class="sub_title">
								<h3>
									<i class="fa fa-info-circle" aria-hidden="true"
										style="font-size: 16px; margin-right: 3px"></i> <span>코드정보</span>
								</h3>
								<div class="spacer"></div>
							</div>


							<form class="srch_box_align_left">
								<label for="">• 그룹명 : </label> <label for="" id="codeGroupNameDisp"></label>
							</form>
							<div class="submit_btn_box">
								<button type="button" class="cancel"
									onclick="delCodeConfirm(); return false;">삭제</button>
							</div>
							<hr />

							<div class="table_box">
								<div data-ax5grid="code-grid" data-ax5grid-config="{
																		showLineNumber: true,
																		showRowSelector: true,
																		multipleSelect: true
																		}" style="height: 300px;"></div>
							</div>
							<!-- table_box -->



							<!-- pagination -->

							<div class="spacer"></div>

							<div class="submit_btn_box">
								<button type="button" class="save" onclick="codeAct.add(); return false;">저장</button>
								<button type="button" class="cancel" onclick="codeAct.cleanInit(); return false;">초기화</button>
							</div>
							<div class="table_box">
								<table class="set">
									<tbody>
										<tr>
											<th>* 코드</th>
											<td colspan="3">
												<div class="name_box">
													<input type="text" id="txtCodeId"/> <button type="button" class="cancel" id="btnCodeCheckDupl" class="cancel" onclick="codeAct.checkDuplicate(); return;">중복확인</button>
													<input type="hidden" name="hdCdCheckDuplicate" id="hdCdCheckDuplicate" value="N"> 
													<input type="hidden" name="hdCdUpdateYn" id="hdCdUpdateYn" value="N"> 
												</div>
											</td>
										</tr>

										<tr>
											<th>* 코드명</th>
											<td>
												<div class="name_box">
													<input type="text" id="txtCodeName" style="width: 100%" />
												</div>
											</td>
											<th>* 코드순번</th>
											<td>
												<div class="name_box">
													<input type="text" id="txtCodeOrder" style="width: 100%" />
												</div>
											</td>
										</tr>
										<tr>
											<th>* 비고</th>
											<td colspan="3">
												<div class="note_box">
													<input type="text" id="txtCodeRemark" style="width: 100%" />
												</div>
											</td>

										</tr>
									</tbody>
								</table>
							</div>

						</div>
						<!-- content_box -->
					</div>
				</div>
			</div>
			<!-- middle_section_contents -->
		</div>
		<!-- middle_section -->

	</div>
	<!-- wrap -->
</body>
</html>
<script type="text/javascript">

var groupCodeGrid = new ax5.ui.grid();
var codeGrid = new ax5.ui.grid(); 

var confirmDialog = new ax5.ui.dialog();
confirmDialog.setConfig({
    title: "승인 확인",
    theme: "danger"
});

var axToast  = new ax5.ui.toast({
    containerPosition: "top-right",
    onStateChanged: function(){
        console.log(this);
    }
});

var toastView = {
	viewMessage : function(message) {
		axToast.push(message, function () {
            // close toast
            console.log(this);
        });
	}    		
}

var selectedCodeGroupId = "";

$(document.body).ready(function () {
	groupCodeGrid.setConfig({
        target: $('[data-ax5grid="grp-grid"]'),
        columns: [
            {key: "codeGroupId", label: "그룹코드", width: 150, align: "center"},
            {key: "codeGroupName", label: "그룹명", width: 200, align: "center"}
        ],
        body: {
            columnHeight: 26,
            onDataChanged: function () {
                if (this.key == 'isChecked') {
                	console.log("isChecked...");
                    this.self.updateChildRows(this.dindex, {isChecked: this.item.isChecked});
                }
                else if(this.key == '__selected__'){
                	console.log("__selected__..."+this.dindex);
                	console.log("this.item.__selected__..."+this.item.__selected__);
                    //this.self.updateChildRows(this.dindex, {__selected__: this.item.__selected__});
                }
            },
            onClick: function() {
        		
        		var itemTemp = groupCodeGrid.list[this.dindex];
        		if (itemTemp == null) {
        			return;
        		}
        		
        		selectedCodeGroupId = itemTemp.codeGroupId;
        		$( '#txtCodeGroupId' ).val(itemTemp.codeGroupId);
	    		$("#txtCodeGroupId").prop("readonly", true);
        		$( '#txtCodeGroupName' ).val(itemTemp.codeGroupName);
        		$( '#hdUpdateYn' ).val("Y");
        		$("#btnCodeGroupCheckDupl").hide();	
        		
        		$('#codeGroupNameDisp').text(itemTemp.codeGroupName);
        		
        		console.log("click...ed "+itemTemp);
            	codeAct.search();
            },
            onDBLClick: function () {
            	alert("double click...ed "+this.dindex);
        		/* axGridSelectedIndex = this.dindex;
        		var itemTemp = treeGrid.list[this.dindex];
        		if (itemTemp.id == "0") {
        			return;
        		}
        		console.log("item: "+itemTemp.pid+" "+itemTemp.name);
        		cateui.openForUpdate(itemTemp); */
            }
        }
    });
	
	codeGrid.setConfig({
        target: $('[data-ax5grid="code-grid"]'),
        columns: [
            {key: "codeId", label: "코드", width: 100, align: "center"},
            {key: "codeName", label: "코드명", width: 200, align: "center"},
            {key: "codeOrder", label: "코드순번", width: 70, align: "center"},
            {key: "remark", label: "비고", width: 220, align: "center"}
        ],
        body: {
            columnHeight: 26,
            onDataChanged: function () {
                if (this.key == 'isChecked') {
                    this.self.updateChildRows(this.dindex, {isChecked: this.item.isChecked});
                }
                else if(this.key == '__selected__'){
                	console.log("this.item.__selected__..."+this.item.__selected__);
                }
            },
            onClick: function() {
        		
        		var itemTemp = codeGrid.list[this.dindex];
        		if (itemTemp == null) {
        			return;
        		}
        		
        		selectedCodeGroupId = itemTemp.codeGroupId;
        		$( '#txtCodeId' ).val(itemTemp.codeId);
	    		$("#txtCodeId").prop("readonly", true);
        		$( '#txtCodeName' ).val(itemTemp.codeName);
        		$( '#txtCodeOrder' ).val(itemTemp.codeOrder);
        		$( '#txtCodeRemark' ).val(itemTemp.remark);
        		$( '#hdCdUpdateYn' ).val("Y");
        		$("#btnCodeCheckDupl").hide();	
        		
        		console.log("click...ed "+itemTemp);
            },
            onDBLClick: function () {
            	alert("double click...ed "+this.dindex);
            }
        }
    });
	
	
	
	// 최초 화면 로딩 시 그룹코드 정보 조회. 2018.01.15
	codeGroupAct.search();
});

var codeGroupAct = {
	search : function() {
		var codeGroupName = $( '#codeGroupName' ).val();
		var param =	{ 'codeGroupName' : codeGroupName };
		ajaxUtil.req("<c:url value='/operate/codemgr/codeGroupList'/>", param, 'codeGroupAct.searchCallback', false);
	},
	searchCallback: function(result) {
		console.log("result.success: "+result.success);    				
		if(result.success == "success"){
			var myJSON = JSON.stringify(result);
			console.log("result myJSON: "+myJSON);    					
			groupCodeGrid.setData(result.list);
			
		} else {
			//$('#mod_cctv').modal('hide');
		}
	},
	del : function() {
		/* for (var ii = 0; ii < groupCodeGrid.list.length; ii++) {
			console.log(groupCodeGrid.list[ii]);
			console.log(groupCodeGrid.list[ii].__selected__);
		} */
		var index = 0;
		var param = {};
		for (ii = 0; ii < groupCodeGrid.list.length; ii++) {
			//console.log(ii);
			var itemTemp = groupCodeGrid.list[ii];
			if (itemTemp.__selected__ == true) {
				console.log(itemTemp);
				param['codeGroupList['+index+'].codeGroupId'] = itemTemp.codeGroupId;
				index++;
			}
		}
		
		var codeGroups = JSON.stringify(param);

		console.log("param: "+codeGroups);
		ajaxUtil.req("<c:url value='/operate/codemgr/delCodeGroupList'/>", param, 'codeGroupAct.delCallback', false);
	},
	delCallback: function(result) {
		console.log("result.success: "+result.success);    				
		if(result.success == "success"){
			toastView.viewMessage("삭제 처리 되었습니다."); 
			codeGroupAct.cleanInit();
			codeGroupAct.search();
		} else {
			//$('#mod_cctv').modal('hide');
		}
	},
	add : function() {

		var txtCodeGroupId = $( '#txtCodeGroupId' ).val();
		var txtCodeGroupName = $( '#txtCodeGroupName' ).val();
		var hdUpdateYn = $( '#hdUpdateYn' ).val();
		var hdCheckDuplicate = $( '#hdCheckDuplicate' ).val();
		
		console.log("hdUpdateYn: "+hdUpdateYn+" hdCheckDuplicate: "+hdCheckDuplicate);
		if (jQuery.trim(txtCodeGroupId) == "") {
			 toastView.viewMessage("그룹코드 아이디를 입력하세요."); 
			 return;
		}
		if (jQuery.trim(txtCodeGroupName) == "") {
			 toastView.viewMessage("그룹코드 아이디를 입력하세요."); 
			 return;
		}
		
		if (hdUpdateYn == "N") {
			if (hdCheckDuplicate == "N") {
				 toastView.viewMessage("그룹코드 아이디 중복확인이 필요합니다. 중복확인 하십시오."); 
				 return;
			}
		}

		var param =	{ 'codeGroupId' : txtCodeGroupId, 'codeGroupName' : txtCodeGroupName, 'updateYn': hdUpdateYn};

		ajaxUtil.req("<c:url value='/operate/codemgr/addCodeGroup'/>", param, 'codeGroupAct.addCallback', false);
	},
	addCallback: function(result) {
		console.log("result.success: "+result.success);    				
		if(result.success == "success"){
			toastView.viewMessage("저장되었습니다."); 
			codeGroupAct.cleanInit();
			codeGroupAct.search();
		} else {
			//$('#mod_cctv').modal('hide');
		}
	},
	cleanInit: function() {
		$( '#txtCodeGroupId' ).val("");
		$( '#txtCodeGroupName' ).val("");
		$( '#hdUpdateYn' ).val("N");
		$( '#hdCheckDuplicate' ).val("N");
		$("#txtCodeGroupId").prop("readonly", false);
		$("#btnCodeGroupCheckDupl").show();	
		selectedCodeGroupId = "";
	},
	checkDuplicate : function() {
		
		var txtCodeGroupId = jQuery.trim($( '#txtCodeGroupId' ).val());
		var txtCodeGroupName = $( '#txtCodeGroupName' ).val();
		var hdUpdateYn = $( '#hdUpdateYn' ).val();
		var hdCheckDuplicate = $( '#hdCheckDuplicate' ).val();
		
		console.log("444 hdUpdateYn: "+hdUpdateYn+" hdCheckDuplicate: "+hdCheckDuplicate);
		if (txtCodeGroupId == "") {
			 toastView.viewMessage("그룹코드 아이디를 입력하세요."); 
			 return;
		}
		
		var param =	{ 'codeGroupId' : txtCodeGroupId};

		ajaxUtil.req("<c:url value='/operate/codemgr/checkCodeGroupDupl'/>", param, 'codeGroupAct.checkCodeGroupDuplCallback', false);
	},
	checkCodeGroupDuplCallback : function(result) {
		console.log("result.success: "+result.success);    				
		if(result.success == "success"){
			var temp = result.checkedCodeGroup;
			console.log("checkedCodeGroup: "+temp);
			if (temp != null) {
				toastView.viewMessage("증복된 그룹코드가 존재합니다. 확인하십시오."); 
				return;
			}else {
				$( '#hdCheckDuplicate' ).val("Y");
				toastView.viewMessage("해당코드로 등록가능합니다."); 
				return;
			}
		} else {
			toastView.viewMessage("오류가 발생하였습니다. 관리자에게 확인 바랍니다."); 
		}
	}
}

function delCodeGroupConfirm() {
	confirmDialog.confirm({
        title: "확인",
        msg: '선택한 그룹코드를 삭제 하시겠습니까?'
    }, function(){
        if(this.key == "ok"){
        	codeGroupAct.del()
        }
        else if(this.key == "cancel"){
        }
    });
}

var codeAct = {
	search : function() {
		var param =	{ 'codeGroupId' : selectedCodeGroupId };
		console.log(param);
		ajaxUtil.req("<c:url value='/operate/codemgr/codeList'/>", param, 'codeAct.searchCallback', false);
	},
	searchCallback: function(result) {
		console.log("result.success: "+result.success);    				
		if(result.success == "success"){ 					
			codeGrid.setData(result.list);
			
		} else {
			//$('#mod_cctv').modal('hide');
		}
	},
	add : function() {
		if (selectedCodeGroupId == "") {
			 toastView.viewMessage("그룹코드 아이디를 선택하세요."); 
			 return;
		}
		var txtCodeId = jQuery.trim($( '#txtCodeId' ).val());
		var txtCodeName = $( '#txtCodeName' ).val();
		var txtCodeOrder = $( '#txtCodeOrder' ).val();
		var txtCodeRemark = $( '#txtCodeRemark' ).val();
		
		var hdCdUpdateYn = $( '#hdCdUpdateYn' ).val();
		var hdCdCheckDuplicate = $( '#hdCdCheckDuplicate' ).val();
		
		console.log("hdCdUpdateYn: "+hdCdUpdateYn+" hdCdCheckDuplicate: "+hdCdCheckDuplicate);
		if (txtCodeId == "") {
			 toastView.viewMessage("코드 아이디를 입력하세요."); 
			 return;
		}
		if (txtCodeName == "") {
			 toastView.viewMessage("코드명을 입력하세요."); 
			 return;
		}
		if (txtCodeOrder == "") {
			 toastView.viewMessage("코드순번을 입력하세요."); 
			 return;
		}
		if (hdUpdateYn == "N") {
			if (hdCheckDuplicate == "N") {
				 toastView.viewMessage("그룹코드 아이디 중복확인이 필요합니다. 중복확인 하십시오."); 
				 return;
			}
		}

		//var param =	{ 'codeGroupId' : txtCodeGroupId, 'codeGroupName' : txtCodeGroupName, 'updateYn': hdUpdateYn};
		var param =	{ 'codeGroupId' : selectedCodeGroupId, 'codeId' : txtCodeId, 'codeName' : txtCodeName, 'updateYn': hdCdUpdateYn,
				'codeOrder': txtCodeOrder, 'remark': txtCodeRemark};

		var myJSON = JSON.stringify(param);
		console.log("addCode param: "+myJSON);
		//ajaxUtil.req("<c:url value='/operate/codemgr/addCodeGroup'/>", param, 'codeAct.addCallback', false);
		ajaxUtil.req("<c:url value='/operate/codemgr/addCode'/>", param, 'codeAct.addCallback', false);
	},
	addCallback: function(result) {
		console.log("result.success: "+result.success);    				
		if(result.success == "success"){
			toastView.viewMessage("저장되었습니다."); 
			codeAct.search();
			codeAct.cleanInit();
		} else {
			//$('#mod_cctv').modal('hide');
		}
	},
	cleanInit: function() {
		$( '#txtCodeId' ).val("");
		$( '#txtCodeName' ).val("");
		$( '#hdCdUpdateYn' ).val("N");
		$( '#hdCdCheckDuplicate' ).val("N");
		$("#txtCodeId").prop("readonly", false);
		$("#btnCodeCheckDupl").show();		
	},
	checkDuplicate : function() {

		if (selectedCodeGroupId == "") {
			 toastView.viewMessage("그룹코드 아이디를 선택하세요."); 
			 return;
		}
		
		var txtCodeId = jQuery.trim($( '#txtCodeId' ).val());
		var txtCodeName = $( '#txtCodeName' ).val();
		var hdCdUpdateYn = $( '#hdCdUpdateYn' ).val();
		var hdCdCheckDuplicate = $( '#hdCdCheckDuplicate' ).val();
		
		console.log("444 hdCdUpdateYn: "+hdCdUpdateYn+" hdCdCheckDuplicate: "+hdCdCheckDuplicate);
		if (txtCodeId == "") {
			 toastView.viewMessage("코드 아이디를 입력하세요."); 
			 $( '#txtCodeId' ).focus()
			 return;
		}
		
		var param =	{ 'codeGroupId' : selectedCodeGroupId,  'codeId' : txtCodeId};

		ajaxUtil.req("<c:url value='/operate/codemgr/checkCodeDupl'/>", param, 'codeAct.checkCodeDuplCallback', false);
	},
	checkCodeDuplCallback : function(result) {
		console.log("result.success: "+result.success);    				
		if(result.success == "success"){
			var temp = result.checkedCode;
			console.log("checkedCode: "+temp);
			if (temp != null) {
				toastView.viewMessage("증복된 코드가 존재합니다. 확인하십시오."); 
				return;
			}else {
				$( '#hdCdCheckDuplicate' ).val("Y");
				toastView.viewMessage("해당코드로 등록가능합니다."); 
				return;
			}
		} else {
			toastView.viewMessage("오류가 발생하였습니다. 관리자에게 확인 바랍니다."); 
		}
	},
	del : function() {
		var param = {};
		var index = 0;
		for (ii = 0; ii < codeGrid.list.length; ii++) {
			//console.log(ii);
			var itemTemp = codeGrid.list[ii];
			if (itemTemp.__selected__ == true) {
				console.log(itemTemp);
				param['codeList['+index+'].codeGroupId'] = itemTemp.codeGroupId;
				param['codeList['+index+'].codeId'] = itemTemp.codeId;
				index++;
			}
		}
		
		var codes = JSON.stringify(param);

		console.log("param: "+codes);
		ajaxUtil.req("<c:url value='/operate/codemgr/delCodeList'/>", param, 'codeAct.delCallback', false);
	},
	delCallback: function(result) {
		console.log("result.success: "+result.success);    				
		if(result.success == "success"){
			toastView.viewMessage("삭제 처리 되었습니다."); 
			codeAct.cleanInit();
			codeAct.search();
		} else {
			//$('#mod_cctv').modal('hide');
		}
	}
}


function delCodeConfirm() {
	confirmDialog.confirm({
        title: "확인",
        msg: '선택한 코드를 삭제 하시겠습니까?'
    }, function(){
        if(this.key == "ok"){
        	codeAct.del()
        }
        else if(this.key == "cancel"){
        }
    });
}
</script>