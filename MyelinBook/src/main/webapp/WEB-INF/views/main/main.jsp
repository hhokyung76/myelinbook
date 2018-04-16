<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<title>로그인</title>
	
	<link rel="stylesheet" href="<c:url value="/css/reset.css" />"/>
	<link rel="stylesheet" href="<c:url value="/css/style.css" />"/>
	<link rel="stylesheet" href="<c:url value="/css/theme.css" />"/>
	
	<!-- font-awesome -->
	<link rel="stylesheet" href="plugin/font-awesome/font-awesome-4.7.0/css/font-awesome.css">
	
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
	<!--<script src="http://code.jquery.com/jquery-1.7.2.min.js "></script>-->
	
	<!-- 제이쿼리 -->
	<script src="js/jquery-1.11.1.min.js"></script>
	<!-- 공통 js -->
	<script src="js/custom.js"></script>
</head>

<body>
	<div class="wrap"> 
		<header class="top_section"> 
			<jsp:include page="../header/top_navi.jsp" flush="false" />
		</header>
	</div>
</body>
	
</html>