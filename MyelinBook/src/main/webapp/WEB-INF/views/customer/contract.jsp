<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<title>브랜드 관리</title>
	<style>
	    .grid-cell-red{
	        background: #f8d2cb;
	    }
	    .grid-cell-blue{
	        background: #dcf0f8;
	    }
	</style>
	<!-- 공통 css -->
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet"/>
	<link rel="stylesheet" href="../css/reset.css"/>
	<link rel="stylesheet" href="../css/style.css"/>
	<link rel="stylesheet" href="../css/theme.css"/>
	
	<!-- font-awesome -->
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-grid/master/dist/ax5grid.css">
	<link rel="stylesheet" href="../plugin/font-awesome/font-awesome-4.7.0/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-toast/master/dist/ax5toast.css" />
	
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-dialog/master/dist/ax5dialog.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-uploader/master/dist/ax5uploader.css">
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
	<!--<script src="http://code.jquery.com/jquery-1.7.2.min.js "></script>-->
	
	
	<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.min.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5core/master/dist/ax5core.min.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-grid/master/dist/ax5grid.min.js"></script>
	<script type="text/javascript"	src="https://cdn.rawgit.com/ax5ui/ax5ui-toast/master/dist/ax5toast.min.js"></script>
	<script src="<c:url value="/js/util.ajax.js" />"></script>
	<script src="<c:url value="/js/valid/jquery.validate.min.js" />" type="text/javascript"></script>
	<script src="<c:url value="/js/mask/jquery.mask.min.js" />" type="text/javascript"></script>
	<!-- bootbox.js at 4.4.0 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://rawgit.com/makeusabrew/bootbox/f3a04a57877cab071738de558581fbc91812dce9/bootbox.js"></script>
	    <script src="<c:url value="/js/jquery.bpopup.js" />"></script>
	<!-- 공통 js -->
	<script src="../js/custom.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-dialog/master/dist/ax5dialog.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-uploader/master/dist/ax5uploader.js"></script>
	<script src="https://cdn.rawgit.com/thomasJang/jquery-direct/master/dist/jquery-direct.min.js"></script>
	
	<!-- date picker js css -->
	<link  href="../css/datepicker.css" rel="stylesheet">
	<script src="../js/datepicker/datepicker.js"></script>
