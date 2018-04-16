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
			<button class="inquiry" type="button" onclick="popAct.search(); return false;">조회</button>	
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
								<h2>브랜드 관리</h2>
						</div>
						<div class="content_box">
							<div class="submit_btn_box"> 
								<button type="button" class="save" onclick="brandAct.add(); return false;">저장</button>
								<button type="button" class="cancel" onclick="brandAct.cleanInit(); return false;">초기화</button>
							</div>
							<div class="table_box">
								<table class="set">
									<tbody> 
										<tr>
											<th>* 고객사명</th>
											<td>
												<div class="name_box"> 
													<input type="text" readonly  id="txtCustNm"/> <!-- class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" -->
													<button type="button" id="btnFindCust" >찾기</button>
													<input type="text" id="txtCustId">
												</div>												
											</td>
										</tr>
										<tr>
											<th>* 브랜드명</th>
											<td>
												<div class="name_box"> 
													<input type="text"  id="txtBrandNm"/>
													<input type="text" id="txtBrandId" value="0">
													<input type="text" id="hdUpdateYn">
												</div>
											</td>
										</tr>
										<tr>
											<th>* 담당자명</th>
											<td>
												<div class="name_box"> 
													<input type="text"   id="txtChrgNm"/>
												</div>
											</td>
										</tr>
										<tr>
											<th>* 연락처</th>
											<td>
												<div class="phone_num_box"> 
													<select name="" id="sbCoct1">
														<option value="010">010</option>
														<option value="060">060</option>
														<option value="070">070</option>
													</select>
													<span>-</span>
													<input type="text" id="txtCoct2"/>
													<span>-</span>
													<input type="text" id="txtCoct3"/>
												</div>
											</td>
										</tr>
										<tr>
											<th>* 이메일</th>
											<td>
												<div class="mail_box"> 
													<input type="text" id="txtEmailId"/>
													<span>@</span>
													<input type="text" id="txtEmailAddrNm"/>
													<select name="" id="sbEmailAddrCd" onchange="brandAct.changeEmailCd(); return false;">
														<c:choose>
															<c:when test="${!empty codeList}">
																<option value="">직접입력</option>
																<c:forEach var="codeList" items="${codeList}">
																	<option value="${codeList.codeId}">${codeList.codeName}</option>
																</c:forEach>
															</c:when>
															<c:otherwise>
																<option value="">없음</option>
															</c:otherwise>
														</c:choose>
													</select>
													<button type="button" id="btnEmailCheckDupl" onclick="brandAct.checkEmailDupl(); return false;">중복확인</button>
													<input type="text" id="hdEmailDuplYn">
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
								<label for="">• 브랜드명</label>
								<input type="text" id="txtSchBrandNm"/>
								<label for="">• 고객사명</label>
								<input type="text" id="txtSchCustNm"/>
							<!-- 	<span class="img_srch">
									<button type="button"></button>
								</span> -->
							</form>
							
							<div class="submit_btn_box"> 
								<button class="inquiry" type="button" onclick="brandAct.search(); return false;">조회</button>
								<button class="cancel" type="button" onclick="delCustConfirm(); return false;">삭제</button>
							</div>	
							
							<div class="table_box">
								<div style="position: relative;height:370px;" id="grid-parent">
								    <div data-ax5grid="data-grid" data-ax5grid-config="{
								                    showLineNumber: true,
								                    showRowSelector: true,
								                    sortable: true,
								                    header: {align:'center'}
								                    }" style="height: 100%;">
									</div>
								</div>
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
	/* ax5.ui.grid.tmpl.page_status = function(){
        return '<span>{{{progress}}} {{fromRowIndex}} - {{toRowIndex}} of {{dataRowCount}} {{#dataRealRowCount}}  현재페이지 {{.}}{{/dataRealRowCount}} {{#totalElements}}  전체갯수 {{.}}{{/totalElements}}</span>';
    }; */
    $('#txtCoct2').mask('0000');
	$('#txtCoct3').mask('0000');
	$( '#txtCustId' ).val("0");

	

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
   

	var dataGrid;
    var dataGridCurrPage;
    var popDataGrid;
    
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
                		brandAct.clickItem(itemTemp);
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
                    {key: "coctNo", width: 140, label: "연락처", align: "center"},
                    {key: "chrgNm", width: 150, label: "담당자명", align: "center"},
                    {key: "emailFull", width: 200, label: "이메일", align: "center"},
                    /* {key: "emailAddrNm", width: 200, label: "emailAddrNm", align: "center", editor: {type: "text"}},
                    {key: "emailAddrCd", width: 200, label: "emailAddrCd", align: "center", editor: {type: "text"}}, */
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
    
    
    var customerPopBox;
    $(document.body).ready(function () {
    	
		$( '#hdUpdateYn' ).val('N');
		$( '#hdEmailDuplYn' ).val('N');
     	gridView.initView();
     	
        //gridView.setData(0, 10, 100, 10, null); 
        brandAct.search(0);
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
    
   
    var popAct = {
       	search : function() {
   			var custNm = $("#txtSchCustNmOnPop").val();
   			
   			console.log("custNm: "+custNm);
   			
   			
   			var param =	{ 'custNm' : custNm, 'qCurrPage' : 0 };

   			var paramStr = JSON.stringify(param);
   			console.log("param: "+paramStr)
   			ajaxUtil.req("<c:url value='/customer/customerPopList'/>", param, 'popAct.searchCallBack', false)
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
   					$('#popCustTable > tbody').append('<tr height=30 align=center valign=middel><td>'+(ii+1)+'</td><td><a href="#" onclick="popAct.selectedItem(\''+temp.custId+'\', \''+temp.custNm+'\');">'+temp.custNm+'</a></td><td align=center>'+temp.chrgNm+'</td><td align=center>'+temp.coctNo+'</td></tr>');
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
       	}
    }
    var brandAct = {
    	search : function(page_no) {
			var custNm = $("#txtSchCustNm").val();
			var brandNm = $("#txtSchBrandNm").val();

			console.log("custNm: "+custNm);
			console.log("brandNm: "+brandNm);
			
			
			var param =	{ 'brandNm' : brandNm, 'custNm' : custNm, 'qCurrPage' : page_no };

			var paramStr = JSON.stringify(param);
			console.log("param: "+paramStr)
			ajaxUtil.req("<c:url value='/brand/brandList'/>", param, 'brandAct.searchCallBack', false)
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
    	checkEmailDupl: function() {

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
			ajaxUtil.req("<c:url value='/brand/checkEmailDupl'/>", param, 'brandAct.checkEmailDuplCallBack', false)
    	}, 
    	checkEmailDuplCallBack: function(result) {

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
    		var hdEmailDuplYn = $( '#hdEmailDuplYn' ).val();
    		

    		var txtBrandId = $( '#txtBrandId' ).val();
    		var txtBrandNm = $( '#txtBrandNm' ).val();
    		var txtCustId = $( '#txtCustId' ).val();
    		var txtChrgNm = $( '#txtChrgNm' ).val();
    		var sbCoct1 = $( '#sbCoct1' ).val();
    		var txtCoct2 = $( '#txtCoct2' ).val();
    		var txtCoct3 = $( '#txtCoct3' ).val();
    		var txtEmailId = $( '#txtEmailId' ).val();
    		var txtEmailAddrNm = $( '#txtEmailAddrNm' ).val();
    		var sbEmailAddrCd = $( '#sbEmailAddrCd' ).val();
    		
    		console.log("hdUpdateYn: "+hdUpdateYn+" hdEmailDuplYn: "+hdEmailDuplYn);
    		if (jQuery.trim(txtBrandNm) == "") {
    			 toastView.viewMessage("브랜드명을 입력하세요."); 
    			 return;
    		}
    		if (jQuery.trim(txtChrgNm) == "") {
	   			 toastView.viewMessage("담당자명을 입력하세요."); 
	   			 return;
	   		}
    		if (jQuery.trim(txtCoct2) == "") {
	   			 toastView.viewMessage("연락처를 입력하세요."); 
	   			 return;
	   		}
    		if (jQuery.trim(txtCoct3) == "") {
	   			 toastView.viewMessage("연락처를 입력하세요."); 
	   			 return;
	   		}
    		if (jQuery.trim(txtEmailId) == "") {
	   			 toastView.viewMessage("이메일을 입력하세요."); 
	   			 return;
	   		}
    		if (jQuery.trim(txtEmailAddrNm) == "") {
	   			 toastView.viewMessage("이메일을 입력하세요."); 
	   			 return;
	   		}
    		
    		if (hdUpdateYn == "N") {
    			if (hdEmailDuplYn == "N") {
    				 toastView.viewMessage("이메일의 중복확인이 필요합니다. 중복확인 하십시오."); 
    				 return;
    			}
    		}

    		var txtBrandNm = $( '#txtBrandNm' ).val();
    		var txtCustId = $( '#txtCustId' ).val();
    		var txtChrgNm = $( '#txtChrgNm' ).val();
    		var sbCoct1 = $( '#sbCoct1' ).val();
    		var txtCoct2 = $( '#txtCoct2' ).val();
    		var txtCoct3 = $( '#txtCoct3' ).val();
    		var txtEmailId = $( '#txtEmailId' ).val();
    		var txtEmailAddrNm = $( '#txtEmailAddrNm' ).val();
    		var sbEmailAddrCd = $( '#sbEmailAddrCd' ).val();
    		
    		var coctNo = sbCoct1+'-'+txtCoct2+'-'+txtCoct3;
    		
    		var param =	{ 'custId' : txtCustId, 'brandId' : txtBrandId, 'brandNm' : txtBrandNm, 'chrgNm' : txtChrgNm, 'coctNo' : coctNo, 'emailId' : txtEmailId, 'emailAddrNm' : txtEmailAddrNm, 'emailAddrCd' : sbEmailAddrCd, 'updateYn': hdUpdateYn};

			var paramStr = JSON.stringify(param);
			console.log("param: "+paramStr)
			
    		ajaxUtil.req("<c:url value='/brand/addBrand'/>", param, 'brandAct.testCallBack', false);
    	},    	
    	testCallBack: function(result) {
    		console.log("result.success: "+result.success);    				
    		if(result.success == "success"){
    			toastView.viewMessage("저장되었습니다."); 
    			brandAct.cleanInit();
    			brandAct.search();
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
    				param['brandList['+index+'].brandId'] = itemTemp.brandId;
    				index++;
    			}
    		}
    		
    		var codes = JSON.stringify(param);

    		console.log("param: "+codes);
    		ajaxUtil.req("<c:url value='/brand/delBrandList'/>", param, 'brandAct.deleteCallBack', false);
    	},
    	deleteCallBack: function(result) {
    		console.log("result.success: "+result.success);    				
    		if(result.success == "success"){
    			toastView.viewMessage("삭제 처리 되었습니다."); 
    			brandAct.cleanInit();
    			brandAct.search();
    		} else {
    			//$('#mod_cctv').modal('hide');
    		}
    	},
    	cleanInit: function() {
    		$( '#txtBrandId' ).val("0");
    		$( '#txtBrandNm' ).val("");
    		$( '#txtCustId' ).val("0");
    		$( '#txtCustNm' ).val("");
    		$( '#txtChrgNm' ).val("");
    		$( '#sbCoct1' ).val("010");
    		$( '#txtCoct2' ).val("");
    		$( '#txtCoct3' ).val("");
    		$( '#txtEmailId' ).val("");
    		$( '#txtEmailAddrNm' ).val("");
    		$( '#sbEmailAddrCd' ).val("");
    		$( '#hdUpdateYn' ).val("N");
    		$( '#hdEmailDuplYn' ).val("N");
    		$("#btnEmailCheckDupl").show();	
    		selectedCodeGroupId = "";
    	},
    	changeEmailCd : function() {
    		var emailCd = $('#sbEmailAddrCd').val();
    		console.log("emailCd: "+emailCd);
    		if (emailCd == "") {
    			return;
    		}
    		if (emailCd == "direct") {
    			$("#txtEmailAddrNm").prop("readonly", false);
    			$("#txtEmailAddrNm").focus();
    		}else {
    			$("#sbEmailAddrCd").prop("readonly", true);    	
    			$("#txtEmailAddrNm").val($('#sbEmailAddrCd  option:selected').text());	
    		}
    	},
    	clickItem: function(selectedItem) {
    		console.log("selectedItem: "+selectedItem);
    		var paramStr = JSON.stringify(selectedItem);
			console.log("param: "+paramStr)
    		$( '#hdUpdateYn' ).val("Y");
    		$( '#hdEmailDuplYn' ).val("Y");
    		$( "#btnEmailCheckDupl").hide();

    		$( '#txtBrandId' ).val(selectedItem.brandId);
    		$( '#txtBrandNm' ).val(selectedItem.brandNm);
    		$( '#txtCustId' ).val(selectedItem.custId);
    		$( '#txtCustNm' ).val(selectedItem.custNm);
    		$( '#txtChrgNm' ).val(selectedItem.chrgNm);
    		$( '#sbCoct1' ).val(selectedItem.coctNo1);
    		$( '#txtCoct2' ).val(selectedItem.coctNo2);
    		$( '#txtCoct3' ).val(selectedItem.coctNo3);
    		$( '#txtEmailId' ).val(selectedItem.emailId);
    		$( '#txtEmailAddrNm' ).val(selectedItem.emailAddrNm);
    		$( '#sbEmailAddrCd' ).val(selectedItem.emailAddrCd);
    		
    		if (jQuery.trim(selectedItem.emailAddrCd) != "") {
    			$("#txtEmailAddrNm").prop("readonly", true);   
    		}else {
    			$("#txtEmailAddrNm").prop("readonly", false);   
    		}

    		
    		var coctNo = sbCoct1+'-'+txtCoct2+'-'+txtCoct3;
    		
    		//var param =	{ 'brandNm' : txtBrandNm, 'chrgNm' : txtChrgNm, 'coctNo' : coctNo, 'emailId' : txtEmailId, 'emailAddrNm' : txtEmailAddrNm, 'emailAddrCd' : sbEmailAddrCd, 'updateYn': hdUpdateYn};

    	}
    }
    

    function delCustConfirm() {
    	/* confirmDialog.confirm({
            title: "확인",
            msg: '선택한 고객사를 삭제 하시겠습니까?'
        }, function(){
            if(this.key == "ok"){
            	brandAct.del()
            }
            else if(this.key == "cancel"){
            }
        }); */
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
    				brandAct.del();
        			console.log('This was true: ' + result);
    			}else {
        			console.log('This was false: ' + result);
    			}
    		}
    	});
    }
</script>