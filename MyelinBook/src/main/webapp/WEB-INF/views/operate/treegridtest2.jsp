<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
 <HEAD>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<title>카테고리 관리</title>
	
	<!-- 공통 css -->
	<link rel="stylesheet" href="../css/reset.css"/>
	<link rel="stylesheet" href="../css/style.css"/>
	<link rel="stylesheet" href="../css/theme.css"/>
	
	<!-- 공통 css -->
  <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-calendar/master/dist/ax5calendar.css">
  <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-picker/master/dist/ax5picker.css">
  <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-select/master/dist/ax5select.css">
  <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-grid/master/dist/ax5grid.css">
  <link rel="stylesheet" type="text/css" href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5core/master/dist/ax5core.min.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-calendar/master/dist/ax5calendar.min.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-picker/master/dist/ax5picker.min.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-formatter/master/dist/ax5formatter.min.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-select/master/dist/ax5select.min.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-grid/master/dist/ax5grid.min.js"></script>
	<!-- 공통 js -->
	<script src="<c:url value="/js/custom.js" />"></script>
	<script src="<c:url value="/js/util.ajax.js" />"></script>
 </HEAD>
<script type="text/javascript">
    $(document.body).ready(function () {
        var API_SERVER = "http://api-demo.ax5.io";
        var firstGrid = new ax5.ui.grid({
            target: $('[data-ax5grid="first-grid"]'),
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
								onclick="user.search.load(); return false;">조회</button>
								<button class="save" id="saveAppr" type="button">추가</button>
								<button class="save" id="saveAppr" type="button">삭제</button>
							</div>		
							<div class="table_box">
								<div style="position: relative;height:600px;" id="grid-parent">
								    <div data-ax5grid="first-grid" data-ax5grid-config="{}" style="height: 100%;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
 </BODY>
</HTML>