</head>
<body>
	<div class="wrap"> 
	
		<header class="top_section"> 
			<jsp:include page="../header/top_navi.jsp" flush="false" />
		</header>
		<!-- top_section -->
		
		<div id="customer-pop-container" style="display:none">
          	<label for="">• 고객사명</label>
			<input type="text" id="txtSchCustNmOnPop"/>
			<button class="inquiry" type="button" onclick="popCustAct.search(); return false;">조회</button>	
            <!-- <div data-ax5grid="popUpGrid" data-ax5grid-config="{}" style="height: 1000px;"></div> -->
            <div class="table_box" style="width:100%;height:250px;">
				<table id="popCustTable" style="width:100%;overflow-x:auto">
					<thead> 
						<tr align=center valign=middle height=28> 
							<th align=center width=30>No</th>
							<th align=center width=100>고객사명</th>
							<th align=center width=100>담당자명</th>
							<th align=center width=100>연락처</th>
						</tr>
					</thead>
					<tbody> 
					</tbody>
				</table>
			</div>
        </div>
		<div class="middle_section"> 
			<div class="middle_section_contents">
				<div class="main">
					
					<div class="main_content"> 
					
						<div class="main_title">
								<h2>계약서 관리</h2>
						</div>
						<div class="content_box">
							<div class="submit_btn_box"> 
								<button type="button" class="save" onclick="contractAct.add(); return false;">저장</button>
								<button type="button" class="save" onclick="listFile(); return false;">이미지테스트</button>
								<button type="button" class="cancel" onclick="contractAct.cleanInit(); return false;">초기화</button>
							</div>
							<div class="table_box">
								<table class="set">
									<tbody> 
										<tr>
											<th>* 고객사명</th>
											<td colspan="3">
												<div class="name_box"> 
													<input type="text"  readonly  id="txtCustNm"/> 
													<button type="button" id="btnFindCust" >찾기</button>
													<input type="text" id="txtCustId">
												</div>
											</td>
										</tr>
										<tr>
											<th>* 브랜드명</th>
											<td colspan="3">
												<div class="name_box"> 
													<select name="" id="sbBrandVal">
													<!-- 고객사에 따라 브랜드 option 추가  -->
													
														<option value="0">전체</option>
													
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<th>* 계약서명</th>
											<td>
												<div class="name_box"> 
													<input type="text" id="txtCortNm" value=""/>
													<input type="text" id="txtCortId" value="0">
													<input type="text" id="hdUpdateYn" value="N">
												</div>
											</td>
											
											<th rowspan="3">요구사항</th>
											<td rowspan="3">
												<div class="text_box"> 
													<textarea name="txtCortReq" id="txtCortReq" cols="65" rows="5" style="resize:both;width:98%;min-width:200px;height:98%;min-height:200px;"></textarea>
												</div>
											</td>
											
											
										</tr>
										<tr>
											<th>* 계약서<br>파일</th>
											<td>
												<div data-ax5uploader="upload1">
												    <button data-ax5uploader-button="selector" class="btn btn-primary">파일 선택.(*/*)</button>
												    (Upload Max fileSize 20MB)
												    <div data-uploaded-box="upload1" data-ax5uploader-uploaded-box="inline"></div>
												</div>
											</td>
										</tr>
										<!-- <tr>
											
										</tr> -->
										<tr>
											<th>반송일자</th>
											<td>
												<!-- <div class="name_box"> 
													<input id="return_date" type="text"/>
												</div> -->
												<div class="input-group" data-ax5picker="basic">
										            <input id="dtCortRetnDate" data-toggle="datepicker">
										        </div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>							
						</div>
						<!-- content_box -->
					
					
					
						<div class="content_box">		

							<form class="srch_box_align_left"> 
								<label for="">• 고객사명</label>
								<input type="text" id="txtSchCustNm"/>
								<span class="img_srch">
									<button type="button"></button>
								</span>
							</form>
							
							<form class="srch_box_align_left"> 
								<label for="">• 브랜드명</label>
								<select name="sbSchBrandNm" id="sbSchBrandNm">
									<option value="0">전체</option>
									<!-- 고객사에 따라 브랜드 option 추가  -->
									<!-- 
										<option value=""></option>
										<option value=""></option>
										<option value=""></option> 
									-->
								</select>
							</form>
							
							<form class="srch_box_align_left"> 
								<label for="">• 계약서명</label>
								<input type="text"  name="txtSchCortNm" id="txtSchCortNm">
									<!-- 고객사에 따라 브랜드 option 추가  -->
									<!-- 
										<option value=""></option>
										<option value=""></option>
										<option value=""></option> 
									-->
								</select>
							</form>
							
							<div class="submit_btn_box"> 
								<button class="inquiry" type="button" onclick="contractAct.search(); return false;">조회</button>
								<button class="cancel" type="button" onclick="delContractConfirm(); return false;">삭제</button>
							</div>
							
							<div class="table_box">
								<div style="position: relative;height:300px;" id="grid-parent">
								    <div data-ax5grid="data-grid" data-ax5grid-config="{
								                    showLineNumber: true,
								                    showRowSelector: true,
								                    sortable: true,
								                    header: {align:'center'}
								                    }" style="height: 100%;">
									</div>
								</div>
							</div>	
							<!-- table_box -->
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


	function tipsAlert(messageStr) {
		bootbox.alert({
			title: "경고",
		    message: messageStr,
		    size: 'small'
		});
	}
	
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
	
	var UPLOAD = null;
	$(function () {
		$('[data-toggle="datepicker"]').datepicker({
			format: 'yyyy-mm-dd'
		});
		
	    /* $('#sbBrandVal').on('change', function() {
	    	console.log("sbBrandVal changed: "+this.value);
	    	$('#txtBrandId').val(this.value);
	    }); */
	    
	    var API_SERVER = "http://localhost:8080";
	    var DIALOG = new ax5.ui.dialog({
	        title: "AX5UI"
	    });
	    
	    UPLOAD = new ax5.ui.uploader({
	        //debug: true,
	        target: $('[data-ax5uploader="upload1"]'),
	        form: {
	            action: API_SERVER + "/tips/ax5uploader?category=contract",
	            fileName: "file"	            
	        },
	        multiple: true,
	        manualUpload: false,
	        progressBox: true,
	        progressBoxDirection: "left",
	        dropZone: {
	            target: $('[data-uploaded-box="upload1"]')
	        },
	        uploadedBox: {
	            target: $('[data-uploaded-box="upload1"]'),
	            icon: {
	                "download": '<i class="fa fa-download" aria-hidden="true"></i>',
	                "delete": '<i class="fa fa-minus-circle" aria-hidden="true"></i>'
	            },
	            columnKeys: {
	                name: "fileName",
	                type: "ext",
	                size: "fileSize",
	                uploadedName: "saveName",
	                uploadedPath: "",
	                downloadPath: "",
	                previewPath: "",
	                thumbnail: ""
	            },
	            lang: {
	                supportedHTML5_emptyListMsg: '<div class="text-center" style="padding-top: 30px;">Drop files here or click to upload.</div>',
	                emptyListMsg: '<div class="text-center" style="padding-top: 30px;">Empty of List.</div>'
	            },
	            onchange: function () {
	
	            },
	            onclick: function () {
	                // console.log(this.cellType);
	                var fileIndex = this.fileIndex;
	                var file = this.uploadedFiles[fileIndex];
	                switch (this.cellType) {
	                    case "delete":
	                        DIALOG.confirm({
	                            title: "AX5UI",
	                            msg: "Are you sure you want to delete it?"
	                        }, function () {
	                            if (this.key == "ok") {
	                                $.ajax({
	                                    contentType: "application/json",
	                                    method: "post",
	                                    url: API_SERVER + "/tips/ax5uploader/delete",
	                                    data: JSON.stringify([{
	                                        id: file.id
	                                        
	                                    }]),
	                                    success: function (res) {
	                                        if (res.error) {
	                                            alert(res.error.message);
	                                            return;
	                                        }
	                                        UPLOAD.removeFile(fileIndex);
	                                    }
	                                });
	                            }
	                        });
	                        break;
	
	                    case "download":
	                        if (file.download) {
	                        	alert(API_SERVER+file.download);
	                            location.href = API_SERVER + file.download;
	                        }
	                        break;
	                }
	            }
	        },
	        validateSelectedFiles: function () {
	            console.log(this);
	            // 10개 이상 업로드 되지 않도록 제한.
	            if (this.uploadedFiles.length + this.selectedFiles.length > 10) {
	                alert("You can not upload more than 10 files.");
	                return false;
	            }
	
	            return true;
	        },
	        onprogress: function () {
	
	        },
	        onuploaderror: function () {
	            console.log(this.error);
	            DIALOG.alert(this.error.message);
	        },
	        onuploaded: function () {
	
	        },
	        onuploadComplete: function () {
	
	        }
	    });
	
	    // 파일 목록 가져오기
	    $.ajax({
	        method: "GET",
	        url: API_SERVER + "/tips/ax5uploader",
	        success: function (res) {	
	            console.log(res);
	            UPLOAD.setUploadedFiles(res);
	        }
	    });
	
	    // 컨트롤 버튼 이벤트 제어
	    $('[data-btn-wrap]').clickAttr(this, "data-upload-btn", {
	        "getUploadedFiles": function () {
	            var files = ax5.util.deepCopy(UPLOAD.uploadedFiles);
	            console.log(files);
	            DIALOG.alert(JSON.stringify(files));
	        },
	        "removeFileAll": function () {
	
	            DIALOG.confirm({
	                title: "AX5UI",
	                msg: "Are you sure you want to delete it?"
	            }, function () {
	
	                if (this.key == "ok") {
	
	                    var deleteFiles = [];
	                    UPLOAD.uploadedFiles.forEach(function (f) {
	                        deleteFiles.push({id: f.id});
	                    });
	
	                    $.ajax({
	                        contentType: "application/json",
	                        method: "post",
	                        url: API_SERVER + "/tips/ax5uploader/delete",
	                        data: JSON.stringify(deleteFiles),
	                        success: function (res) {
	                            if (res.error) {
	                                alert(res.error.message);
	                                return;
	                            }
	
	                            UPLOAD.removeFileAll();
	                        }
	                    });
	
	                }
	            });
	        }
	    });
	});
	
	
	function listFile() {
		var list = {};
		UPLOAD.uploadedFiles.forEach(function (f) {
            console.log("file.id: "+f.id);
        });
	}
	//************************************************//
	// 고객사 조회 팝업 처리 로직
	//************************************************//
	var popCustAct = {
       	search : function() {
   			var custNm = $("#txtSchCustNmOnPop").val();
   			
   			console.log("custNm: "+custNm);
   			
   			
   			var param =	{ 'custNm' : custNm, 'qCurrPage' : 0 };

   			var paramStr = JSON.stringify(param);
   			console.log("param: "+paramStr)
   			ajaxUtil.req("<c:url value='/customer/customerPopList'/>", param, 'popCustAct.searchCallBack', false)
       	},
       	searchCallBack: function(result) {
       		console.log("result.success: "+result.success);    				
   			if(result.success == "success"){
   				$('#popCustTable > tbody > tr').remove();
   				//var myJSON = JSON.stringify(result.list);
   				for (var ii = 0; ii < result.list.length; ii++) {
   					var temp = result.list[ii];
   					console.log("item: "+JSON.stringify(temp));
   					var jsonStr = JSON.stringify(temp);
   					$('#popCustTable > tbody').append('<tr height=30 align=center valign=middel><td>'+(ii+1)+'</td><td><a href="#" onclick="popCustAct.selectedItem(\''+temp.custId+'\', \''+temp.custNm+'\');">'+temp.custNm+'</a></td><td align=center>'+temp.chrgNm+'</td><td align=center>'+temp.coctNo+'</td></tr>');
   				}
   				
   			} else {
   			}
       	},
       	selectedItem: function(id, name) {
       		console.log('id: '+id);
       		console.log('name: '+name);
       		$('#txtCustNm').val(name);
       		$('#txtCustId').val(id);
       		customerPopBox.modal('hide'); 
       		popCustAct.searchBrand();
       	},
       	clearBrand : function() {
			$("#sbBrandVal option").remove();
			$("#sbBrandVal").append("<option value='0'>전체</option>");
       	},
       	searchBrand : function() {
   			var custId = $("#txtCustId").val();
   			
   			console.log("custId: "+custId);
   			
   			
   			var param =	{ 'custId' : custId };

   			var paramStr = JSON.stringify(param);
   			console.log("param: "+paramStr)
   			ajaxUtil.req("<c:url value='/brand/combobrandList'/>", param, 'popCustAct.searchComboCallBack', false)
       	},
       	searchComboCallBack: function(result) {
       		if (selectedContractId != "") {
       			console.log("selectedContractId is not null "+selectedContractId);
       		}
       		console.log("result.success: "+result.success);    				
   			if(result.success == "success"){
   				$('#popCustTable > tbody > tr').remove();
   				//var myJSON = JSON.stringify(result.list);
   				$("#sbBrandVal option").remove();
   				$("#sbBrandVal").append("<option value='0'>전체</option>");
   				
   				for (var ii = 0; ii < result.list.length; ii++) {
   					var temp = result.list[ii];
   					console.log("item: "+JSON.stringify(temp));
   	   				$("#sbBrandVal").append("<option value='"+temp.brandId+"'>"+temp.brandNm+"</option>");
   					//var jsonStr = JSON.stringify(temp);
   					//$('#popCustTable > tbody').append('<tr height=30 align=center valign=middel><td>'+(ii+1)+'</td><td><a href="#" onclick="popCustAct.selectedItem(\''+temp.custId+'\', \''+temp.custNm+'\');">'+temp.custNm+'</a></td><td align=center>'+temp.chrgNm+'</td><td align=center>'+temp.coctNo+'</td></tr>');
   				}
   				$("#sbBrandVal").val(selectedContractBrandId)
   				
   			} else {
   			}
       	}
    }
	//************************************************//
	//고객사 팝업 조회 처리 end...
	//************************************************//
	
	
	//************************************************//
	//계약서 관리 처리 시작...
	//************************************************//
	var selectedContractId = "";
	var selectedContractBrandId = "";
	var contractAct = {
    	search : function(page_no) {
			var cortNm = $("#txtSchCortNm").val();
			var custNm = $("#txtSchCustNm").val();
			var brandNm = $("#txtSchBrandNm").val();

			console.log("custNm: "+custNm);
			console.log("brandNm: "+brandNm);
			
			
			var param =	{ 'brandNm' : brandNm, 'custNm' : custNm, 'cortNm' : cortNm, 'qCurrPage' : page_no };

			var paramStr = JSON.stringify(param);
			console.log("param: "+paramStr)
			ajaxUtil.req("<c:url value='/contract/contractList'/>", param, 'contractAct.searchCallBack', false)
    	},
    	searchCallBack: function(result) {
    		console.log("result.success: "+result.success);    				
			if(result.success == "success"){
				var myJSON = JSON.stringify(result);
				//console.log("result myJSON: "+myJSON);    					
				gridView.setData(dataGridCurrPage, result.pageListSize, result.totalPage, result.totalCount, result.list);
				
			} else {
				//$('#mod_cctv').modal('hide');
			}
    	}, 
    	checkContractDupl: function() {

    		var txtEmailId = $( '#txtEmailId' ).val();
    		var txtEmailAddrNm = $( '#txtEmailAddrNm' ).val();

    		if (txtEmailId == "") {
    			tipsAlert("이메일 정보를 입력하세요."); 
    			$( '#txtEmailId' ).focus();
    			return;
    		}
    		
    		
			var param =	{ 'emailId' : txtEmailId, 'emailAddrNm' : txtEmailAddrNm };

			var myJSON = JSON.stringify(param);
			console.log("result myJSON: "+myJSON); 
			ajaxUtil.req("<c:url value='/contract/checkContractDupl'/>", param, 'contractAct.checkContractDuplCallBack', false)
    	}, 
    	checkContractDuplCallBack: function(result) {

    		if(result.success == "success"){
				var myJSON = JSON.stringify(result);
				console.log("result myJSON: "+myJSON);    	
				if (result.checkCount > 0) {
	    			toastView.viewMessage("중복되는 이메일이 있습니다. 확인바랍니다."); 
	    			return;
				}else {
	    			toastView.viewMessage("사용 가능한 이메일주소입니다."); 
					$( '#hdEmailDuplYn' ).val("Y");
				}
				
			} else {
				//$('#mod_cctv').modal('hide');
			}
    	},
    	add : function() {
    		var hdUpdateYn = $( '#hdUpdateYn' ).val();
    		
    		var txtCustId = $( '#txtCustId' ).val();
    		var txtCortId = $( '#txtCortId' ).val();
    		var txtCortNm = $( '#txtCortNm' ).val();
    		var txtCortReq = $( '#txtCortReq' ).val();
    		var dtCortRetnDate = $( '#dtCortRetnDate' ).val();
    		var sbBrandVal = $( '#sbBrandVal' ).val();
    		
    		console.log("hdUpdateYn: "+hdUpdateYn);
    		if (jQuery.trim(sbBrandVal) == "0") {
    			 toastView.viewMessage("브랜드명를 선택하세요.");
    			 $( '#sbBrandVal' ).focus();
    			 return;
    		}
    		if (jQuery.trim(txtCustId) == "0") {
	   			 toastView.viewMessage("고객사를 선택하세요."); 
	   			 return;
	   		}
    		if (jQuery.trim(txtCortNm) == "") {
	   			 toastView.viewMessage("계약서명을 입력하세요."); 
	   			 return;
	   		}
    		
    		var param =	{ 'custId' : txtCustId, 'brandId' : sbBrandVal, 'cortId' : txtCortId, 'cortNm' : txtCortNm, 'cortReq' : txtCortReq, 'retnDate' : dtCortRetnDate, 'updateYn': hdUpdateYn};

			var paramStr = JSON.stringify(param);
			console.log("param: "+paramStr)
			
    		ajaxUtil.req("<c:url value='/contract/addContract'/>", param, 'contractAct.testCallBack', false);
    	},    	
    	testCallBack: function(result) {
    		console.log("result.success: "+result.success);    				
    		if(result.success == "success"){
    			toastView.viewMessage("저장되었습니다."); 
    			contractAct.cleanInit();
    			contractAct.search();
    		} else {
    			//$('#mod_cctv').modal('hide');
    		}
    	},
    	del : function() {
    		var param = {};
    		var index = 0;
    		for (ii = 0; ii < dataGrid.list.length; ii++) {
    			//console.log(ii);
    			var itemTemp = dataGrid.list[ii];
    			if (itemTemp.__selected__ == true) {
    				console.log(itemTemp);
    				param['contractList['+index+'].cortId'] = itemTemp.cortId;
    				index++;
    			}
    		}
    		
    		var codes = JSON.stringify(param);

    		console.log("param: "+codes);
    		ajaxUtil.req("<c:url value='/contract/delContractList'/>", param, 'contractAct.deleteCallBack', false);
    	},
    	deleteCallBack: function(result) {
    		console.log("result.success: "+result.success);    				
    		if(result.success == "success"){
    			toastView.viewMessage("삭제 처리 되었습니다."); 
    			contractAct.cleanInit();
    			contractAct.search();
    		} else {
    			//$('#mod_cctv').modal('hide');
    		}
    	},
    	cleanInit: function() {
    		$( '#hdUpdateYn' ).val("N");
    		$( '#txtCortNm' ).val("");
    		$( '#txtCortId' ).val("");
    		$( '#txtCortReq' ).val("");
    		$( '#txtCustId' ).val("0");
    		$( '#txtCustNm' ).val("");
    		$( '#dtCortRetnDate' ).val("");
    		
    		popCustAct.clearBrand();
    		
    		selectedContractId = "";
    		selectedContractBrandId = "";
    	},
    	clickItem: function(selectedItem) {
    		console.log("selectedItem: "+selectedItem);
    		var paramStr = JSON.stringify(selectedItem);
			console.log("param: "+paramStr)
    		$( '#hdUpdateYn' ).val("Y");
    		$( '#txtCortNm' ).val(selectedItem.cortNm);
    		$( '#txtCortId' ).val(selectedItem.cortId);
    		$( '#txtCortReq' ).val(selectedItem.cortReq);
    		$( '#txtCustId' ).val(selectedItem.custId);
    		$( '#txtCustNm' ).val(selectedItem.custNm);
    		$( '#dtCortRetnDate' ).val(selectedItem.retnDate);

       		popCustAct.searchBrand();

    		$( '#sbBrandVal' ).val(selectedItem.brandId);
    		
    		selectedContractId = selectedItem.cortId;
    		selectedContractBrandId = selectedItem.brandId;
    	}
    }

	//************************************************//
	//계약서 관리 처리 end...
	//************************************************//
	
	
	// 계약서 리스트 삭제 처리 confirm
    function delContractConfirm() {
    	bootbox.confirm({
    		title: "알림창.",
    		message: "삭제하시겠습니까?",
    		buttons: {
    			cancel: {
    				label: 'No',
    				className: 'btn-danger'
    			},
    			confirm: {
    				label: 'Yes',
    				className: 'btn-success'
    			}
    		},
    		callback: function (result) {
    			console.log('This was logged in the callback: ' + result);
    			if (result == true) {
    				contractAct.del();
        			console.log('This was true: ' + result);
    			}else {
        			console.log('This was false: ' + result);
    			}
    		}
    	});
    }
	// 계약서 리스트 삭제 처리 confirm end....

	//************************************************//
	//계약서 관리 화면 조회 리스트 그리드 처리 
	//************************************************//
	var dataGrid;
    var dataGridCurrPage;
    
    var gridView = {   		
         initView: function () {
        	dataGrid = this.target;
        	dataGrid = new ax5.ui.grid();
        	dataGrid.setConfig({
                target: $('[data-ax5grid="data-grid"]'),
                frozenColumnIndex: 3,
                frozenRowIndex: 0,
                showLineNumber: true,
                showRowSelector: true,
                multipleSelect: true,
                lineNumberColumnWidth: 40,
                rowSelectorColumnWidth: 28,
                sortable: true, // 모든 컬럼에 정렬 아이콘 표시
                multiSort: false, // 다중 정렬 여부
                remoteSort: false, // remoteSort에 함수를 sortable 컬럼이 클릭되었을때 실행 setColumnSort를 직접 구현. (remoteSort를 사용하면 헤더에 정렬 상태만 표시 하고 데이터 정렬은 처리 안함)
                header: {
                    align: "center",
                    columnHeight: 28
                },
                body: {
                    align: "center",
                    columnHeight: 28,
                    onClick: function () {
                        // console.log(this);
                        this.self.select(this.dindex);
                		var itemTemp = dataGrid.list[this.dindex];
                		contractAct.clickItem(itemTemp);
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
                        gridView.setData(this.page.selectPage);
                        dataGridCurrPage = this.page.selectPage;
                        console.log('dataGridCurrPage: '+dataGridCurrPage);
                    }
                },
                columns: [
                    {
                        key: "custNm",
                        label: "고객사명",
                        width: 180,
                        styleClass: function () {
                            return "ABC";
                        },
                        enableFilter: true,
                        align: "center"
                    },
                    {key: "brandNm", width: 180, label: "브랜드명", align: "center"},
                    {key: "cortNm", width: 140, label: "계약서명", align: "center"},
                    {key: "cortFileNm", width: 150, label: "계약서파일", align: "center"},
                    {key: "retnDate", width: 150, label: "반송일자", align: "center"},
                    {key: "regDt", width: 150, label: "등록(수정)일시", align: "center"},
                    {key: "regId", width: 150, label: "등록(수정)자", align: "center"}
                ]
            });
            return this;
        },
        setData: function (_pageNo, _pageListSize, _totalPage, _totalCount, dataList) {
 
            /* var list = [];
            for (var i = 0, l = 10; i < l; i++) {
                list.push($.extend({}, sampleData[(Math.floor(Math.random() * sampleData.length))]));
            }  */
            
            console.log("pageNo: "+_pageNo)
        	console.log("_pageListSize: "+_pageListSize)
        	console.log("_totalPage: "+_totalPage)
        	console.log("_totalCount: "+_totalCount)
 
        	
            dataGrid.setData({
                list: dataList,
                page: {
                    currentPage: _pageNo || 0,
                    pageSize: _pageListSize,
                    totalElements: _totalCount,                          
                    totalPages: _totalPage
                }
            });  
            /* dataGrid.setData({
                list: dataList,
                page: {
                    currentPage: _pageNo || 0,
                    pageSize: 10,
                    totalElements: 100,
                    totalPages: 10
                }
            }); */ 
 
            return this;
        }
    };
	$(document.body).ready(function () {
    	
		$( '#hdUpdateYn' ).val('N');
     	gridView.initView();
     	//gridView.initView();
     	
        //gridView.setData(0, 10, 100, 10, null); 
        contractAct.search(0);
        /* $('#btnFindCust').bind('click', function(e) {
            e.preventDefault();
            $('#element_to_pop_up').bPopup({
                appendTo: 'form'
                , zIndex: 2
                , modalClose: false
            });
        }); */
        
        $('#btnFindCust').on('click', function(){
            var container = $('#customer-pop-container').clone();
            //container.find('table').attr('id', 'example');

            customerPopBox = bootbox.dialog({
              show: false,
              message: container.html(),
              title: "고객사 찾기.",
              buttons: {
                ok: {
                  label: "OK",
                  className: "btn-primary",
                  callback: function() {
                    console.log('OK Button');
                  }
                },
                cancel: {
                  label: "Cancel",
                  className: "btn-default"
                }
              }
            });
            
            customerPopBox.on("shown.bs.modal", function() {
              // $('#example').DataTable(); 
            });
            
            customerPopBox.modal('show'); 
         });
        
       
    });
</script>
    