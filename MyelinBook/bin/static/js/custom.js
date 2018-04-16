$(function(){

	// 좌측 네비게이션 노출
	$("#showmenu").click(function(e){
				//e.preventDefault();
		$("#menu").toggleClass("show");
	});
	
	// 메뉴 요소 클릭시 
	$("#menu ul a").click(function(event){		// 메뉴 요소 클릭 시 
	
		// event.preventDefault();
		
		if( $(this).next('ul').length ){	// a의 형제요소로 ul 이 존재하는 경우 ( 세부메뉴 )
			// 클릭한 메뉴 요소의 색상 토글
			$(this).toggleClass("menu_on");
			// 클릭한 메뉴 요소의 부속 메뉴 노출
			$(this).next().css("z-index",'1000').toggleClass('block');
			// 클릭한 메뉴 요소의 드롭다운 화살표 토글
			$(this).children('i:last-child').toggleClass('caret_down caret_left');
			
			// 나머지 메뉴 요소의 색상 제자리로
			$(this).parent().siblings().children('a').removeClass("menu_on");
			// 나머지 메뉴 드롭다운 화살표 제자리로
			$(this).parent().siblings().children('a').children('i').removeClass("caret_left").addClass("caret_down")
			// 나머지 메뉴 사라지게
			$(this).parent().siblings().children('ul').css("z-index",'1').removeClass('block');
			
		}
	});
		
	
	// 메뉴 바깥 영역 클릭 시 메뉴 숨김 처리
	$(document).mouseup(function (e) {
		var container = $("#menu");
		if (!container.is(e.target) && container.has(e.target).length === 0){
			menu_remove();
		}	
	});
	// 메뉴 숨김 함수
	function menu_remove(){
		$("#menu ul a").removeClass("menu_on");
		$("#menu ul a").children('i').removeClass("caret_left").addClass("caret_down");
		$("#menu ul").removeClass('block');
		$(".navigation").removeClass('show').addClass('left')
	}
	
	
});