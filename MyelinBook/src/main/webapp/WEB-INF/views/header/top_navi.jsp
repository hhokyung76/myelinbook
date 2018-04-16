<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="clearfix navigation left" id="menu">
	<div class="logo_box"> 
		<a href="#none">
			<h1>LOGO</h1>
		</a>
	</div>	
	<ul class="gnb">
		<li>
			<a href="#none">고객사 <i class="caret caret_down"></i></a>
			<ul class="snb">
				<li><a href="/customermenu/customer">고객사관리</a></li>
				<li><a href="/customermenu/brand">브랜드관리</a></li>
				<li><a href="/customermenu/contract">계약관리</a></li>
			</ul>
		</li>
		<li>
			<a href="#none">입고 <i class="caret caret_down"></i></a>
			<ul class="snb">
				<li><a href="/warehousing/product">제품관리</a></li>
				<li><a href="/warehousing/warehousing">입고관리</a></li>
			</ul>
		</li>
		<li>
			<a href="#none">촬영 <i class="caret caret_down"></i></a>
			<ul class="snb">
				<li><a href="/photo/photo_assign">촬영작업분배</a></li>
				<li><a href="#none">촬영관리</a></li>
			</ul>
		</li>
		<li>
			<a href="#none">편집 <i class="caret caret_down"></i></a>
			<ul class="snb">
				<li><a href="/edit/edit_assign">편집작업분배</a></li>
				<li><a href="#none">편집관리</a></li>
			</ul>	
		</li>
		<li>
			<a href="#none">컨펌 <i class="caret caret_down"></i></a>
			<ul class="snb">
				<li><a href="/confirm/confirm_admin">관리자</a></li>
				<li><a href="/confirm/confirm_customer">고객사</a></li>
			</ul>
		</li>
		<li>
			<a href="#none">작업통계정보</a>
			<!-- <ul class="snb">
			</ul> -->
		</li>
		<li>
			<a href="#none">운영관리 <i class="caret caret_down"></i></a>
			<ul class="snb">
				<li><a href="/operate/user">사용자관리</a></li>
				<li><a href="/operate/category">카테고리관리</a></li>
				<li><a href="/operate/rfid">RFID 태그관리</a></li>
				<li><a href="/operate/code">코드관리</a></li>
				<li><a href="/operate/menu">메뉴관리</a></li>
				<li><a href="/operate/authority">권한관리</a></li>
			</ul>
		</li>
	</ul>
	
	
	<a id="showmenu" href="#none"><i class="fa fa-align-justify"></i></a>
	
	<ol class="member">
		<li>홍길동</li>
		<li><a href="#none">내정보</a></li>
		<li><a href="/logout.do">로그아웃</a></li>
	</ol>	
</nav>