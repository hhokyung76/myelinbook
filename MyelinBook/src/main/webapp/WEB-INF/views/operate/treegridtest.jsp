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
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
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
    $(document.body).ready(function () {//$( '#dialog-form' ).hide();
    	// toast init
	    axToast = new ax5.ui.toast({
            containerPosition: "top-left",
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
        var treeGrid = new ax5.ui.grid({
            target: $('[data-ax5grid="data-grid"]'),
            showLineNumber: true,
            showRowSelector: true,
            header: {align:'center'},
            frozenColumnIndex: 3,
            frozenRowIndex: 2,
            columns: [
                
                {key: "name", label: "Name", align: "left", width: 200, treeControl: true},
                {
                    key: "isChecked", label: "Checkbox", width: 50, sortable: false, align: "center", editor: {
                    type: "checkbox", config: {height: 17, trueValue: "Y", falseValue: "N"}
                }
                },
                {
                    key: "id",
                    label: "ID",
                    width: 55,
                    styleClass: function () {
                        return "ABC";
                    },
                    enableFilter: true,
                    align: "center",
                    editor: {
                        type: "text", disabled: function () {
                            // item, value
                            return false;
                        }
                    }
                },
                {
                    key: "saleType", label: "saleType", align: "center", editor: {
                    type: "select", config: {
                        columnKeys: {
                            optionValue: "CD", optionText: "NM"
                        },
                        options: [
                            {CD: "A", NM: "A: String"},
                            {CD: "B", NM: "B: Number"},
                            {CD: "C", NM: "C: substr"},
                            {CD: "A", NM: "A: String"},
                            {CD: "B", NM: "B: Number"},
                            {CD: "C", NM: "C: substr"},
                            {CD: "A", NM: "A: String"},
                            {CD: "B", NM: "B: Number"},
                            {CD: "C", NM: "C: substr"},
                            {CD: "A", NM: "A: String"},
                            {CD: "B", NM: "B: Number"},
                            {CD: "C", NM: "C: substr"},
                            {CD: "D", NM: "D: substring"}
                        ]
                    }
                }
                },
                {
                    key: "saleDt", label: "saleDt", align: "center", editor: {
                    type: "date", config: {}
                }
                },
                {
                    key: "customer", label: "Customer", align: "center", editor: {type: "text"}
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
                    parentKey: "pid",
                    selfKey: "id"
                }
            }
        });
 
        var sampleData = [
            {id: 0, name: "카테고리", price: 1000, amount: null, saleDt: "2016-08-29", customer: "테스트", saleType: "A", isChecked: "N"},
            {pid: "0", id: "2", name: "Seowoo", price: 1100, amount: 11, saleDt: "2016-08-28", customer: "테스트", saleType: "B", isChecked: "N"},
            {pid: "0", id: "3", name: "Mondo", price: 1200, amount: 10, saleDt: "2016-08-27", customer: "테스트", saleType: "A", isChecked: "N"},
            {pid: "0", id: "4", name: "Brant", price: 1300, amount: 8, saleDt: "2016-08-25", customer: "테스트", saleType: "C", isChecked: "N"},
            {pid: "3", id: "35", name: "Tiffany", price: 1500, amount: 2, saleDt: "2016-08-26", customer: "테스트", saleType: "A", isChecked: "N"},
            {pid: "3", id: "36", name: "Edward", price: 1400, amount: 5, saleDt: "2016-08-29", customer: "테스트", saleType: "D", isChecked: "N"},
            {pid: "4", id: "5", name: "Tiffany", price: 1500, amount: 2, saleDt: "2016-08-26", customer: "테스트", saleType: "A", isChecked: "N"},
            {pid: "4", id: "6", name: "Edward", price: 1400, amount: 5, saleDt: "2016-08-29", customer: "테스트", saleType: "D", isChecked: "N"},
            {pid: "4", id: "7", name: "Bill", price: 1400, amount: 5, saleDt: "2016-08-29", customer: "테스트", saleType: "B", isChecked: "N"},
            {pid: "0", id: "8", name: "Aeei", price: 1400, amount: 5, saleDt: "2016-08-29", customer: "테스트", saleType: "C", isChecked: "N"}
        ];
        firstGrid.setData(sampleData);
 
    });
    

	var cateui = {
		search : function() {
			
		},
		checkPidNull: function() {
			console.log("dIndex: "+axGridSelectedIndex);
			var itemTemp = treeGrid.list[axGridSelectedIndex];
			if (itemTemp == null) {
				toastView.viewMessage("상위 카테고리를 선택하십시오."); 
				return false;
			}
			return true;
		},
		openForCreate : function() {      // 새로운 카테고리 생성 화면 오픈
			var checked = cateui.checkPidNull();
    		if (checked == true) {
    			var itemTemp = treeGrid.list[axGridSelectedIndex];
        		console.log("item: "+itemTemp.pid+" "+itemTemp.name);
				$( '#dialog-form' ).show();
				cateDialog.dialog( "open" );
			}
		},
		openForUpdate : function(item) {  // 그리드 더블클릭 시 수정 화면 오픈
			var checked = cateui.checkPidNull();
			if (checked == true) {
				var itemTemp = treeGrid.list[axGridSelectedIndex];
	    		console.log("item: "+itemTemp.pid+" "+itemTemp.name);
				$( '#dialog-form' ).show();
				cateDialog.dialog( "open" );
				$( '#catePid' ).val(item.pid);
			}
		},
		saving : function() {             // 새로운 카테고리 및 수정 화면에서 데이터 입력 후 저장 시 처리.
			//$( '#dialog-form' ).show();
			console.log("saving.. called..");
			cateDialog.dialog( "close" );
		}
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
								<h2>카테고리 관리33</h2>
						</div>		
						<div class="content_box">
							
							<div class="submit_btn_box"> 
								<button class="inquiry" type="button"
								onclick="user.search.load(); return false;">조회</button>
								<button class="save" id="saveAppr" type="button">추가</button>
								<button class="save" id="saveAppr" type="button">삭제</button>
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
				<input type="text" name="catePid" id="catePid" value="" class="text ui-widget-content ui-corner-all" readonly>
				<label for="cateId">카테고리 ID</label>
				<input type="text" name="cateId" id="cateId" value="" class="text ui-widget-content ui-corner-all">
				<label for="cateName">카테고리명</label>
				<input type="text" name="cateName" id="cateName" value="" class="text ui-widget-content ui-corner-all">
				<label for="cateName">비고</label>
				<textarea name="cateRemark" id="cateRemark" value="" class="text ui-widget-content ui-corner-all"  cols="43" rows="5" >
				</textarea>
				<!-- Allow form submission with keyboard without duplicating the dialog button -->
				<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
			</fieldset>
		</form>
	</div>
 </BODY>
</HTML>
