<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
 <HEAD>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<title>카테고리 관리</title>	
	<!-- 공통 css -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="../css/reset.css"/>
	<link rel="stylesheet" href="../css/style.css"/>
	<link rel="stylesheet" href="../css/theme.css"/>
	<style>
		label, input { display:block; }
		input.text { margin-bottom:12px; width:95%; padding: .4em; }
		input.text_rdoy { margin-bottom:12px; width:95%; padding: .4em; color: #0000ff; font-weight:bold; }
		fieldset { padding:0; border:0; margin-top:25px; }
		div#users-contain { width: 350px; margin: 20px 0; }
		div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
		div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
		.ui-dialog .ui-state-error { padding: .3em; }
		.validateTips { border: 1px solid transparent; padding: 0.3em; }
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
	<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5core/master/dist/ax5core.min.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-calendar/master/dist/ax5calendar.min.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-picker/master/dist/ax5picker.min.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-formatter/master/dist/ax5formatter.min.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-select/master/dist/ax5select.min.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-grid/master/dist/ax5grid.min.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-dialog/master/dist/ax5dialog.min.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-toast/master/dist/ax5toast.min.js"></script>
	<!-- 공통 js -->
	<script src="<c:url value="/js/custom.js" />"></script>
	<script src="<c:url value="/js/util.ajax.js" />"></script>
 </HEAD>
<script type="text/javascript">
	var cateDialog, form;
	var allFields;
	var treeGrid;
    var axToast;
    var axGridSelectedIndex;

	var confirmDialog = new ax5.ui.dialog();
    confirmDialog.setConfig({
        title: "승인 확인",
        theme: "danger"
    });
    
    var toastView = {
    	viewMessage : function(message) {
    		axToast.push(message, function () {
                // close toast
                console.log(this);
            });
    	}    		
    }
    
    $(document.body).ready(function () {
    	//$( '#dialog-form' ).hide();
    	// toast init
	    axToast = new ax5.ui.toast({
            containerPosition: "top-right",
            onStateChanged: function(){
                console.log(this);
            }
        });
    	
    	cateDialog = $( "#dialog-form" ).dialog({
    		autoOpen: false,
    		height: 430,
    		width: 350,
    		modal: true,
    		buttons: {
    			"저 장": cateui.saving ,
    			"취 소": function() {
    				cateDialog.dialog( "close" );
    			}
    		},
    		close: function() {
    			form[ 0 ].reset();
    			//allFields.removeClass( "ui-state-error" );
    		}
    	});
    	
    	form = cateDialog.find( "form" ).on( "submit", function( event ) {
    		event.preventDefault();
    		cateui.saving();
    	});
    	
        var API_SERVER = "http://api-demo.ax5.io";
        treeGrid = new ax5.ui.grid({
            target: $('[data-ax5grid="data-grid"]'),
            //showLineNumber: true,
            //showRowSelector: true,
            header: {align:'center'},
            frozenColumnIndex: 0,
            frozenRowIndex: 0,
            columns: [
                
                {key: "cateName", label: "카테고리명", align: "left", width: 200, treeControl: true},
                {
                   key: "isChecked", label: "선택", width: 50, sortable: false, align: "center", editor: {
                   		type: "checkbox", config: {height: 17, trueValue: "Y", falseValue: "N"}
               	   }
                },
                {
                    key: "cateId",
                    label: "카테고리ID",
                    width: 85,
                    styleClass: function () {
                        return "ABC";
                    },
                    enableFilter: true,
                    align: "center"
                },
                {
                    key: "remark", 
                    label: "비 고", 
                    width: 250,
                    align: "left"
                }
            ],
            body: {
                columnHeight: 26,
                onDataChanged: function () {
                    if (this.key == 'isChecked') {
                        this.self.updateChildRows(this.dindex, {isChecked: this.item.isChecked});
                    }
                    else if(this.key == '__selected__'){
                        this.self.updateChildRows(this.dindex, {__selected__: this.item.__selected__});
                    }
                },
                onClick: function() {
            		console.log("double click...ed "+this.dindex);
            		axGridSelectedIndex = this.dindex;
                },
                onDBLClick: function () {
            		console.log("double click...ed "+this.dindex);
            		axGridSelectedIndex = this.dindex;
            		var itemTemp = treeGrid.list[this.dindex];
            		if (itemTemp.id == "0") {
            			return;
            		}
            		console.log("item: "+itemTemp.pid+" "+itemTemp.name);
            		cateui.openForUpdate(itemTemp);
                }
            },
            tree: {
                use: true,
                indentWidth: 10,
                arrowWidth: 15,
                iconWidth: 18,
                icons: {
                    openedArrow: '<i class="fa fa-caret-down" aria-hidden="true"></i>',
                    collapsedArrow: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
                    groupIcon: '<i class="fa fa-folder-open" aria-hidden="true"></i>',
                    collapsedGroupIcon: '<i class="fa fa-folder" aria-hidden="true"></i>',
                    itemIcon: '<i class="fa fa-circle" aria-hidden="true"></i>'
                },
                columnKeys: {
                    parentKey: "cateParentId",
                    selfKey: "cateId"
                }
            }
        });
 
        cateui.search();
 
    });
    

	
	
	var cateui = {
		search : function() {
			var param =	{};
			ajaxUtil.req("<c:url value='/operate/category/list'/>", param, 'cateui.searchCallback', false);
		},
		searchCallback: function(result) {
			console.log("result.success: "+result.success);    				
			if(result.success == "success"){
				var myJSON = JSON.stringify(result);
				console.log("result myJSON: "+myJSON);    					
				treeGrid.setData(result.list);
				
			} else {
				//$('#mod_cctv').modal('hide');
			}
		},
		checkPidNull: function() {
			console.log("dIndex: "+axGridSelectedIndex);
			var itemTemp = treeGrid.list[axGridSelectedIndex];
			if (itemTemp == null) {
				toastView.viewMessage("카테고리를 선택하십시오."); 
				return false;
			}
			console.log("cateId: "+itemTemp.cateId);
			return true;
		},
		openForCreate : function() {      // 새로운 카테고리 생성 화면 오픈
			var checked = cateui.checkPidNull();
    		if (checked == true) {
    			var parentItem = treeGrid.list[axGridSelectedIndex];
        		console.log("parentItem==: "+parentItem.cateParentId+" "+parentItem.cateName);
				if (parentItem.cateParentId == "top" || parentItem.cateParentId == "0") {
	        		console.log("parentItem==: "+parentItem.cateId+" "+parentItem.cateName);
					$( '#catePid' ).val(parentItem.cateId);
					$( '#catePrName' ).val(parentItem.cateName);
					$( '#actId' ).val("insert");
				}else {
					toastView.viewMessage("상위 카테고리를 선택하십시오.");
					return;
				}			

	    		$("#cateId").prop("readonly", false);

				$( '#dialog-form' ).show();
				cateDialog.dialog( "open" );	
			}
		},
		openForUpdate : function(item) {  // 그리드 더블클릭 시 수정 화면 오픈
			var checked = cateui.checkPidNull();
			if (checked == true) {
				//var itemTemp = treeGrid.list[axGridSelectedIndex];
	    		console.log("cateParentId: "+item.cateParentId+"item: "+item.cateId+" "+item.cateName);
	    		
	    		if (item.cateId == "0") {
					toastView.viewMessage("최상위 카테고리는 수정할 수 없습니다.");
					return;
	    		}
	    		if (item.cateParentId == "0") {
	    			item.cateParentName = "카테고리";
	    		}

	    		$("#cateId").prop("readonly", true);

				$( '#actId' ).val("update");
				$( '#catePid' ).val(item.cateParentId);
				$( '#catePrName' ).val(item.cateParentName);
				$( '#cateId' ).val(item.cateId);
				$( '#cateName' ).val(item.cateName);
				$( '#cateRemark' ).val(item.remark);				

				$( '#dialog-form' ).show();
				cateDialog.dialog( "open" );
			}
		},
		saving : function() {             // 새로운 카테고리 및 수정 화면에서 데이터 입력 후 저장 시 처리.
			//$( '#dialog-form' ).show();
			console.log("saving.. called..");
			var actId = $( '#actId' ).val();
			var cateParentId = $( '#catePid' ).val();
			var cateId = $( '#cateId' ).val();
			var cateName = $( '#cateName' ).val();
			var remark = $( '#cateRemark' ).val();

			var param =	{ 'cateParentId' : cateParentId, 'cateId' : cateId, 'cateName' : cateName,
						'remark' : remark };
			
			if (actId == "insert") {
				ajaxUtil.req("<c:url value='/operate/category/save'/>", param, 'cateui.savingCallback', false);
			}else if (actId == "update") {
					ajaxUtil.req("<c:url value='/operate/category/mod'/>", param, 'cateui.savingCallback', false);
			}
			cateDialog.dialog( "close" );
		},
		savingCallback: function(result) {
			console.log("result.success: "+result.success);    				
			if(result.success == "success"){
				toastView.viewMessage("정상적으로 저장되었습니다.");
		        cateui.search();
			} else {
				toastView.viewMessage("저장 시 문제가 발생되었습니다. \nError: "+result.message);
			}
		}
		,
		del : function() {             // 새로운 카테고리 및 수정 화면에서 삭제 처리.
			//$( '#dialog-form' ).show();
			var param = {};
			
			var index = 0;
			for (var ii = 0; ii < treeGrid.list.length; ii++) {
				var itemTemp = treeGrid.list[ii];
				console.log("temp: "+itemTemp.isChecked);
				if (itemTemp.isChecked == "Y") {
					param['categoryList['+index+'].cateId'] = itemTemp.cateId;
					param['categoryList['+index+'].cateParentId'] = itemTemp.cateParentId;
					index++;
				}
			}

			ajaxUtil.req("<c:url value='/operate/category/del'/>", param, 'cateui.delCallback', false);
			cateDialog.dialog( "close" );
		},
		delCallback: function(result) {
			console.log("result.success: "+result.success);    				
			if(result.success == "success"){
				toastView.viewMessage("정상적으로 저장되었습니다.");
		        cateui.search();
			} else {
				toastView.viewMessage("저장 시 문제가 발생되었습니다. \nError: "+result.message);
			}
		} 
	}
	
	function delConfirm() {
		confirmDialog.confirm({
            title: "확인",
            msg: '선택한 카테고리를 삭제 하시겠습니까?'
        }, function(){
            if(this.key == "ok"){
            	cateui.del()
            }
            else if(this.key == "cancel"){
            }
        });
	}
	
</script>
<body>
	<div class="wrap"> 	
		<header class="top_section"> 
			<jsp:include page="../header/top_navi.jsp" flush="false" />
		</header>
		<div class="middle_section"> 
			<div class="middle_section_contents">
				<div class="main">
					<div class="main_content"> 
						<div class="main_title">
							<h2>카테고리 관리</h2>
						</div>		
						<div class="content_box">							
							<div class="submit_btn_box"> 
								<button class="inquiry" type="button"
								onclick="cateui.search(); return false;">조회</button>
								<button class="save" id="save" type="button" onclick="cateui.openForCreate(); return false;"
									>추가</button>
								<button class="cancel" id="del" type="button"  onclick="delConfirm(); return false;">삭제</button>
							</div>		
							<div class="table_box">
								<div style="position: relative;height:600px;" id="grid-parent">
								    <div data-ax5grid="data-grid" data-ax5grid-config="{}" style="height: 100%;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="dialog-form" title="카테고리 정보">
		<p class="validateTips"></p>	
		<form>
			<fieldset>
				<label for="pid">상위카테고리</label>
				<input type="text" name="catePrName" id="catePrName" value="" class="text_rdoy ui-widget-content ui-corner-all" readonly>
				<input type="hidden" name="catePid" id="catePid" value="" class="text ui-widget-content ui-corner-all">
				<input type="hidden" name="actId" id="actId" value="" class="text ui-widget-content ui-corner-all">
				<label for="cateId">카테고리 ID</label>
				<input type="text" name="cateId" id="cateId" value="" class="text ui-widget-content ui-corner-all">
				<label for="cateName">카테고리명</label>
				<input type="text" name="cateName" id="cateName" value="" class="text ui-widget-content ui-corner-all">
				<label for="cateName">비고</label>
				<textarea name="cateRemark" id="cateRemark" class="text ui-widget-content ui-corner-all"  cols="43" rows="5" >
				</textarea>
				<!-- Allow form submission with keyboard without duplicating the dialog button -->
				<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
			</fieldset>
		</form>
	</div>
 </BODY>
</HTML>
